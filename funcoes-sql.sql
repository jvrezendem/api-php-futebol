-- Criação de todas as tabelas e de todas as restrições de integridade. 
-- Todas as restrições de chave (PRIMARY KEY) e de integridade referencial (FOREIGN KEY) devem ser criadas. 
-- Além disso, crie pelo menos um exemplo com cada uma das restrições UNIQUE e DEFAULT.

CREATE TABLE IF NOT EXISTS futebol.Cidade (
idCidade INT NOT NULL,
nome VARCHAR(45) UNIQUE NOT NULL,
estado VARCHAR(2) NOT NULL,
PRIMARY KEY (idCidade));

CREATE TABLE IF NOT EXISTS futebol.Tecnico (
idTecnico INT NOT NULL,
nome VARCHAR(50) NOT NULL,
estiloJogo VARCHAR(50) NULL,
dataNascimento DATE NOT NULL,
nacionalidade VARCHAR(30) NOT NULL DEFAULT 'Brasileira',
PRIMARY KEY (idTecnico));

-- Como a tabela Tecnico já pode ter sido criada antes (script de criação das tabelas)
-- sem a restrição DEFAULT, o ALTER abaixo garante que o DEFAULT 'Brasileira' seja
-- aplicado na coluna nacionalidade independente da ordem de execução dos scripts.
ALTER TABLE futebol.Tecnico
MODIFY nacionalidade VARCHAR(30) NOT NULL DEFAULT 'Brasileira';

-- Exemplo de Criação de dado
-- Usa um ID fora da faixa (999) para não colidir com os dados reais inseridos
-- mais abaixo (que usam IDs 1 a 22); o registro de exemplo é removido em seguida.
INSERT INTO tecnico(idTecnico, nome, estiloJogo, dataNascimento)
VALUES(999, 'Técnico', 'Ofensivo', '1980-05-10');

DELETE FROM tecnico WHERE idTecnico = 999;

-- Exemplos de ALTER TABLE (pelo menos 3 exemplos, envolvendo alterações diversas) e DROP TABLE. 
-- Crie uma tabela extra que não existe no seu trabalho, somente para exemplificar, e a apague no 
-- final com o DROP TABLE.

CREATE TABLE TesteAlteracoes (
idTeste INT NOT NULL,
descricao VARCHAR(30),
PRIMARY KEY (idTeste)
);

-- Criação de uma nova tabela
ALTER TABLE TesteAlteracoes
ADD dataCriacao DATE NULL;

-- Renomeando uma coluna
ALTER TABLE TesteAlteracoes
CHANGE COLUMN descricao observacao VARCHAR(100) NOT NULL;

-- Removendo uma coluna da tabela
ALTER TABLE TesteAlteracoes
DROP COLUMN dataCriacao;

DROP TABLE TesteAlteracoes;

-- Exemplos de inserções de dados em cada uma das tabelas  (pelo menos 5 em cada tabela). 
-- Para testar bem o trabalho, recomenda-se inserir dezenas de registros em cada tabela. 

-- =====================================================
-- INSERTS: CIDADE
-- =====================================================

INSERT INTO Cidade (idCidade, nome, estado) VALUES
(1, 'Rio de Janeiro', 'RJ'),
(2, 'Porto Alegre', 'RS'),
(3, 'Belo Horizonte', 'MG'),
(4, 'São Paulo', 'SP'),
(5, 'Salvador', 'BA'),
(6, 'Santos', 'SP'),
(7, 'Curitiba', 'PR'),
(8, 'Mirassol', 'SP'),
(9, 'Belém', 'PA'),
(10, 'Bragança Paulista', 'SP'),
(11, 'Chapecó', 'SC'),
(12, 'Fortaleza', 'CE'),
(13, 'Recife', 'PE'),
(14, 'Goiânia', 'GO'),
(15, 'Cuiabá', 'MT'),
(16, 'Maceió', 'AL'),
(17, 'Natal', 'RN'),
(18, 'Manaus', 'AM'),
(19, 'Campinas', 'SP'),
(20, 'Caxias do Sul', 'RS'),
(21, 'Lavras', 'MG');

-- =====================================================
-- INSERTS: TECNICO
-- =====================================================

INSERT INTO Tecnico (idTecnico, nome, estiloJogo, dataNascimento, nacionalidade) VALUES
(1, 'Luis Zubeldía', 'Intensidade e posse', '1981-01-13', 'Argentina'),
(2, 'Mano Menezes', 'Organização defensiva', '1962-06-11', 'Brasileira'),
(3, 'Luís Castro', 'Jogo posicional', '1961-09-03', 'Portuguesa'),
(4, 'Leonardo Jardim', 'Transição ofensiva', '1974-08-01', 'Portuguesa'),
(5, 'Hernán Crespo', 'Pressão alta', '1975-07-05', 'Argentina'),
(6, 'Filipe Luís', 'Construção ofensiva', '1985-08-09', 'Brasileira'),
(7, 'Rogério Ceni', 'Jogo apoiado', '1973-01-22', 'Brasileira'),
(8, 'Cléber Xavier', 'Equilíbrio tático', '1964-03-29', 'Brasileira'),
(9, 'Fernando Diniz', 'Posse de bola', '1974-03-27', 'Brasileira'),
(10, 'Odair Hellmann', 'Transição rápida', '1977-01-22', 'Brasileira'),
(11, 'Rafael Guanaes', 'Compactação', '1981-03-27', 'Brasileira'),
(12, 'António Oliveira', 'Pressão e velocidade', '1982-10-13', 'Portuguesa'),
(13, 'Jorge Sampaoli', 'Pressão intensa', '1960-03-13', 'Argentina'),
(14, 'Vagner Mancini', 'Jogo direto', '1966-10-24', 'Brasileira'),
(15, 'Eduardo Domínguez', 'Marcação forte', '1978-09-01', 'Argentina'),
(16, 'Mozart Santos', 'Controle de meio-campo', '1979-11-08', 'Brasileira'),
(17, 'Jair Ventura', 'Defesa compacta', '1979-03-19', 'Brasileira'),
(18, 'Abel Ferreira', 'Transição e intensidade', '1978-12-22', 'Portuguesa'),
(19, 'Rafael Lacerda', 'Bloco médio', '1984-06-12', 'Brasileira'),
(20, 'Fernando Seabra', 'Organização ofensiva', '1977-06-19', 'Brasileira'),
(21,'Artur Jorge','Jogo ofensivo e pressão alta','1972-01-01','Portuguesa'),
(22, 'Denilson', 'Organização ofensiva', '1968-10-22', 'Brasileira');

-- =====================================================
-- INSERTS: FEDERACAO
-- =====================================================

INSERT INTO Federacao (idFederacao, sigla, nome, pais) VALUES
(1, 'CBF', 'Confederação Brasileira de Futebol', 'Brasil'),
(2, 'CONMEBOL', 'Confederação Sul-Americana de Futebol', 'Paraguai'),
(3, 'FIFA', 'Federação Internacional de Futebol', 'Suíça'),
(4, 'FERJ', 'Federação de Futebol do Estado do Rio de Janeiro', 'Brasil'),
(5, 'FGF-RS', 'Federação Gaúcha de Futebol', 'Brasil'),
(6, 'FMF-MG', 'Federação Mineira de Futebol', 'Brasil'),
(7, 'FPF-SP', 'Federação Paulista de Futebol', 'Brasil'),
(8, 'FBF-BA', 'Federação Bahiana de Futebol', 'Brasil'),
(9, 'FPF-PR', 'Federação Paranaense de Futebol', 'Brasil'),
(10, 'FPF-PA', 'Federação Paraense de Futebol', 'Brasil'),
(11, 'FCF-SC', 'Federação Catarinense de Futebol', 'Brasil'),
(12, 'FCF-CE', 'Federação Cearense de Futebol', 'Brasil'),
(13, 'FPF-PE', 'Federação Pernambucana de Futebol', 'Brasil'),
(14, 'FGF-GO', 'Federação Goiana de Futebol', 'Brasil'),
(15, 'FMF-MT', 'Federação Mato-Grossense de Futebol', 'Brasil'),
(16, 'FAF-AL', 'Federação Alagoana de Futebol', 'Brasil'),
(17, 'FNF-RN', 'Federação Norte-rio-grandense de Futebol', 'Brasil'),
(18, 'FAF-AM', 'Federação Amazonense de Futebol', 'Brasil'),
(19, 'UEFA', 'União das Associações Europeias de Futebol', 'Suíça'),
(20, 'AFA', 'Associação do Futebol Argentino', 'Argentina');

-- =====================================================
-- INSERTS: CLUBE
-- =====================================================

INSERT INTO Clube (idClube, nome, anoFundacao, idCidade, idTecnico) VALUES
(1, 'Fluminense', 1902, 1, 1),
(2, 'Grêmio', 1903, 2, 2),
(3, 'Botafogo', 1904, 1, 3),
(4, 'Cruzeiro', 1921, 3, 21),
(5, 'São Paulo', 1930, 4, 5),
(6, 'Flamengo', 1895, 1, 4),
(7, 'Bahia', 1931, 5, 7),
(8, 'Santos', 1912, 6, 8),
(9, 'Corinthians', 1910, 4, 9),
(10, 'Athletico Paranaense', 1924, 7, 10),
(11, 'Mirassol', 1925, 8, 11),
(12, 'Remo', 1905, 9, 12),
(13, 'Atlético Mineiro', 1908, 3, 13),
(14, 'Red Bull Bragantino', 1928, 10, 14),
(15, 'Internacional', 1909, 2, 15),
(16, 'Coritiba', 1909, 7, 16),
(17, 'Vitória', 1899, 5, 17),
(18, 'Palmeiras', 1914, 4, 18),
(19, 'Chapecoense', 1973, 11, 19),
(20, 'Vasco da Gama', 1898, 1, 20),
(21, 'Cashen FC', 2026, 21, 22);

-- =====================================================
-- INSERTS: ASSOCIADO
-- =====================================================

INSERT INTO Associado (idClube, idFederacao) VALUES
(1, 4),
(2, 5),
(3, 4),
(4, 6),
(5, 7),
(6, 4),
(7, 8),
(8, 7),
(9, 7),
(10, 9),
(11, 7),
(12, 10),
(13, 6),
(14, 7),
(15, 5),
(16, 9),
(17, 8),
(18, 7),
(19, 11),
(20, 4);

-- =====================================================
-- INSERTS: COMPETICAO
-- =====================================================

INSERT INTO Competicao (idCompeticao, nome, tipo, ano, idFederacao, idClube_Vencedor) VALUES
(1, 'Campeonato Brasileiro Série A', 'Nacional', 2026, 1, 6),
(2, 'Copa do Brasil', 'Nacional', 2026, 1, 9),
(3, 'CONMEBOL Libertadores', 'Continental', 2026, 2, 3),
(4, 'CONMEBOL Sul-Americana', 'Continental', 2026, 2, 18),
(5, 'Campeonato Carioca', 'Estadual', 2026, 4, 6),
(6, 'Campeonato Paulista', 'Estadual', 2026, 7, 9),
(7, 'Campeonato Mineiro', 'Estadual', 2026, 6, 4),
(8, 'Campeonato Gaúcho', 'Estadual', 2026, 5, 15),
(9, 'Campeonato Baiano', 'Estadual', 2026, 8, 7),
(10, 'Campeonato Paranaense', 'Estadual', 2026, 9, 10),
(11, 'Campeonato Catarinense', 'Estadual', 2026, 11, 19),
(12, 'Campeonato Paraense', 'Estadual', 2026, 10, 12),
(13, 'Supercopa Rei', 'Nacional', 2026, 1, 6),
(14, 'Recopa Sul-Americana', 'Continental', 2026, 2, 3),
(15, 'Copa do Nordeste', 'Regional', 2026, 1, 7),
(16, 'Copa Verde', 'Regional', 2026, 1, 12),
(17, 'Mundial de Clubes FIFA', 'Mundial', 2025, 3, 18),
(18, 'Campeonato Brasileiro Série B', 'Nacional', 2026, 1, 16),
(19, 'Taça Guanabara', 'Estadual', 2026, 4, 6),
(20, 'Torneio Rio-São Paulo', 'Regional', 2026, 1, 5);

-- =====================================================
-- INSERTS: PARTICIPA
-- =====================================================

INSERT INTO Participa (idClube, idCompeticao) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1);

-- =====================================================
-- INSERTS: PARTIDA
-- =====================================================

INSERT INTO Partida (
idPartida,
rodada,
dataPartida,
estadio,
golsMandante,
golsVisitante,
idClubeVisitante,
idClubeMandante,
idCompeticao
) VALUES
(1, 1, '2026-01-28', 'Maracanã', 2, 1, 2, 1, 1),
(2, 1, '2026-01-28', 'Nilton Santos', 1, 1, 4, 3, 1),
(3, 1, '2026-01-28', 'Morumbi', 0, 2, 6, 5, 1),
(4, 1, '2026-01-28', 'Neo Química Arena', 2, 0, 10, 9, 1),
(5, 1, '2026-01-28', 'José Maria de Campos Maia', 1, 0, 12, 11, 1),
(6, 1, '2026-01-28', 'Arena MRV', 2, 2, 14, 13, 1),
(7, 1, '2026-01-28', 'Beira-Rio', 1, 2, 6, 15, 1),
(8, 1, '2026-01-28', 'Couto Pereira', 1, 1, 4, 16, 1),
(9, 1, '2026-01-28', 'Barradão', 0, 1, 18, 17, 1),
(10, 1, '2026-01-28', 'Arena Condá', 1, 3, 20, 19, 1),
(11, 2, '2026-02-04', 'Arena Fonte Nova', 2, 1, 9, 7, 1),
(12, 2, '2026-02-04', 'Vila Belmiro', 1, 1, 5, 8, 1),
(13, 2, '2026-02-04', 'Allianz Parque', 3, 0, 17, 18, 1),
(14, 2, '2026-02-04', 'São Januário', 2, 2, 3, 20, 1),
(15, 2, '2026-02-04', 'Arena da Baixada', 2, 1, 16, 10, 1),
(16, 2, '2026-02-04', 'Nabi Abi Chedid', 1, 0, 11, 14, 1),
(17, 2, '2026-02-04', 'Mineirão', 2, 0, 13, 4, 1),
(18, 2, '2026-02-04', 'Mangueirão', 1, 2, 15, 12, 1),
(19, 2, '2026-02-04', 'Arena do Grêmio', 0, 0, 1, 2, 1),
(20, 2, '2026-02-04', 'Maracanã', 3, 1, 8, 6, 1);

-- =====================================================
-- INSERTS: JOGADOR
-- =====================================================

INSERT INTO Jogador (
idJogador,
nome,
posicaoPrincipal,
nacionalidadeEsportiva,
numeroCamisa,
dataNascimento,
idClube
) VALUES
(1, 'John Kennedy', 'Atacante', 'Brasileira', 9, '2002-05-18', 1),
(2, 'Carlos Vinícius', 'Atacante', 'Brasileira', 95, '1995-03-25', 2),
(3, 'Arthur Cabral', 'Atacante', 'Brasileira', 98, '1998-04-25', 3),
(4, 'Kaio Jorge', 'Atacante', 'Brasileira', 19, '2002-01-24', 4),
(5, 'Luciano', 'Atacante', 'Brasileira', 10, '1993-05-18', 5),
(6, 'Pedro', 'Atacante', 'Brasileira', 9, '1997-06-20', 6),
(7, 'Luciano Juba', 'Lateral-esquerdo', 'Brasileira', 46, '1999-08-29', 7),
(8, 'Gabriel Barbosa', 'Atacante', 'Brasileira', 10, '1996-08-30', 8),
(9, 'Yuri Alberto', 'Atacante', 'Brasileira', 9, '2001-03-18', 9),
(10, 'Kevin Viveros', 'Atacante', 'Colombiana', 9, '2000-04-09', 10),
(11, 'Chico da Costa', 'Atacante', 'Brasileira', 91, '1995-05-08', 4),
(12, 'Pedro Rocha', 'Atacante', 'Brasileira', 32, '1994-10-01', 12),
(13, 'Hulk', 'Atacante', 'Brasileira', 7, '1986-07-25', 13),
(14, 'Lucas Evangelista', 'Meio-campo', 'Brasileira', 8, '1995-05-06', 14),
(15, 'Rafael Borré', 'Atacante', 'Colombiana', 19, '1995-09-15', 15),
(16, 'Breno Lopes', 'Atacante', 'Brasileira', 11, '1996-01-24', 16),
(17, 'Matheuzinho', 'Lateral-direito', 'Brasileira', 2, '1997-09-08', 17),
(18, 'Vitor Roque', 'Atacante', 'Brasileira', 9, '2005-02-28', 18),
(19, 'Perotti', 'Atacante', 'Brasileira', 77, '1997-11-22', 19),
(20, 'Philippe Coutinho', 'Meio-campo', 'Brasileira', 11, '1992-06-12', 20),
(21, 'Matheus Cunha', 'Goleiro', 'Brasileira', 31, '2001-05-24', 4),
(22, 'Otávio Costa', 'Goleiro', 'Brasileira', 81, '2005-12-27', 4),
(23, 'Cássio', 'Goleiro', 'Brasileira', 1, '1987-06-06', 4),
(24, 'Fabrício Bruno', 'Zagueiro', 'Brasileira', 15, '1996-02-12', 4),
(25, 'Jonathan Jesus', 'Zagueiro', 'Brasileira', 34, '2004-05-27', 4),
(26, 'João Marcelo', 'Zagueiro', 'Brasileira', 43, '2000-06-13', 4),
(27, 'Lucas Villalba', 'Zagueiro', 'Argentina', 25, '1994-08-19', 4),
(28, 'Bruno Alves', 'Zagueiro', 'Brasileira', 44, '2005-08-04', 4),
(29, 'Janderson', 'Zagueiro', 'Brasileira', 33, '2005-08-31', 4),
(30, 'Kaiki', 'Lateral-esquerdo', 'Brasileira', 6, '2003-03-08', 4),
(31, 'Kauã Prates', 'Lateral-esquerdo', 'Brasileira', 36, '2008-08-12', 4),
(32, 'William', 'Lateral-direito', 'Brasileira', 12, '1995-04-03', 4),
(33, 'Kauã Moraes', 'Lateral-direito', 'Brasileira', 2, '2006-09-29', 4),
(34, 'Fagner', 'Lateral-direito', 'Brasileira', 23, '1989-06-11', 4),
(35, 'Walace', 'Volante', 'Brasileira', 5, '1995-04-04', 4),
(36, 'Lucas Romero', 'Volante', 'Argentina', 29, '1994-04-18', 4),
(37, 'Murilo Rhikman', 'Volante', 'Brasileira', 35, '2006-03-13', 4),
(38, 'Lucas Silva', 'Volante', 'Brasileira', 16, '1993-02-16', 4),
(39, 'Gerson', 'Meio-campo', 'Brasileira', 11, '1997-05-20', 4),
(40, 'Christian', 'Meio-campo', 'Brasileira', 88, '2000-12-19', 4),
(41, 'Matheus Henrique', 'Meio-campo', 'Brasileira', 8, '1997-12-19', 4),
(42, 'Japa', 'Meio-campo', 'Brasileira', 77, '2004-01-02', 4),
(43, 'Matheus Pereira', 'Meia-atacante', 'Brasileira', 10, '1996-05-05', 4),
(44, 'Luis Sinisterra', 'Ponta-esquerda', 'Colombiana', 17, '1999-06-17', 4),
(45, 'Kaique Kenji', 'Ponta-esquerda', 'Brasileira', 70, '2006-01-29', 4),
(46, 'Wanderson', 'Ponta-esquerda', 'Brasileira', 94, '1994-10-07', 4),
(47, 'Bruno Rodrigues', 'Ponta-esquerda', 'Brasileira', 9, '1997-03-07', 4),
(48, 'Keny Arroyo', 'Ponta-direita', 'Equatoriana', 99, '2006-02-14', 4),
(49, 'Marquinhos', 'Ponta-direita', 'Brasileira', 7, '2003-04-07', 4),
(50, 'Néiser Villarreal', 'Centroavante', 'Colombiana', 22, '2005-04-24', 4),
(51, 'Daniel Reis', 'Centroavante', 'Colombiana', 9, '1999-09-14', 21),
(52, 'João Vitor', 'Ponta-Esquerda', 'Brasileira', 7, '2005-11-03', 21),
(53, 'Paulo Sergio', 'Ponta-Direita', 'Chilena', 11, '2006-10-20', 21),
(54, 'João Pedro', 'Meio-Campo', 'Brasileira', 8, '2002-05-31', 21),
(55, 'Felipe Emmendoerfer', 'Zagueiro', 'Brasileira', 5, '2005-09-25', 21),
(56, 'Gabriel Lima', 'Zagueiro', 'Brasileira', 2, '2006-12-27', 21);

-- =====================================================
-- INSERTS: TRANSFERENCIA
-- =====================================================

INSERT INTO Transferencia (
idTransferencia,
dataTransferencia,
valor,
tipo,
idClubeVendedor,
idClubeComprador,
idJogador
) VALUES
(1, '2026-01-10', 25000000.00, 'Compra', 8, 1, 1),
(2, '2026-01-12', 18000000.00, 'Compra', 20, 2, 2),
(3, '2026-01-15', 22000000.00, 'Compra', 18, 3, 3),
(4, '2026-01-18', 30000000.00, 'Compra', 8, 4, 4),
(5, '2026-01-20', 8000000.00, 'Renovação', 5, 5, 5),
(6, '2026-01-22', 35000000.00, 'Renovação', 6, 6, 6),
(7, '2026-01-25', 7000000.00, 'Compra', 16, 7, 7),
(8, '2026-01-28', 12000000.00, 'Compra', 6, 8, 8),
(9, '2026-02-01', 20000000.00, 'Renovação', 9, 9, 9),
(10, '2026-02-03', 10000000.00, 'Compra', 12, 10, 10),
(11, '2026-02-05', 5000000.00, 'Compra', 16, 11, 11),
(12, '2026-02-08', 4000000.00, 'Compra', 2, 12, 12),
(13, '2026-02-10', 15000000.00, 'Renovação', 13, 13, 13),
(14, '2026-02-12', 9000000.00, 'Renovação', 14, 14, 14),
(15, '2026-02-14', 16000000.00, 'Compra', 15, 15, 15),
(16, '2026-02-16', 6000000.00, 'Compra', 18, 16, 16),
(17, '2026-02-18', 3500000.00, 'Compra', 9, 17, 17),
(18, '2026-02-20', 120000000.00, 'Compra', 10, 18, 18),
(19, '2026-02-22', 2500000.00, 'Renovação', 19, 19, 19),
(20, '2026-02-25', 10000000.00, 'Empréstimo', 20, 20, 20),
(21, '2026-03-01', 5000000.00, 'Doação', NULL, 8, 21);

-- A transferência 21 não possui clube vendedor (idClubeVendedor = NULL),
-- representando um jogador que chegou sem ser comprado de outro clube.
-- Esse registro é usado mais abaixo para demonstrar a consulta com IS NULL (F9).

-- Exemplos de modificação de dados em 5 tabelas. Mostre pelo menos um exemplo
-- com UPDATE aninhado, envolvendo mais de uma tabela. Não esqueça de descrever
-- o que cada comando faz.

-- Exemplo 1: Modificação Simples (Tabela: Tecnico)
UPDATE futebol.Tecnico 
SET estiloJogo = 'Ofensivo / Posicional' 
WHERE idTecnico = 1;

-- Exemplo 2: Modificação Simples com Múltiplas Colunas (Tabela: Partida)
UPDATE futebol.Partida 
SET golsMandante = 3, golsVisitante = 2, estadio = 'Maracanã' 
WHERE idPartida = 105;

-- Exemplo 3: Modificação com Operação Matemática (Tabela: Transferencia)
UPDATE futebol.Transferencia 
SET valor = valor * 1.10 
WHERE tipo = 'Empréstimo com opção de compra';

-- Exemplo 4: Modificação de Campo Condicional (Tabela: Jogador)
UPDATE futebol.Jogador 
SET numeroCamisa = 10 
WHERE idJogador = 99 AND posicaoPrincipal = 'Meio-Campista';

-- Exemplo 5: UPDATE Aninhado / Subquery envolvendo mais de uma tabela (Tabela: Clube)
UPDATE futebol.Clube 
SET anoFundacao = 1912 
WHERE idCidade = (
    SELECT idCidade 
    FROM futebol.Cidade 
    WHERE nome = 'Santos' AND estado = 'SP'
);

-- Exemplos de exclusão de dados em 5 tabelas. Mostre pelo menos um exemplo com DELETE aninhado, 
-- envolvendo mais de uma tabela. Não esqueça de descrever o que cada comando faz 

-- Exclusão na tabela Transferencia
DELETE FROM futebol.Transferencia 
WHERE valor < 50000.00;

-- Exclusão na tabela Partida
DELETE FROM futebol.Partida 
WHERE estadio = 'Maracanã' AND golsMandante = 0 AND golsVisitante = 0;

-- Exclusão na tabela Participa
DELETE FROM futebol.Participa 
WHERE idCompeticao = 3;

-- Exclusão na tabela Associado
DELETE FROM futebol.Associado 
WHERE idFederacao = 10;

-- Exclusão na tabela Jogador
-- Remove primeiro as transferências desses jogadores, pois a tabela Transferencia
-- referencia Jogador com ON DELETE RESTRICT e bloquearia a exclusão abaixo.
DELETE FROM futebol.Transferencia
WHERE idJogador IN (
    SELECT idJogador
    FROM futebol.Jogador
    WHERE idClube IN (
        SELECT idClube
        FROM futebol.Clube
        WHERE anoFundacao < 1900
    )
);

DELETE FROM futebol.Jogador
WHERE idClube IN (
    SELECT idClube
    FROM futebol.Clube
    WHERE anoFundacao < 1900
);

-- Exemplos de, pelo menos, 12 consultas. Inclua consultas simples e complexas, 
-- envolvendo todas as cláusulas do comando de consulta (SELECT, FROM, WHERE, ORDER BY, GROUP BY, HAVING), 
-- os operadores (JOIN, OUTER JOIN, UNION, AND, OR, NOT, BETWEEN, IN, LIKE, IS NULL, ANY/SOME, ALL, EXISTS), 
-- além de funções agregadas e consultas aninhadas (subconsultas). Não faça aninhamentos "forçados", 
-- somente os use em situações onde é difícil escrever uma consulta sem aninhamento. 
-- Será avaliado o nível de complexidade das consultas apresentadas. 
-- Não se esqueça de descrever em detalhes o que cada consulta recupera 
-- (ex: recupera o nome e o endereço dos gerentes dos departamentos que controlam os projetos localizados em Lavras). 
 
-- F1: consulta com INNER JOIN ou NATURAL JOIN
SELECT c.nome AS Clube,
       t.nome AS Tecnico
FROM Clube c
INNER JOIN Tecnico t
ON c.idTecnico = t.idTecnico;

-- Mostra cada clube e seu técnico.

-- F2: consulta com OUTER JOIN
SELECT j.nome,
       tr.valor
FROM Jogador j
LEFT JOIN Transferencia tr
ON j.idJogador = tr.idJogador;

-- Mostra todos os jogadores e as transferencias, mesmo os que nunca foram transferidos.

-- F3: consulta com ORDER BY
SELECT nome,
       dataNascimento
FROM Jogador
ORDER BY dataNascimento;

-- Seleciona o nome e a data de nascimento dos jogadores ordenando pela data de nascimento


-- F4: consulta com GROUP BY
SELECT idClube,
       COUNT(*) AS TotalJogadores
FROM Jogador
GROUP BY idClube;

-- Mostra quantos jogadores existem por clube

-- F5: consulta com HAVING
SELECT idClube,
       COUNT(*) AS TotalJogadores
FROM Jogador
GROUP BY idClube
HAVING COUNT(*) > 20;

-- Clubes com mais de 20 jogadores.

-- F6: consulta com UNION
SELECT nome
FROM Clube
UNION
SELECT nome
FROM Federacao;

-- Lista nomes de clubes e federações sem repetição.

-- F7: consulta com IN
SELECT nome
FROM Clube
WHERE idCidade IN (1,2,3);

-- Clubes localizados nas cidades 1, 2 e 3.

-- F8: consulta com LIKE
SELECT nome
FROM Jogador
WHERE nome LIKE 'M%';

-- Jogadores que começam com a letra M.

-- F9: consulta com IS NULL 
SELECT *
FROM Transferencia
WHERE idClubeVendedor IS NULL;

-- Seleciona as tranferências em que o tive vendedor é NULL.

-- F10: consulta com ANY ou SOME
SELECT nome,
       numeroCamisa
FROM Jogador
WHERE numeroCamisa > ANY (
    SELECT numeroCamisa
    FROM Jogador
    WHERE idClube = 1
);

-- Jogadores em que a camisa é maior que pelo menos uma camisa do clube 1

--  F11: consulta com ALL
SELECT nome,
       numeroCamisa
FROM Jogador
WHERE numeroCamisa > ALL (
    SELECT numeroCamisa
    FROM Jogador
    WHERE idClube = 1
);

-- Jogadores cuja camisa é maior que todas as camisas do clube 1.

-- F12: consulta com EXISTS
SELECT nome
FROM Clube c
WHERE EXISTS (
    SELECT *
    FROM Jogador j
    WHERE j.idClube = c.idClube
);

-- Clubes que possuem pelo menos um jogador cadastrado.

-- Consulta extra com BETWEEN
SELECT *
FROM Competicao
WHERE ano BETWEEN 2020 AND 2025;

-- Consulta extra com AND
SELECT *
FROM Jogador
WHERE nacionalidadeEsportiva = 'Brasil'
AND numeroCamisa < 20;

-- Consulta extra com OR
SELECT *
FROM Tecnico
WHERE nacionalidade = 'Brasil'
OR nacionalidade = 'Argentina';

-- Consulta extra com NOT
SELECT *
FROM Clube
WHERE NOT anoFundacao < 1950;

-- Exemplos de criação de de 3 visões (Views). Inclua também exemplos de como usar cada uma das visões. 
-- Não esqueça de descrever o que cada comando faz.


-- VIEWS
-- View 1

CREATE VIEW vw_jogadores_clube AS
SELECT j.nome AS Jogador,
       c.nome AS Clube
FROM Jogador j
JOIN Clube c
ON j.idClube = c.idClube;

-- Uso:

SELECT * FROM vw_jogadores_clube;

-- View 2
CREATE VIEW vw_partidas AS
SELECT p.idPartida,
       cm.nome AS Mandante,
       cv.nome AS Visitante
FROM Partida p
JOIN Clube cm
ON p.idClubeMandante = cm.idClube
JOIN Clube cv
ON p.idClubeVisitante = cv.idClube;

-- Uso:

SELECT * FROM vw_partidas;

-- View 3
CREATE VIEW vw_transferencias AS
SELECT t.idTransferencia,
       j.nome,
       t.valor
FROM Transferencia t
JOIN Jogador j
ON t.idJogador = j.idJogador;

-- Uso:

SELECT * FROM vw_transferencias;

-- USUÁRIOS, GRANT E REVOKE
-- Usuários

DROP USER IF EXISTS 'consulta'@'localhost';
DROP USER IF EXISTS 'gerente'@'localhost';

CREATE USER 'consulta'@'localhost'
IDENTIFIED BY '123456';
CREATE USER 'gerente'@'localhost'
IDENTIFIED BY '123456';

-- Permissão
GRANT SELECT
ON futebol.*
TO 'consulta'@'localhost';
GRANT SELECT, INSERT, UPDATE
ON futebol.*
TO 'gerente'@'localhost';

-- Revogação
REVOKE UPDATE
ON futebol.*
FROM 'gerente'@'localhost';

-- PROCEDURES E FUNÇÕES
-- Procedure 1 - IF
DELIMITER //

CREATE PROCEDURE VerificarIdade(
IN anoNascimento INT
)
BEGIN

IF YEAR(CURDATE()) - anoNascimento < 18 THEN
    SELECT 'Categoria de Base' AS Resultado;
ELSE
    SELECT 'Profissional' AS Resultado;
END IF;

END//

DELIMITER ;

-- Teste:

CALL VerificarIdade(2016);

-- Procedure 2 - CASE
DELIMITER //

CREATE PROCEDURE ClassificarCamisa(
IN camisa INT
)
BEGIN

CASE
    WHEN camisa = 1 THEN
        SELECT 'Goleiro';
    WHEN camisa BETWEEN 2 AND 4 THEN
        SELECT 'Defensor';
	WHEN camisa BETWEEN 5 AND 8 THEN
		SELECT 'Meio-Campo';
    WHEN camisa BETWEEN 9 AND 11 THEN
        SELECT 'Atacante';
    ELSE
        SELECT 'Reserva';
END CASE;

END//

DELIMITER ;

-- Teste:

CALL ClassificarCamisa(10);

-- Função 3 - WHILE
DELIMITER //

CREATE FUNCTION ContarCamisas(numero_procurado INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    
    DECLARE contador INT DEFAULT 1;
    DECLARE total_jogadores INT DEFAULT 0;
    DECLARE total_camisas_encontradas INT DEFAULT 0;

    -- Descobre qual é o maior ID de jogador cadastrado
    SELECT COALESCE(MAX(idJogador), 0) INTO total_jogadores FROM futebol.Jogador;

    
    WHILE contador <= total_jogadores DO
        
        -- Verifica se o jogador atual usa a camisa que estamos procurando
        IF EXISTS (
            SELECT 1 
            FROM futebol.Jogador 
            WHERE idJogador = contador AND numeroCamisa = numero_procurado
        ) THEN
            -- Se encontramos, soma 1 (equivalente ao seu SET soma = soma + X)
            SET total_camisas_encontradas = total_camisas_encontradas + 1;
        END IF;

        -- Incrementa o contador para ir para o próximo ID de jogador
        SET contador = contador + 1;
        
    END WHILE;

    -- Retorna o total acumulado
    RETURN total_camisas_encontradas;

END//

DELIMITER ;

-- Teste:

SELECT ContarCamisas(10);

-- Procedure 4 - sem parâmetros
DELIMITER //

CREATE PROCEDURE TotalJogadoresCadastrados()
BEGIN

SELECT COUNT(*) AS TotalJogadores
FROM futebol.Jogador;

END//

DELIMITER ;

-- Teste:

CALL TotalJogadoresCadastrados();

-- Procedure 5 - com parâmetro de entrada (IN) e de saída (OUT)
DELIMITER //

CREATE PROCEDURE ObterTotalGolsClube(
IN p_idClube INT,
OUT p_totalGols INT
)
BEGIN

SELECT COALESCE(SUM(golsMandante), 0) + COALESCE(SUM(golsVisitante), 0)
INTO p_totalGols
FROM futebol.Partida
WHERE idClubeMandante = p_idClube OR idClubeVisitante = p_idClube;

END//

DELIMITER ;

-- Teste: chama a procedure passando o clube 1 como entrada e recupera o
-- total de gols (somando como mandante e como visitante) na variável de saída @totalGols

CALL ObterTotalGolsClube(1, @totalGols);
SELECT @totalGols AS TotalGolsClube1;

-- TRIGGERS

CREATE TABLE LogSistema(
    idLog INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    dataEvento DATETIME
);

-- Trigger INSERT
DELIMITER //

CREATE TRIGGER trg_insert_jogador
AFTER INSERT ON Jogador
FOR EACH ROW
BEGIN

INSERT INTO LogSistema(
descricao,
dataEvento
)
VALUES(
CONCAT('Jogador inserido: ', NEW.nome),
NOW()
);

END//

DELIMITER ;

-- Teste:

INSERT INTO Jogador
VALUES(
100,
'Pedro',
'Atacante',
'Brasil',
9,
'2000-05-10',
1
);

-- Verifique em LogSistema que uma nova linha "Jogador inserido: Pedro" foi criada.

-- Caso em que o trigger trg_insert_jogador NÃO é disparado:
-- Tenta inserir um jogador com um idClube que não existe (9999), violando a
-- foreign key fk_Jogador_Clube1. O INSERT falha antes de ser efetivado, então
-- o trigger AFTER INSERT nunca executa e nenhuma linha nova aparece em LogSistema.

INSERT INTO Jogador
VALUES(
101,
'Jogador Teste',
'Atacante',
'Brasil',
9,
'2000-01-01',
9999
);
-- Erro esperado: violação de chave estrangeira (Cannot add or update a child row)

-- Trigger UPDATE
DELIMITER //

CREATE TRIGGER trg_update_jogador
AFTER UPDATE ON Jogador
FOR EACH ROW
BEGIN

INSERT INTO LogSistema(
descricao,
dataEvento
)
VALUES(
CONCAT('Jogador alterado: ', NEW.nome),
NOW()
);

END//

DELIMITER ;

-- Teste:

UPDATE Jogador
SET numeroCamisa = 99
WHERE idJogador = 100;

-- Verifique em LogSistema que uma nova linha "Jogador alterado: Pedro" foi criada.

-- Caso em que o trigger trg_update_jogador NÃO é disparado:
-- Tenta atualizar um jogador com um ID que não existe (99999). O comando UPDATE
-- é executado sem erro, porém afeta 0 linhas; como o trigger é FOR EACH ROW,
-- ele não dispara para nenhuma linha e LogSistema não recebe novo registro.

UPDATE Jogador
SET numeroCamisa = 50
WHERE idJogador = 99999;

-- Trigger DELETE
DELIMITER //

CREATE TRIGGER trg_delete_jogador
AFTER DELETE ON Jogador
FOR EACH ROW
BEGIN

INSERT INTO LogSistema(
descricao,
dataEvento
)
VALUES(
CONCAT('Jogador removido: ', OLD.nome),
NOW()
);

END//

DELIMITER ;

-- Teste:

DELETE FROM Jogador
WHERE idJogador = 100;

-- Verifique em LogSistema que uma nova linha "Jogador removido: Pedro" foi criada.

-- Caso em que o trigger trg_delete_jogador NÃO é disparado:
-- Tenta excluir um jogador com um ID que não existe (99999). O comando DELETE
-- é executado sem erro, porém afeta 0 linhas; como o trigger é FOR EACH ROW,
-- ele não dispara para nenhuma linha e LogSistema não recebe novo registro.

DELETE FROM Jogador
WHERE idJogador = 99999;