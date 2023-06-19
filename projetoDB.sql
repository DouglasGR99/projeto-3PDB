CREATE DATABASE hortifrutidb
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE hortifrutidb;

CREATE TABLE Hortifruti1 (
    cnpj INT(14) NOT NULL,
    telefone INT(9) NOT NULL,
    PRIMARY KEY (cnpj)
);

CREATE TABLE Hortifruti2 (
    cnpj INT(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    rua VARCHAR(20),
    bairro VARCHAR(20),
    cidade VARCHAR(20),
    estado VARCHAR(15),
    FOREIGN KEY (cnpj) REFERENCES Hortifruti1 (cnpj)
); 

CREATE TABLE Cliente (
    cpf INT(11) NOT NULL,
    pagamento ENUM('credito', 'debito', 'dinheiro', 'pix'),
    PRIMARY KEY (cpf)
);

CREATE TABLE Empresas1 (
    cnpj INT(14) NOT NULL,
    telefone INT(11),
    PRIMARY KEY (cnpj)
);

CREATE TABLE Empresas2 (
    cnpj INT(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    FOREIGN KEY (cnpj) REFERENCES Empresas1 (cnpj)
);

CREATE TABLE Produtos1 (
    codigo INT(8) NOT NULL AUTO_INCREMENT,
    preco DECIMAL(4,2),
    PRIMARY KEY (codigo)
); 

CREATE TABLE Produtos2 (
    codigo INT(8),
    lote INT(8),
    validade DATE,
    fabricacao DATE,
    FOREIGN KEY (codigo) REFERENCES Produtos1 (codigo)
); 

CREATE TABLE Transporte (
    cnpj INT(14) NOT NULL,
    cnh INT(10) NOT NULL,
    produto INT(8),
    placa CHAR(7),
    PRIMARY KEY (cnpj),
    FOREIGN KEY (produto) REFERENCES Produtos1 (codigo)
);
