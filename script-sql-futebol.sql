CREATE DATABASE futebol;
SET FOREIGN_KEY_CHECKS = 1;
--

-- Table Cidade
--

CREATE TABLE IF NOT EXISTS futebol.Cidade (
    idCidade INT NOT NULL,
    nome VARCHAR(45) UNIQUE NOT NULL,
    estado VARCHAR(2) NOT NULL,
    PRIMARY KEY (idCidade)
);
--

-- Table Tecnico
--

CREATE TABLE IF NOT EXISTS futebol.Tecnico (
    idTecnico INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    estiloJogo VARCHAR(50) NULL,
    dataNascimento DATE NOT NULL,
    nacionalidade VARCHAR(30) NOT NULL DEFAULT 'Brasileira',
    PRIMARY KEY (idTecnico)
);
--

-- Table Clube
--

CREATE TABLE IF NOT EXISTS futebol.Clube (
    idClube INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    anoFundacao INT NOT NULL,
    idCidade INT NOT NULL,
    idTecnico INT UNIQUE NOT NULL,
    PRIMARY KEY (idClube),
    INDEX fk_Clube_Cidade1_idx (idCidade ASC) VISIBLE,
    INDEX fk_Clube_Tecnico1_idx (idTecnico ASC) VISIBLE,
    CONSTRAINT fk_Clube_Cidade1 FOREIGN KEY (idCidade) REFERENCES futebol.Cidade (idCidade) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT fk_Clube_Tecnico1 FOREIGN KEY (idTecnico) REFERENCES futebol.Tecnico (idTecnico) ON DELETE RESTRICT ON UPDATE NO ACTION
);
--

-- Table Federacao
--

CREATE TABLE IF NOT EXISTS futebol.Federacao (
    idFederacao INT NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    nome VARCHAR(60) NOT NULL,
    pais VARCHAR(40) NOT NULL,
    PRIMARY KEY (idFederacao)
);
--

-- Table futebol.Associado
--

CREATE TABLE IF NOT EXISTS futebol.Associado (
    idClube INT NOT NULL,
    idFederacao INT NOT NULL,
    INDEX fk_Clube_has_Federação_Federação1_idx (idFederacao ASC) VISIBLE,
    INDEX fk_Clube_has_Federação_Clube_idx (idClube ASC) VISIBLE,
    PRIMARY KEY (idClube, idFederacao),
    CONSTRAINT fk_Clube_has_Federação_Clube FOREIGN KEY (idClube) REFERENCES futebol.Clube (idClube) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT fk_Clube_has_Federação_Federação1 FOREIGN KEY (idFederacao) REFERENCES futebol.Federacao (idFederacao) ON DELETE RESTRICT ON UPDATE NO ACTION
);
--

-- Table Competicao
--

CREATE TABLE IF NOT EXISTS futebol.Competicao (
    idCompeticao INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    ano INT NOT NULL,
    idFederacao INT NOT NULL,
    idClube_Vencedor INT NOT NULL,
    PRIMARY KEY (idCompeticao),
    INDEX fk_Competição_Federação1_idx (idFederacao ASC) VISIBLE,
    INDEX fk_Competição_Clube1_idx (idClube_Vencedor ASC) VISIBLE,
    CONSTRAINT fk_Competição_Federação1 FOREIGN KEY (idFederacao) REFERENCES futebol.Federacao (idFederacao) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT fk_Competição_Clube1 FOREIGN KEY (idClube_Vencedor) REFERENCES futebol.Clube (idClube) ON DELETE RESTRICT ON UPDATE NO ACTION
);
--

-- Table Partida
--

CREATE TABLE IF NOT EXISTS futebol.Partida (
    idPartida INT NOT NULL,
    rodada DECIMAL(2) NULL,
    dataPartida DATE NOT NULL,
    estadio VARCHAR(50) NULL,
    golsMandante DECIMAL(3) NOT NULL,
    golsVisitante DECIMAL(3) NOT NULL,
    idClubeVisitante INT NOT NULL,
    idClubeMandante INT NOT NULL,
    idCompeticao INT NOT NULL,
    PRIMARY KEY (idPartida),
    INDEX fk_Partida_Clube1_idx (idClubeVisitante ASC) VISIBLE,
    INDEX fk_Partida_Clube2_idx (idClubeMandante ASC) VISIBLE,
    INDEX fk_Partida_Competição1_idx (idCompeticao ASC) VISIBLE,
    CONSTRAINT fk_Partida_Clube1 FOREIGN KEY (idClubeVisitante) REFERENCES futebol.Clube (idClube) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT fk_Partida_Clube2 FOREIGN KEY (idClubeMandante) REFERENCES futebol.Clube (idClube) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT fk_Partida_Competição1 FOREIGN KEY (idCompeticao) REFERENCES futebol.Competicao (idCompeticao) ON DELETE RESTRICT ON UPDATE NO ACTION
);
--

-- Table Jogador
--

CREATE TABLE IF NOT EXISTS futebol.Jogador (
    idJogador INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    posicaoPrincipal VARCHAR(30) NOT NULL,
    nacionalidadeEsportiva VARCHAR(30) NOT NULL,
    numeroCamisa DECIMAL(2) NULL,
    dataNascimento DATE NOT NULL,
    idClube INT NOT NULL,
    INDEX fk_Jogador_Clube1_idx (idClube ASC) VISIBLE,
    PRIMARY KEY (idJogador),
    CONSTRAINT fk_Jogador_Clube1 FOREIGN KEY (idClube) REFERENCES futebol.Clube (idClube) ON DELETE RESTRICT ON UPDATE NO ACTION
);
--

-- Table Transferencia
--

CREATE TABLE IF NOT EXISTS futebol.Transferencia (
    idTransferencia INT NOT NULL,
    dataTransferencia DATE NOT NULL,
    valor DECIMAL(12, 2) NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    idClubeVendedor INT NULL,
    idClubeComprador INT NULL,
    idJogador INT NULL,
    PRIMARY KEY (idTransferencia),
    INDEX fk_Transferência_Clube1_idx (idClubeVendedor ASC) VISIBLE,
    INDEX fk_Transferência_Clube2_idx (idClubeComprador ASC) VISIBLE,
    INDEX fk_Transferência_Jogador1_idx (idJogador ASC) VISIBLE,
    CONSTRAINT fk_Transferência_Clube1 FOREIGN KEY (idClubeVendedor) REFERENCES futebol.Clube (idClube) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT fk_Transferência_Clube2 FOREIGN KEY (idClubeComprador) REFERENCES futebol.Clube (idClube) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT fk_Transferência_Jogador1 FOREIGN KEY (idJogador) REFERENCES futebol.Jogador (idJogador) ON DELETE RESTRICT ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS futebol.Participa (
    idClube INT NOT NULL,
    idCompeticao INT NOT NULL,
    PRIMARY KEY (idClube, idCompeticao),
    INDEX fk_Clube_has_Competicao_Competicao1_idx (idCompeticao ASC) VISIBLE,
    INDEX fk_Clube_has_Competicao_Clube1_idx (idClube ASC) VISIBLE,
    CONSTRAINT fk_Clube_has_Competicao_Clube1 FOREIGN KEY (idClube) REFERENCES futebol.Clube (idClube) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_Clube_has_Competicao_Competicao1 FOREIGN KEY (idCompeticao) REFERENCES futebol.Competicao (idCompeticao) ON DELETE NO ACTION ON UPDATE NO ACTION
);