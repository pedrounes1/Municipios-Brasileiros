# Municípios Brasileiros [![Build Status](https://app.travis-ci.com/pedrounes1/Municipios-Brasileiros.svg?branch=main)](https://app.travis-ci.com/pedrounes1/Municipios-Brasileiros)

Arquivos `SQL`, `CSV` e `JSON` contendo o código IBGE, nome do município, capital, código UF, UF, estado, microrregião, mesorregião, latitude e longitude de todos (ou quase todos) os municípios brasileiros. Total de 5.570 registros.

Esse repositório é um fork do trabalho incrível feito pelo [kelvins](https://github.com/kelvins/Municipios-Brasileiros). Eu tomei a liberdade de incluir microrregiões e mesorregiões, para atender as minhas necessidades específicas. Para isso, além de criar os arquivos de mesos e microrregiões, criei um chamado cidades, que faz os vínculos com as mesorregiões e microrregiões. Os arquivos (originais) de estados e municípios mantem a compatibilidade com o repositório do Kelvins.

Os dados de microrregiões e mesorregiões estão disponíveis na tabela de Divisão Territorial Brasileira, acessível no [site do IBGE](https://www.ibge.gov.br/geociencias/organizacao-do-territorio/estrutura-territorial/23701-divisao-territorial-brasileira.html?=&t=acesso-ao-produto)

Como o IBGE não possui um identificador único para microrregiões e mesorregiões, optei por criar um id próprio sequencial para cada micro/mesorregião. Os scripts de criação dos ids e processamento dos arquivos foi feito em python e estão disponíveis em `scripts\tratativas.py`, junto com seu respectivo arquivo `requirements.txt`.

## Exemplos

### Dados

| Código IBGE |  Nome do Município  | Código UF | UF |       Estado      | Capital | Latitude | Longitude | Código Siafi | DDD |     Fuso Horário    | Micro Id | Meso Id |
|:-----------:|:-------------------:|:---------:|:--:|:-----------------:|:-------:|:--------:|:---------:|:------------:|:---:|:-------------------:|:--------:|:-------:|
|   5200050   | Abadia de Goiás     |     52    | GO | Goiás             |    0    | -16.7573 |  -49.4412 |     1050     |  62 | America/Sao_Paulo   |    540   |    132  |
|   3100104   | Abadia dos Dourados |     31    | MG | Minas Gerais      |    0    | -18.4831 |  -47.3916 |     4001     |  34 | America/Sao_Paulo   |    253   |     63  |
|   5200100   | Abadiânia           |     52    | GO | Goiás             |    0    | -16.1970 |  -48.7057 |     9201     |  62 | America/Sao_Paulo   |    541   |    133  |
|   3100203   | Abaeté              |     31    | MG | Minas Gerais      |    0    | -19.1551 |  -45.4444 |     4003     |  37 | America/Sao_Paulo   |    254   |     64  |
|   4314902   | Porto Alegre        |     43    | RS | Rio Grande do Sul |    1    | -30.0318 |  -51.2065 |     8801     |  51 | America/Sao_Paulo   |    482   |    119  |
|   5106752   | Pontes e Lacerda    |     51    | MT | Mato Grosso       |    0    | -15.2219 |  -59.3435 |     8999     |  65 | America/Porto_Velho |    535   |    131  |

### Exemplo SQL

#### Estados

```sql
CREATE TABLE estados(
    codigo_uf INT NOT NULL,
    uf VARCHAR(2) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    latitude FLOAT(8) NOT NULL,
    longitude FLOAT(8) NOT NULL,
    PRIMARY KEY (codigo_uf)
);

INSERT INTO estados VALUES
(11,'RO','Rondônia',-10.83,-63.34),
(12,'AC','Acre',-8.77,-70.55),
(13,'AM','Amazonas',-3.47,-65.1),
...
```

#### Municípios

```sql
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
(5200050, 'Abadia de Goiás', -16.7573, -49.4412, FALSE, 52, '1050', 62, 'America\/Sao_Paulo', 132, 540),
(3100104, 'Abadia dos Dourados', -18.4831, -47.3916, FALSE, 31, '4001', 34, 'America\/Sao_Paulo', 63, 253),
(5200100, 'Abadiânia', -16.197, -48.7057, FALSE, 52, '9201', 62, 'America\/Sao_Paulo', 133, 541),
(3100203, 'Abaeté', -19.1551, -45.4444, FALSE, 31, '4003', 37, 'America\/Sao_Paulo', 64, 254),
(1500107, 'Abaetetuba', -1.72183, -48.8788, FALSE, 15, '0401', 91, 'America\/Sao_Paulo', 11, 31)
...
```

### Exemplo CSV

#### Estados

```csv
codigo_uf,uf,nome
11,RO,Rondônia,-10.83,-63.34
12,AC,Acre,-8.77,-70.55
13,AM,Amazonas,-3.47,-65.1
...
```

#### Municípios

```csv
id,nome,latitude,longitude,capital,codigo_uf,siafi_id,ddd,fuso_horario,micro_id,meso_id
5200050,Abadia de Goiás,-16.7573,-49.4412,0,52,1050,62,America/Sao_Paulo,540,132
3100104,Abadia dos Dourados,-18.4831,-47.3916,0,31,4001,34,America/Sao_Paulo,253,63
5200100,Abadiânia,-16.197,-48.7057,0,52,9201,62,America/Sao_Paulo,541,133
...
```

### Exemplo JSON

#### Estados

```json
[
  {
    "codigo_uf": 11,
    "uf": "RO",
    "nome": "Rondônia",
    "latitude": -10.83,
    "longitude": -63.34
  },
  {
    "codigo_uf": 12,
    "uf": "AC",
    "nome": "Acre",
    "latitude": -8.77,
    "longitude": -70.55
  },
  {
    "codigo_uf": 13,
    "uf": "AM",
    "nome": "Amazonas",
    "latitude": -3.47,
    "longitude": -65.1
  }
]
```

#### Municípios

```json
[
    {
        "id": 5200050,
        "nome": "Abadia de Goiás",
        "latitude": -16.7573,
        "longitude": -49.4412,
        "capital": 0,
        "codigo_uf": 52,
        "siafi_id": 1050,
        "ddd": 62,
        "fuso_horario": "America\/Sao_Paulo",
        "micro_id": 540,
        "meso_id": 132
    },
    {
        "id": 3100104,
        "nome": "Abadia dos Dourados",
        "latitude": -18.4831,
        "longitude": -47.3916,
        "capital": 0,
        "codigo_uf": 31,
        "siafi_id": 4001,
        "ddd": 34,
        "fuso_horario": "America\/Sao_Paulo",
        "micro_id": 253,
        "meso_id": 63
    },
    {
        "id": 5200100,
        "nome": "Abadiânia",
        "latitude": -16.197,
        "longitude": -48.7057,
        "capital": 0,
        "codigo_uf": 52,
        "siafi_id": 9201,
        "ddd": 62,
        "fuso_horario": "America\/Sao_Paulo",
        "micro_id": 541,
        "meso_id": 133
    }
]
```


**Nota**: caso encontre qualquer dado inconsistente ou tenha alguma sugestão por favor crie uma [issue](https://github.com/pedrounes1/Municipios-Brasileiros/issues) ou envie um [pull request](https://github.com/pedrounes1/Municipios-Brasileiros/pulls) diretamente.

Obrigado a todos os [colaboradores](https://github.com/kelvins/Municipios-Brasileiros/graphs/contributors). :raised_hands:

## Exportação dos Dados

Existem diversas ferramentas para trabalhar com bancos de dados e exportar os dados em outros formatos como `CSV`, `JSON`, entre outros.
Uma ferramenta que costumo utilizar com frequência é o [DBeaver](https://dbeaver.io/), pois além de ser multiplataforma ela é simples de usar e disponibiliza várias opções para a exportação dos dados.

## Serviço de Dados do IBGE

Hoje o IBGE conta com um serviço de dados que disponibiliza diversas informações sobre as localidades do Brasil.

A API do IBGE pode ser acessada pelo seguinte endereço: https://servicodados.ibge.gov.br/api/docs/localidades
