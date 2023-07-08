CREATE DATABASE hortifrutidb
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE hortifrutidb;

CREATE TABLE Hortifruti1 (
    cnpj VARCHAR(14) NOT NULL,
    telefone VARCHAR(9) NOT NULL,
    PRIMARY KEY (cnpj)
);

insert into hortifruti1 values ('12345678912345','959595959');

CREATE TABLE Hortifruti2 (
    cnpj VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    rua VARCHAR(20),
    bairro VARCHAR(20),
    cidade VARCHAR(20),
    estado VARCHAR(15),
    FOREIGN KEY (cnpj) REFERENCES Hortifruti1 (cnpj)
); 

insert into hortifruti2 values ('12345678912345','Hortifruti.Azul@gmail.com','Azul da Silva','Lacoste','RJ','RJ');

CREATE TABLE Cliente (
    cpf VARCHAR(11) NOT NULL,
    pagamento ENUM('credito', 'debito', 'dinheiro', 'pix'),
    PRIMARY KEY (cpf)
);

insert into cliente values ('00000000000','debito'),
('11111111111','credito'),
('22222222222','pix'),
('33333333333','dinheiro'),
('44444444444','credito'),
('55555555555','debito'),
('66666666666','credito'),
('77777777777','pix'),
('88888888888','dinheiro'),
('99999999999','credito');

CREATE TABLE Empresas1 (
    cnpj VARCHAR(14) NOT NULL,
    telefone VARCHAR(11),
    PRIMARY KEY (cnpj)
);

insert into empresas1 values ('98765432112345','012535648'),
('54879621346520','992535648');


CREATE TABLE Empresas2 (
    cnpj VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    FOREIGN KEY (cnpj) REFERENCES Empresas1 (cnpj)
);

insert into empresas2 values ('98765432112345', 'frutas.hortaliças@gmail.com'),
('54879621346520', 'frutitas123@gmail.com');


CREATE TABLE Produtos1 (
    codigo INT(8) NOT NULL AUTO_INCREMENT,
    preco DECIMAL(4,2),
    PRIMARY KEY (codigo)
); 

insert into produtos1 values ('12345678','7.50'),
('87654321','9.70'),
('01234567','15.00'),
('19501478','2.50'),
('54236979','8.99'),
('02458936','5.60'),
('89812545','12.50');

CREATE TABLE Produtos2 (
    codigo INT(8),
    lote INT(8),
    validade DATE,
    fabricacao DATE,
    FOREIGN KEY (codigo) REFERENCES Produtos1 (codigo)
); 

insert into produtos2 values ('12345678','00000000','2023-07-20','2022-01-20'),
('87654321','11111111','2024-08-25','2023-02-25'),
('01234567','22222222','2024-10-12','2023-05-12'),
('19501478','33333333','2024-05-02','2023-03-02'),
('54236979','44444444','2023-06-26','2022-04-09'),
('02458936','55555555','2023-09-27','2022-05-20'),
('89812545','66666666','2023-11-29','2022-08-25');


CREATE TABLE Transporte (
    cnpj VARCHAR(14) NOT NULL,
    cnh VARCHAR(10) NOT NULL,
    produto INT(8),
    placa CHAR(7),
    PRIMARY KEY (cnpj),
    FOREIGN KEY (produto) REFERENCES Produtos1 (codigo)
);

insert into transporte values 
('32561489752145','0101010101','12345678','ABC1234'),
('45214889547840','0202020202','87654321','XYZ9876'),
('87451211520256','0303030303','01234567','QWE4567'),
('57511525144548','0404040404','19501478','ZWA9855'),
('02545684595489','0505050505','54236979','DEF7654'),
('78122451489201','0606060606','02458936','UVW4321'),
('87151112599172','0707070707','89812545','GHI8765');