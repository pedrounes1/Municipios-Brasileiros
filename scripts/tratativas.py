import os
import pandas as pd

DIR = os.path.dirname(__file__)


def p(arquivo: str):
    """Função para gerar o path (por isso p) para abrir e exportar os arquivos. `p` é mais curto que "`os.path.join(DIR, "../nome_do_arquivo"`

    Args:
        arquivo (str): nome do arquivo com extensão a ser aberto/salvo

    Returns:
        StrPath: Caminho completo para o arquivo, considerando a constante `DIR`.
    """
    return os.path.join(DIR, f'../{arquivo}')


def trataDados():
    # Lê os arquivos
    dados_ibge = pd.read_excel(p('RELATORIO_DTB_BRASIL_MUNICIPIO.xls'), engine='xlrd')
    dados_cidades = pd.read_csv(p('csv/municipios.csv'))

    # Renomeia as colunas
    dados_ibge.columns = ['codigo_uf', 'uf', 'reg_int_id', 'reg_int', 'reg_imed_id', 'reg_imed', 'meso_id', 'meso', 'micro_id', 'micro', 'muni_id', 'codigo_ibge', 'muni']

    # Separa os dataframes
    mesos = dados_ibge[['codigo_uf', 'meso_id', 'meso']].drop_duplicates().reset_index(drop=True).reset_index().rename(columns={'index': 'id'})
    micros = dados_ibge[['codigo_uf', 'meso_id', 'micro_id', 'micro']].drop_duplicates().reset_index(drop=True).reset_index().rename(columns={'index': 'id'})
    cidades = dados_ibge[['codigo_uf', 'meso_id', 'micro_id', 'muni_id', 'codigo_ibge']]

    del dados_ibge
    # Arrumo os ids criados para mesorregiões e microrregiões:
    mesos['id'] = mesos['id'] + 1
    micros['id'] = micros['id'] + 1

    # Os dados de estados e mesorregiões estão prontos para inserção no banco.
    # Microrregiões e cidades precisam pegar os ids das tabelas pai, criados acima.
    # Começando por microrregiões:
    micros = micros.merge(mesos[['id', 'meso_id', 'codigo_uf']], how='inner', on=['meso_id', 'codigo_uf'], suffixes=('_micro', '_meso'))

    # Antes de tratar municípios, vou juntar os dados de municipio do ibge com os dados do repo
    cidades = dados_cidades.merge(cidades, how="left", on=['codigo_ibge', 'codigo_uf'])

    del dados_cidades
    # Junto micros para pegar o id criado:
    cidades = cidades.merge(micros, how='left', on=['codigo_uf', 'meso_id', 'micro_id'], suffixes=('_muni', '_micros'))

    # Limpo os dfs para ficar apenas com as colunas que preciso.
    mesos = mesos[['id', 'meso_id', 'meso', 'codigo_uf']].rename(columns={'meso_id': 'ibge_id', 'meso': 'nome'})
    micros = micros[['id_micro', 'micro_id', 'micro', 'codigo_uf', 'id_meso']].rename(columns={'id_micro': 'id', 'micro_id': 'ibge_id', 'micro': 'nome', 'id_meso': 'meso_id'})
    cidades = cidades[['codigo_ibge', 'nome', 'latitude', 'longitude', 'capital', 'codigo_uf', 'siafi_id', 'ddd', 'fuso_horario', 'id_micro', 'id_meso']]
    cidades = cidades.rename(columns={'codigo_ibge': 'id', 'id_micro': 'micro_id', 'id_meso': 'meso_id'})

    # Exporta os dados:
    # CSV
    mesos.to_csv(p('csv/mesorregioes.csv'), index=False)
    micros.to_csv(p('csv/microrregioes.csv'), index=False)
    cidades.to_csv(p('csv/cidades.csv'), index=False)

    # JSON
    mesos.to_json(p('json/mesorregioes.json'), orient="records", force_ascii=False)
    micros.to_json(p('json/microrregioes.json'), orient="records", force_ascii=False)
    cidades.to_json(p('json/cidades.json'), orient="records", force_ascii=False)

    # SQL
    meso_sql = '''
DROP TABLE IF EXISTS mesorregioes;

CREATE TABLE mesorregioes(
  id INT NOT NULL,
  ibge_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  codigo_uf INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (codigo_uf) REFERENCES estados (codigo_uf)
);

INSERT INTO mesorregioes VALUES
'''
    for i, meso in enumerate(mesos.to_dict(orient='records')):
        meso_sql += f"({meso['id']}, {meso['ibge_id']}, '{meso['nome']}', {meso['codigo_uf']})"
        meso_sql += ';' if i == len(mesos) - 1 else ',\n'
    with open(p('sql/mesorregioes.sql'), 'w', encoding='utf-8') as file:
        file.write(meso_sql)

    del meso_sql, mesos

    micro_sql = '''
DROP TABLE IF EXISTS microrregioes;

CREATE TABLE microrregioes(
  id INT NOT NULL,
  ibge_id INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  codigo_uf INT NOT NULL,
  meso_id INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (codigo_uf) REFERENCES estados (codigo_uf),
  FOREIGN KEY (meso_id) REFERENCES mesorregioes (id),
  CONSTRAINT microId_UF UNIQUE (ibge_id, codigo_uf)
);

INSERT INTO microrregioes VALUES
'''
    for i, micro in enumerate(micros.to_dict(orient='records')):
        micro['nome'] = micro['nome'].replace("'", "''")
        micro_sql += f"({micro['id']}, {micro['ibge_id']}, '{micro['nome']}', {micro['codigo_uf']}, {micro['meso_id']})"
        micro_sql += ';' if i == len(micros) - 1 else ',\n'

    with open(p('sql/microrregioes.sql'), 'w', encoding='utf-8') as file:
        file.write(micro_sql)

    del micro_sql, micros

    cidade_sql = '''
DROP TABLE IF EXISTS cidades;
CREATE TABLE cidades (
  codigo_ibge INT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  latitude FLOAT(8) NOT NULL,
  longitude FLOAT(8) NOT NULL,
  capital BOOLEAN NOT NULL,
  codigo_uf INT NOT NULL,
  siafi_id VARCHAR(4) NOT NULL UNIQUE,
  ddd INT NOT NULL,
  fuso_horario VARCHAR(32) NOT NULL,
  meso_id INT NOT NULL,
  micro_id INT NOT NULL,

  PRIMARY KEY (codigo_ibge),
  FOREIGN KEY (codigo_uf) REFERENCES estados (codigo_uf),
  FOREIGN KEY (meso_id) REFERENCES mesorregioes (id),
  FOREIGN KEY (micro_id) REFERENCES microrregioes (id)
);

INSERT INTO cidades VALUES
'''
    for i, cidade in enumerate(cidades.to_dict(orient='records')):
        cidade['fuso_horario'] = str(cidade['fuso_horario']).replace(r'/', r'\/')
        cidade['nome'] = cidade['nome'].replace("'", "''")
        cidade_sql += f"({cidade['id']}, '{cidade['nome']}', {cidade['latitude']}, {cidade['longitude']}, {str(cidade['capital']).upper()}, {cidade['codigo_uf']}, '{str(cidade['siafi_id']).zfill(4)}', {cidade['ddd']}, '{cidade['fuso_horario']}', {cidade['meso_id']}, {cidade['micro_id']})"
        cidade_sql += ';' if i == len(cidades) - 1 else ',\n'

    with open(p('sql/cidades.sql'), 'w', encoding='utf-8') as file:
        file.write(cidade_sql)

    print("Arquivos processados com sucesso!")


if __name__ == "__main__":
    trataDados()
