CREATE DATABASE empresajet;
USE empresajet;

-- Cadastro do usuário no site institucional (único)

CREATE TABLE cadastro (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR (20),
senha VARCHAR (20),
nome VARCHAR (60),
email VARCHAR (30),
contato VARCHAR (20)
);

-- Registro de empresa(s) por cliente (usuário)

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR (40),
endereco VARCHAR (80),
cidade VARCHAR (30),
estado CHAR (2),
bairro VARCHAR (30),
cep VARCHAR (13),
cnpj VARCHAR (30)
);

-- Sensores com identificação, status (0 ou 1) e data/horário do registro (DATETIME DEFAULT CURRENT_TIMESTAP)

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR (40),
statusSensor TINYINT,
fileira VARCHAR (20),
dtSensor DATETIME DEFAULT CURRENT_TIMESTAMP 
);

--  Tabela das características dos produtos 

CREATE TABLE produto (
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nomeProduto VARCHAR (30),
categoria VARCHAR (30)
);

-- Insert da tabela usuario
INSERT INTO cadastro(username,senha,nome,email,contato)
VALUES ('Gustavo12','1234567','Gustavo de Santana','gustavo@gmail.com','1122233344'),
		('Roberto34','abcdefg','Roberto Almeida','roberto@gmail.com','119887755'),
        ('Marcela56','abcd5678','Marcela Campos','marcela@gmail.com','11556677881');   
	
-- INSERT na tabela empresa        
INSERT INTO empresa(nomeEmpresa,endereco,cidade,estado,bairro,cep,cnpj)
VALUES ('Rossi','Estrada Dom João Nery','São Paulo','SP','Guaianases','0151-000','87.107.874/0001-20'),
		('Assai','Cachoeira Jaciquara','São Paulo','SP','Inacio Monteiro','0432-000','96.255.082/0001-94'),
		('Carrefour','Rua Reserva','São Paulo','SP','Jardim Itapemirim','08220-800','86.041.273/0001-08');      
        
        
-- INSERT na tabela sensor
INSERT INTO sensor(nomeSensor,statusSensor,fileira)
VALUES ('Sensor Doces',1,'5A'),
		('Sensor Arroz',0,'4B'),
		('Sensor Café','1','2B');
        
-- INSERT na tabela produto
INSERT INTO produto(nomeProduto,categoria)
VALUES ('Café Pilão','café'),
		('Arroz Camil','arroz'),
		('Bala Fini','doce');        

-- Exibição

SELECT * FROM cadastro;

SELECT * FROM empresa;

SELECT * FROM sensor;

SELECT * FROM produto;

SELECT * FROM sensor WHERE statusSensor = 0;

SELECT nomeEmpresa FROM empresa WHERE cidade = 'São Paulo' ORDER BY nomeEmpresa ASC;
   