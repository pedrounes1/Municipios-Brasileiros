
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
  CONSTRAINT microId_UF UNIQUE (ibge_id, codigo_uf),
)

INSERT INTO microrregioes VALUES
(1, 6, 'Cacoal', 11, 1),
(2, 3, 'Ariquemes', 11, 1),
(3, 5, 'Alvorada D''Oeste', 11, 1),
(5, 8, 'Colorado do Oeste', 11, 1),
(6, 7, 'Vilhena', 11, 1),
(8, 4, 'Ji-Paraná', 11, 1),
(4, 1, 'Porto Velho', 11, 2),
(7, 2, 'Guajará-Mirim', 11, 2),
(9, 4, 'Rio Branco', 12, 3),
(10, 5, 'Brasiléia', 12, 3),
(13, 3, 'Sena Madureira', 12, 3),
(11, 1, 'Cruzeiro do Sul', 12, 4),
(12, 2, 'Tarauacá', 12, 4),
(14, 5, 'Tefé', 13, 5),
(16, 6, 'Coari', 13, 5),
(18, 7, 'Manaus', 13, 5),
(20, 10, 'Parintins', 13, 5),
(24, 9, 'Itacoatiara', 13, 5),
(26, 8, 'Rio Preto da Eva', 13, 5),
(15, 3, 'Alto Solimões', 13, 6),
(23, 4, 'Juruá', 13, 6),
(17, 13, 'Madeira', 13, 7),
(21, 11, 'Boca do Acre', 13, 7),
(22, 12, 'Purus', 13, 7),
(19, 1, 'Rio Negro', 13, 8),
(25, 2, 'Japurá', 13, 8),
(27, 1, 'Boa Vista', 14, 9),
(28, 2, 'Nordeste de Roraima', 14, 9),
(29, 3, 'Caracaraí', 14, 10),
(30, 4, 'Sudeste de Roraima', 14, 10),
(31, 11, 'Cametá', 15, 11),
(33, 12, 'Tomé-Açu', 15, 11),
(40, 10, 'Bragantina', 15, 11),
(41, 13, 'Guamá', 15, 11),
(49, 9, 'Salgado', 15, 11),
(32, 17, 'Paragominas', 15, 12),
(35, 19, 'Parauapebas', 15, 12),
(44, 18, 'São Félix do Xingu', 15, 12),
(45, 20, 'Marabá', 15, 12),
(46, 16, 'Tucuruí', 15, 12),
(50, 22, 'Conceição do Araguaia', 15, 12),
(52, 21, 'Redenção', 15, 12),
(34, 5, 'Furos de Breves', 15, 13),
(43, 4, 'Portel', 15, 13),
(48, 6, 'Arari', 15, 13),
(36, 2, 'Santarém', 15, 14),
(37, 3, 'Almeirim', 15, 14),
(51, 1, 'Óbidos', 15, 14),
(38, 15, 'Altamira', 15, 15),
(42, 14, 'Itaituba', 15, 15),
(39, 7, 'Belém', 15, 16),
(47, 8, 'Castanhal', 15, 16),
(53, 2, 'Amapá', 16, 17),
(54, 1, 'Oiapoque', 16, 17),
(55, 3, 'Macapá', 16, 18),
(56, 4, 'Mazagão', 16, 18),
(57, 3, 'Miracema do Tocantins', 17, 19),
(58, 1, 'Bico do Papagaio', 17, 19),
(59, 5, 'Gurupi', 17, 19),
(62, 2, 'Araguaína', 17, 19),
(63, 4, 'Rio Formoso', 17, 19),
(60, 8, 'Dianópolis', 17, 20),
(61, 6, 'Porto Nacional', 17, 20),
(64, 7, 'Jalapão', 17, 20),
(65, 9, 'Imperatriz', 21, 21),
(69, 8, 'Pindaré', 21, 21),
(72, 7, 'Gurupi', 21, 21),
(66, 16, 'Coelho Neto', 21, 22),
(67, 13, 'Baixo Parnaíba Maranhense', 21, 22),
(70, 15, 'Codó', 21, 22),
(74, 14, 'Chapadinha', 21, 22),
(78, 18, 'Chapadas do Alto Itapecuru', 21, 22),
(81, 17, 'Caxias', 21, 22),
(68, 1, 'Litoral Ocidental Maranhense', 21, 23),
(73, 5, 'Baixada Maranhense', 21, 23),
(76, 3, 'Rosário', 21, 23),
(79, 4, 'Lençóis Maranhenses', 21, 23),
(83, 6, 'Itapecuru Mirim', 21, 23),
(85, 2, 'Aglomeração Urbana de São Luís', 21, 23),
(71, 20, 'Gerais de Balsas', 21, 24),
(80, 21, 'Chapadas das Mangabeiras', 21, 24),
(82, 19, 'Porto Franco', 21, 24),
(75, 11, 'Alto Mearim e Grajaú', 21, 25),
(77, 10, 'Médio Mearim', 21, 25),
(84, 12, 'Presidente Dutra', 21, 25),
(86, 15, 'Alto Médio Canindé', 22, 26),
(88, 14, 'Pio IX', 22, 26),
(95, 13, 'Picos', 22, 26),
(87, 5, 'Médio Parnaíba Piauiense', 22, 27),
(89, 4, 'Campo Maior', 22, 27),
(90, 3, 'Teresina', 22, 27),
(94, 6, 'Valença do Piauí', 22, 27),
(91, 10, 'Alto Médio Gurguéia', 22, 28),
(92, 11, 'São Raimundo Nonato', 22, 28),
(93, 8, 'Bertolínia', 22, 28),
(96, 12, 'Chapadas do Extremo Sul Piauiense', 22, 28),
(97, 7, 'Alto Parnaíba Piauiense', 22, 28),
(100, 9, 'Floriano', 22, 28),
(98, 1, 'Baixo Parnaíba Piauiense', 22, 29),
(99, 2, 'Litoral Piauiense', 22, 29),
(101, 33, 'Brejo Santo', 23, 30),
(107, 30, 'Caririaçu', 23, 30),
(115, 29, 'Chapada do Araripe', 23, 30),
(116, 31, 'Barro', 23, 30),
(119, 32, 'Cariri', 23, 30),
(102, 13, 'Baturité', 23, 31),
(109, 8, 'Itapipoca', 23, 31),
(111, 11, 'Médio Curu', 23, 31),
(120, 14, 'Chorozinho', 23, 31),
(121, 15, 'Cascavel', 23, 31),
(122, 12, 'Canindé', 23, 31),
(131, 10, 'Uruburetama', 23, 31),
(133, 9, 'Baixo Curu', 23, 31),
(103, 1, 'Litoral de Camocim e Acaraú', 23, 32),
(106, 4, 'Meruoca', 23, 32),
(123, 5, 'Sobral', 23, 32),
(124, 2, 'Ibiapaba', 23, 32),
(125, 7, 'Santa Quitéria', 23, 32),
(127, 3, 'Coreaú', 23, 32),
(130, 6, 'Ipu', 23, 32),
(104, 21, 'Sertão de Senador Pompeu', 23, 33),
(105, 20, 'Sertão de Inhamuns', 23, 33),
(114, 18, 'Sertão de Cratéus', 23, 33),
(118, 19, 'Sertão de Quixeramobim', 23, 33),
(108, 23, 'Baixo Jaguaribe', 23, 34),
(113, 22, 'Litoral de Aracati', 23, 34),
(128, 25, 'Serra do Pereiro', 23, 34),
(132, 24, 'Médio Jaguaribe', 23, 34),
(110, 27, 'Várzea Alegre', 23, 35),
(117, 28, 'Lavras da Mangabeira', 23, 35),
(126, 26, 'Iguatu', 23, 35),
(112, 16, 'Fortaleza', 23, 36),
(129, 17, 'Pacajus', 23, 36),
(134, 12, 'Seridó Oriental', 24, 37),
(136, 9, 'Angicos', 24, 37),
(145, 10, 'Serra de Santana', 24, 37),
(147, 8, 'Macau', 24, 37),
(148, 11, 'Seridó Ocidental', 24, 37),
(135, 4, 'Vale do Açu', 24, 38),
(137, 5, 'Serra de São Miguel', 24, 38),
(138, 6, 'Pau dos Ferros', 24, 38),
(139, 7, 'Umarizal', 24, 38),
(140, 2, 'Chapada do Apodi', 24, 38),
(141, 1, 'Mossoró', 24, 38),
(149, 3, 'Médio Oeste', 24, 38),
(142, 19, 'Litoral Sul', 24, 39),
(150, 17, 'Macaíba', 24, 39),
(151, 18, 'Natal', 24, 39),
(152, 16, 'Litoral Nordeste', 24, 39),
(143, 14, 'Borborema Potiguar', 24, 40),
(144, 13, 'Baixa Verde', 24, 40),
(146, 15, 'Agreste Potiguar', 24, 40),
(153, 7, 'Serra do Teixeira', 25, 41),
(154, 5, 'Piancó', 25, 41),
(161, 3, 'Sousa', 25, 41),
(163, 4, 'Patos', 25, 41),
(169, 1, 'Catolé do Rocha', 25, 41),
(170, 2, 'Cajazeiras', 25, 41),
(171, 6, 'Itaporanga', 25, 41),
(155, 15, 'Brejo Paraibano', 25, 42),
(156, 16, 'Guarabira', 25, 42),
(158, 12, 'Curimataú Ocidental', 25, 42),
(162, 13, 'Curimataú Oriental', 25, 42),
(164, 14, 'Esperança', 25, 42),
(165, 19, 'Umbuzeiro', 25, 42),
(172, 17, 'Campina Grande', 25, 42),
(173, 18, 'Itabaiana', 25, 42),
(157, 11, 'Cariri Oriental', 25, 43),
(160, 10, 'Cariri Ocidental', 25, 43),
(167, 9, 'Seridó Oriental Paraibano', 25, 43),
(175, 8, 'Seridó Ocidental Paraibano', 25, 43),
(159, 23, 'Litoral Sul', 25, 44),
(166, 20, 'Litoral Norte', 25, 44),
(168, 22, 'João Pessoa', 25, 44),
(174, 21, 'Sapé', 25, 44),
(176, 17, 'Recife', 26, 45),
(185, 16, 'Itamaracá', 26, 45),
(190, 18, 'Suape', 26, 45),
(194, 19, 'Fernando de Noronha', 26, 45),
(177, 3, 'Pajeú', 26, 46),
(186, 1, 'Araripina', 26, 46),
(187, 4, 'Sertão do Moxotó', 26, 46),
(192, 2, 'Salgueiro', 26, 46),
(178, 5, 'Petrolina', 26, 47),
(188, 6, 'Itaparica', 26, 47),
(179, 12, 'Brejo Pernambucano', 26, 48),
(181, 7, 'Vale do Ipanema', 26, 48),
(182, 8, 'Vale do Ipojuca', 26, 48),
(184, 11, 'Garanhuns', 26, 48),
(189, 10, 'Médio Capibaribe', 26, 48),
(191, 9, 'Alto Capibaribe', 26, 48),
(180, 15, 'Mata Meridional Pernambucana', 26, 49),
(183, 13, 'Mata Setentrional Pernambucana', 26, 49),
(193, 14, 'Vitória de Santo Antão', 26, 49),
(195, 1, 'Serrana do Sertão Alagoano', 27, 50),
(200, 4, 'Batalha', 27, 50),
(202, 3, 'Santana do Ipanema', 27, 50),
(204, 2, 'Alagoana do Sertão do São Francisco', 27, 50),
(196, 12, 'São Miguel dos Campos', 27, 51),
(198, 9, 'Mata Alagoana', 27, 51),
(199, 11, 'Maceió', 27, 51),
(203, 8, 'Serrana dos Quilombos', 27, 51),
(205, 13, 'Penedo', 27, 51),
(206, 10, 'Litoral Norte Alagoano', 27, 51),
(197, 6, 'Arapiraca', 27, 52),
(201, 5, 'Palmeira dos Índios', 27, 52),
(207, 7, 'Traipu', 27, 52),
(208, 7, 'Propriá', 28, 53),
(210, 11, 'Aracaju', 28, 53),
(211, 12, 'Boquim', 28, 53),
(214, 8, 'Cotinguiba', 28, 53),
(216, 10, 'Baixo Cotinguiba', 28, 53),
(217, 13, 'Estância', 28, 53),
(218, 9, 'Japaratuba', 28, 53),
(209, 3, 'Nossa Senhora das Dores', 28, 54),
(212, 4, 'Agreste de Itabaiana', 28, 54),
(219, 6, 'Agreste de Lagarto', 28, 54),
(220, 5, 'Tobias Barreto', 28, 54),
(213, 1, 'Sergipana do Sertão do São Francisco', 28, 55),
(215, 2, 'Carira', 28, 55),
(221, 23, 'Seabra', 29, 56),
(226, 24, 'Jequié', 29, 56),
(231, 28, 'Vitória da Conquista', 29, 56),
(234, 27, 'Brumado', 29, 56),
(241, 22, 'Boquira', 29, 56),
(242, 26, 'Guanambi', 29, 56),
(251, 25, 'Livramento do Brumado', 29, 56),
(252, 29, 'Itapetinga', 29, 56),
(222, 5, 'Paulo Afonso', 29, 57),
(239, 6, 'Barra', 29, 57),
(240, 7, 'Bom Jesus da Lapa', 29, 57),
(246, 4, 'Juazeiro', 29, 57),
(223, 17, 'Alagoinhas', 29, 58),
(224, 15, 'Ribeira do Pombal', 29, 58),
(235, 16, 'Serrinha', 29, 58),
(248, 14, 'Euclides da Cunha', 29, 58),
(249, 18, 'Entre Rios', 29, 58),
(250, 13, 'Jeremoabo', 29, 58),
(225, 12, 'Feira de Santana', 29, 59),
(230, 9, 'Irecê', 29, 59),
(232, 8, 'Senhor do Bonfim', 29, 59),
(238, 11, 'Itaberaba', 29, 59),
(243, 10, 'Jacobina', 29, 59),
(227, 32, 'Porto Seguro', 29, 60),
(228, 31, 'Ilhéus-Itabuna', 29, 60),
(244, 30, 'Valença', 29, 60),
(229, 19, 'Catu', 29, 61),
(236, 20, 'Santo Antônio de Jesus', 29, 61),
(245, 21, 'Salvador', 29, 61),
(233, 2, 'Cotegipe', 29, 62),
(237, 1, 'Barreiras', 29, 62),
(247, 3, 'Santa Maria da Vitória', 29, 62),
(253, 19, 'Patrocínio', 31, 63),
(259, 22, 'Uberaba', 31, 63),
(281, 18, 'Uberlândia', 31, 63),
(282, 20, 'Patos de Minas', 31, 63),
(284, 23, 'Araxá', 31, 63),
(308, 17, 'Ituiutaba', 31, 63),
(309, 21, 'Frutal', 31, 63),
(254, 24, 'Três Marias', 31, 64),
(283, 26, 'Bom Despacho', 31, 64),
(290, 25, 'Curvelo', 31, 64),
(255, 61, 'Manhuaçu', 31, 65),
(256, 60, 'Ponte Nova', 31, 65),
(267, 66, 'Cataguases', 31, 65),
(273, 62, 'Viçosa', 31, 65),
(277, 63, 'Muriaé', 31, 65),
(279, 65, 'Juiz de Fora', 31, 65),
(288, 64, 'Ubá', 31, 65),
(257, 39, 'Ipatinga', 31, 66),
(258, 36, 'Peçanha', 31, 66),
(263, 41, 'Aimorés', 31, 66),
(271, 37, 'Governador Valadares', 31, 66),
(296, 40, 'Caratinga', 31, 66),
(303, 35, 'Guanhães', 31, 66),
(314, 38, 'Mantena', 31, 66),
(260, 45, 'Campo Belo', 31, 67),
(286, 44, 'Formiga', 31, 67),
(291, 42, 'Piuí', 31, 67),
(298, 46, 'Oliveira', 31, 67),
(310, 43, 'Divinópolis', 31, 67),
(261, 16, 'Nanuque', 31, 68),
(289, 15, 'Teófilo Otoni', 31, 68),
(262, 5, 'Salinas', 31, 69),
(295, 9, 'Bocaiúva', 31, 69),
(299, 3, 'Januária', 31, 69),
(300, 8, 'Grão Mogol', 31, 69),
(302, 7, 'Montes Claros', 31, 69),
(305, 6, 'Pirapora', 31, 69),
(313, 4, 'Janaúba', 31, 69),
(264, 55, 'Andrelândia', 31, 70),
(265, 54, 'São Lourenço', 31, 70),
(266, 51, 'Poços de Caldas', 31, 70),
(268, 49, 'Alfenas', 31, 70),
(272, 47, 'Passos', 31, 70),
(285, 48, 'São Sebastião do Paraíso', 31, 70),
(294, 50, 'Varginha', 31, 70),
(297, 52, 'Pouso Alegre', 31, 70),
(304, 56, 'Itajubá', 31, 70),
(306, 53, 'Santa Rita do Sapucaí', 31, 70),
(269, 59, 'Barbacena', 31, 71),
(311, 57, 'Lavras', 31, 71),
(315, 58, 'São João Del Rei', 31, 71),
(270, 14, 'Almenara', 31, 72),
(276, 11, 'Capelinha', 31, 72),
(280, 12, 'Araçuaí', 31, 72),
(307, 13, 'Pedra Azul', 31, 72),
(316, 10, 'Diamantina', 31, 72),
(274, 31, 'Itabira', 31, 73),
(275, 28, 'Conceição do Mato Dentro', 31, 73),
(278, 27, 'Sete Lagoas', 31, 73),
(292, 30, 'Belo Horizonte', 31, 73),
(293, 32, 'Itaguara', 31, 73),
(312, 34, 'Conselheiro Lafaiete', 31, 73),
(317, 33, 'Ouro Preto', 31, 73),
(318, 29, 'Pará de Minas', 31, 73),
(287, 1, 'Unaí', 31, 74),
(301, 2, 'Paracatu', 31, 74),
(319, 7, 'Afonso Cláudio', 32, 75),
(323, 10, 'Guarapari', 32, 75),
(327, 9, 'Vitória', 32, 75),
(329, 8, 'Santa Teresa', 32, 75),
(320, 1, 'Barra de São Francisco', 32, 76),
(321, 2, 'Nova Venécia', 32, 76),
(324, 3, 'Colatina', 32, 76),
(322, 11, 'Alegre', 32, 77),
(325, 12, 'Cachoeiro de Itapemirim', 32, 77),
(330, 13, 'Itapemirim', 32, 77),
(326, 6, 'Linhares', 32, 78),
(328, 5, 'São Mateus', 32, 78),
(331, 4, 'Montanha', 32, 78),
(332, 13, 'Baía da Ilha Grande', 33, 79),
(336, 12, 'Barra do Piraí', 33, 79),
(337, 11, 'Vale do Paraíba Fluminense', 33, 79),
(333, 2, 'Santo Antônio de Pádua', 33, 80),
(340, 1, 'Itaperuna', 33, 80),
(334, 10, 'Lagos', 33, 81),
(345, 9, 'Bacia de São João', 33, 81),
(335, 5, 'Três Rios', 33, 82),
(339, 7, 'Nova Friburgo', 33, 82),
(343, 6, 'Cantagalo-Cordeiro', 33, 82),
(349, 8, 'Santa Maria Madalena', 33, 82),
(338, 18, 'Rio de Janeiro', 33, 83),
(341, 16, 'Macacu-Caceribu', 33, 83),
(346, 14, 'Vassouras', 33, 83),
(347, 17, 'Itaguaí', 33, 83),
(348, 15, 'Serrana', 33, 83),
(342, 3, 'Campos dos Goytacazes', 33, 84),
(344, 4, 'Macaé', 33, 84),
(350, 35, 'Adamantina', 35, 85),
(359, 36, 'Presidente Prudente', 35, 85),
(406, 34, 'Dracena', 35, 85),
(351, 4, 'São José do Rio Preto', 35, 86),
(363, 3, 'Votuporanga', 35, 86),
(371, 1, 'Jales', 35, 86),
(378, 5, 'Catanduva', 35, 86),
(383, 6, 'Auriflama', 35, 86),
(407, 2, 'Fernandópolis', 35, 86),
(410, 8, 'Novo Horizonte', 35, 86),
(412, 7, 'Nhandeara', 35, 86),
(352, 29, 'Pirassununga', 35, 87),
(353, 30, 'São João da Boa Vista', 35, 87),
(354, 33, 'Amparo', 35, 87),
(365, 32, 'Campinas', 35, 87),
(379, 31, 'Mogi Mirim', 35, 87),
(355, 22, 'Avaré', 35, 88),
(357, 20, 'Bauru', 35, 88),
(369, 23, 'Botucatu', 35, 88),
(385, 21, 'Jaú', 35, 88),
(397, 19, 'Lins', 35, 88),
(356, 28, 'Piracicaba', 35, 89),
(376, 27, 'Limeira', 35, 89),
(395, 26, 'Rio Claro', 35, 89),
(358, 42, 'Itapetininga', 35, 90),
(372, 44, 'Capão Bonito', 35, 90),
(384, 41, 'Itapeva', 35, 90),
(394, 43, 'Tatuí', 35, 90),
(360, 15, 'Batatais', 35, 91),
(374, 11, 'Ituverava', 35, 91),
(387, 9, 'Barretos', 35, 91),
(388, 14, 'Ribeirão Preto', 35, 91),
(390, 13, 'Jaboticabal', 35, 91),
(403, 12, 'Franca', 35, 91),
(408, 10, 'São Joaquim da Barra', 35, 91),
(361, 18, 'Birigui', 35, 92),
(368, 16, 'Andradina', 35, 92),
(373, 17, 'Araçatuba', 35, 92),
(362, 46, 'Sorocaba', 35, 93),
(382, 48, 'Bragança Paulista', 35, 93),
(399, 47, 'Jundiaí', 35, 93),
(409, 45, 'Piedade', 35, 93),
(364, 38, 'Marília', 35, 94),
(377, 37, 'Tupã', 35, 94),
(366, 24, 'Araraquara', 35, 95),
(367, 25, 'São Carlos', 35, 95),
(370, 51, 'Guaratinguetá', 35, 96),
(375, 52, 'Bananal', 35, 96),
(396, 50, 'São José dos Campos', 35, 96),
(400, 49, 'Campos do Jordão', 35, 96),
(401, 54, 'Caraguatatuba', 35, 96),
(404, 53, 'Paraibuna/Paraitinga', 35, 96),
(380, 59, 'Guarulhos', 35, 97),
(389, 57, 'Osasco', 35, 97),
(392, 63, 'Santos', 35, 97),
(393, 62, 'Mogi das Cruzes', 35, 97),
(398, 58, 'Franco da Rocha', 35, 97),
(402, 60, 'Itapecerica da Serra', 35, 97),
(405, 61, 'São Paulo', 35, 97),
(381, 39, 'Assis', 35, 98),
(391, 40, 'Ourinhos', 35, 98),
(386, 55, 'Registro', 35, 99),
(411, 56, 'Itanhaém', 35, 99),
(413, 15, 'Cornélio Procópio', 41, 100),
(430, 14, 'Assaí', 41, 100),
(432, 16, 'Jacarezinho', 41, 100),
(441, 18, 'Wenceslau Braz', 41, 100),
(445, 17, 'Ibaiti', 41, 100),
(414, 35, 'Cerro Azul', 41, 101),
(415, 39, 'Rio Negro', 41, 101),
(416, 37, 'Curitiba', 41, 101),
(424, 38, 'Paranaguá', 41, 101),
(450, 36, 'Lapa', 41, 101),
(417, 4, 'Goioerê', 41, 102),
(429, 5, 'Campo Mourão', 41, 102),
(418, 2, 'Umuarama', 41, 103),
(419, 1, 'Paranavaí', 41, 103),
(443, 3, 'Cianorte', 41, 103),
(420, 7, 'Porecatu', 41, 104),
(423, 6, 'Astorga', 41, 104),
(426, 10, 'Apucarana', 41, 104),
(428, 13, 'Ivaiporã', 41, 104),
(436, 12, 'Faxinal', 41, 104),
(438, 11, 'Londrina', 41, 104),
(446, 8, 'Floraí', 41, 104),
(451, 9, 'Maringá', 41, 104),
(421, 25, 'Capanema', 41, 105),
(433, 26, 'Francisco Beltrão', 41, 105),
(437, 27, 'Pato Branco', 41, 105),
(422, 23, 'Cascavel', 41, 106),
(431, 22, 'Toledo', 41, 106),
(442, 24, 'Foz do Iguaçu', 41, 106),
(425, 34, 'São Mateus do Sul', 41, 107),
(434, 33, 'União da Vitória', 41, 107),
(447, 31, 'Prudentópolis', 41, 107),
(449, 32, 'Irati', 41, 107),
(427, 20, 'Jaguariaíva', 41, 108),
(440, 21, 'Ponta Grossa', 41, 108),
(448, 19, 'Telêmaco Borba', 41, 108),
(435, 28, 'Pitanga', 41, 109),
(439, 29, 'Guarapuava', 41, 109),
(444, 30, 'Palmas', 41, 109),
(452, 9, 'Curitibanos', 42, 110),
(462, 10, 'Campos de Lages', 42, 110),
(453, 3, 'Xanxerê', 42, 111),
(456, 4, 'Joaçaba', 42, 111),
(457, 2, 'Chapecó', 42, 111),
(459, 5, 'Concórdia', 42, 111),
(460, 1, 'São Miguel do Oeste', 42, 111),
(454, 14, 'Ituporanga', 42, 112),
(455, 11, 'Rio do Sul', 42, 112),
(464, 12, 'Blumenau', 42, 112),
(468, 13, 'Itajaí', 42, 112),
(458, 17, 'Tabuleiro', 42, 113),
(461, 15, 'Tijucas', 42, 113),
(463, 16, 'Florianópolis', 42, 113),
(465, 8, 'Joinville', 42, 114),
(470, 6, 'Canoinhas', 42, 114),
(471, 7, 'São Bento do Sul', 42, 114),
(466, 20, 'Araranguá', 42, 115),
(467, 18, 'Tubarão', 42, 115),
(469, 19, 'Criciúma', 42, 115),
(472, 31, 'Campanha Meridional', 43, 116),
(477, 29, 'Campanha Ocidental', 43, 116),
(506, 30, 'Campanha Central', 43, 116),
(473, 10, 'Passo Fundo', 43, 117),
(475, 8, 'Ijuí', 43, 117),
(476, 1, 'Santa Rosa', 43, 117),
(478, 9, 'Carazinho', 43, 117),
(479, 3, 'Frederico Westphalen', 43, 117),
(480, 11, 'Cruz Alta', 43, 117),
(487, 4, 'Erechim', 43, 117),
(494, 2, 'Três Passos', 43, 117),
(495, 5, 'Sananduva', 43, 117),
(496, 13, 'Soledade', 43, 117),
(498, 7, 'Santo Ângelo', 43, 117),
(501, 6, 'Cerro Largo', 43, 117),
(505, 12, 'Não-Me-Toque', 43, 117),
(474, 19, 'Restinga Seca', 43, 118),
(499, 18, 'Santa Maria', 43, 118),
(503, 17, 'Santiago', 43, 118),
(481, 23, 'Montenegro', 43, 119),
(482, 26, 'Porto Alegre', 43, 119),
(486, 28, 'Camaquã', 43, 119),
(490, 27, 'Osório', 43, 119),
(492, 25, 'São Jerônimo', 43, 119),
(502, 24, 'Gramado-Canela', 43, 119),
(483, 32, 'Serras de Sudeste', 43, 120),
(489, 33, 'Pelotas', 43, 120),
(493, 34, 'Jaguarão', 43, 120),
(504, 35, 'Litoral Lagunar', 43, 120),
(484, 14, 'Guaporé', 43, 121),
(485, 16, 'Caxias do Sul', 43, 121),
(497, 15, 'Vacaria', 43, 121),
(488, 21, 'Lajeado-Estrela', 43, 122),
(491, 20, 'Santa Cruz do Sul', 43, 122),
(500, 22, 'Cachoeira do Sul', 43, 122),
(507, 7, 'Três Lagoas', 50, 123),
(511, 8, 'Nova Andradina', 50, 123),
(513, 6, 'Paranaíba', 50, 123),
(516, 5, 'Cassilândia', 50, 123),
(508, 3, 'Alto Taquari', 50, 124),
(514, 4, 'Campo Grande', 50, 124),
(509, 10, 'Dourados', 50, 125),
(512, 11, 'Iguatemi', 50, 125),
(515, 9, 'Bodoquena', 50, 125),
(510, 2, 'Aquidauana', 50, 126),
(517, 1, 'Baixo Pantanal', 50, 126),
(518, 16, 'Rosário Oeste', 51, 127),
(523, 15, 'Alto Paraguai', 51, 127),
(528, 18, 'Alto Pantanal', 51, 127),
(532, 17, 'Cuiabá', 51, 127),
(519, 10, 'Canarana', 51, 128),
(522, 9, 'Norte Araguaia', 51, 128),
(524, 11, 'Médio Araguaia', 51, 128),
(520, 2, 'Alta Floresta', 51, 129),
(527, 1, 'Aripuanã', 51, 129),
(530, 4, 'Parecis', 51, 129),
(533, 7, 'Sinop', 51, 129),
(534, 3, 'Colíder', 51, 129),
(537, 8, 'Paranatinga', 51, 129),
(538, 6, 'Alto Teles Pires', 51, 129),
(539, 5, 'Arinos', 51, 129),
(521, 22, 'Alto Araguaia', 51, 130),
(525, 20, 'Tesouro', 51, 130),
(531, 19, 'Primavera do Leste', 51, 130),
(536, 21, 'Rondonópolis', 51, 130),
(526, 14, 'Jauru', 51, 131),
(529, 13, 'Tangará da Serra', 51, 131),
(535, 12, 'Alto Guaporé', 51, 131),
(540, 10, 'Goiânia', 52, 132),
(543, 9, 'Anicuns', 52, 132),
(548, 8, 'Iporá', 52, 132),
(549, 7, 'Anápolis', 52, 132),
(554, 6, 'Ceres', 52, 132),
(541, 12, 'Entorno de Brasília', 52, 133),
(547, 11, 'Vão do Paranã', 52, 133),
(542, 14, 'Vale do Rio dos Bois', 52, 134),
(544, 15, 'Meia Ponte', 52, 134),
(550, 17, 'Catalão', 52, 134),
(551, 13, 'Sudoeste de Goiás', 52, 134),
(555, 18, 'Quirinópolis', 52, 134),
(556, 16, 'Pires do Rio', 52, 134),
(545, 4, 'Porangatu', 52, 135),
(546, 5, 'Chapada dos Veadeiros', 52, 135),
(552, 3, 'Aragarças', 52, 136),
(553, 2, 'Rio Vermelho', 52, 136),
(557, 1, 'São Miguel do Araguaia', 52, 136),
(558, 1, 'Brasília', 53, 137);