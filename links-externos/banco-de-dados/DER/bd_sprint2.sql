-- Active: 1663369181228@@127.0.0.1@3306@empresajet
CREATE DATABASE empresajet;
USE empresajet;
drop database empresajet;
CREATE TABLE
    Empresa (
        idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
        nomeEmpresa VARCHAR(45) NOT NULL,
        estado CHAR(2) NOT NULL,
        cidade VARCHAR(45) NOT NULL,
        bairro VARCHAR(45),
        logradouro VARCHAR(45),
        cep CHAR(8) NOT NULL,
        complemento VARCHAR(45),
        cnpj CHAR(14) NOT NULL
    );

-- INSERT na tabela empresa        
INSERT INTO Empresa
	VALUES 
		(NULL,'Rossi','SP','São Paulo','Guaianases','Estrada Dom João Nery','0151000',NULL,'87107874000120'),
		(NULL,'Rossi','MG','Ourinhos','Chapadinha','Estrada Querinda','9151094',NULL,'87107874000120'),
		(NULL,'Rossi','RJ','Rio de Janeiro','Copacabana','Avenida Atlântica','4341934',NULL,'87107874000120'),
		(NULL,'Assai','SP','São Paulo','Inacio Monteiro','Cachoeira Jaciquara','0432000',NULL,'96255082000194'),
		(NULL,'Carrefour','SP','São Paulo','Jardim Itapemirim','Rua Reserva','0230800',NULL,'86041273000108'),      
		(NULL,'Carrefour','ES','Vitória','Jardim Damasceno','Rua Reverendo ','68220840',NULL,'86041273000108'),
		(NULL,'Carrefour','RS','Porto Alegre','Pontal','Rua Monete Claro','58230290',NULL,'86041273000108');       

CREATE TABLE
    Perfil (
        idPerfil INT PRIMARY KEY AUTO_INCREMENT,
        username VARCHAR(45) NOT NULL,
        senha VARCHAR(45) NOT NULL,
        nome VARCHAR(60) NOT NULL,
        email VARCHAR(50) NOT NULL,
        telefoneCelular VARCHAR(11) NOT NULL,
        fkEmpresa INT NOT NULL,
        funcao VARCHAR(45) NOT NULL, CONSTRAINT chkFuncao CHECK (funcao in('Administrador','Usuario')),
        FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
    );
    

-- Insert da tabela Perfil
INSERT INTO Perfil
	VALUES 
		(NULL,'Gustavo12','1234567','Gustavo de Santana','gustavo@gmail.com','1122233344',1,'Administrador'),
		(NULL,'Roberto34','1234567','Roberto Almeida','roberto@gmail.com','119577755',2,'Usuario'),
		(NULL,'Alan32','1234567','Alan Almeida','alan@gmail.com','119888655',3,'Administrador'),
		(NULL,'Thiago23','1234567','Thiago Serafim','thiago@gmail.com','1198347555',4,'Usuario'),
		(NULL,'Clara94','1234567','Clara Faria Almeida','clara@gmail.com','119247755',5,'Administrador'),
		(NULL,'Caique23','1234567','Caique Silva Almeida','caique@gmail.com','119747755',6,'Usuario'),
        (NULL,'Calebe58','1234567','Calebe Gomes Campos','calebe@gmail.com','11574677881',7,'Administrador'),
        (NULL,'Igor54','1234567','Igor Pires de Santana','igor@gmail.com','1122273344',1,'Administrador'),
		(NULL,'Guilherme63','1234567','Guilherme Sebastião Silva','guilherme@gmail.com','119757755',2,'Usuario'),
		(NULL,'Paulo235','1234567','Paulo Cezar Almeida','paulo@gmail.com','119887455',3,'Administrador'),
		(NULL,'Wemerson346','1234567','Wemerson Nunes Santos','wemerson@gmail.com','119247755',4,'Usuario'),
		(NULL,'Julia34','1234567','Julia Faria','julia@gmail.com','1192487755',5,'Administrador'),
		(NULL,'Samanta57','1234567','Samanta Gonsalves Pirez','samanta@gmail.com','119887785',6,'Usuario'),
        (NULL,'Alanis568','1234567','Alanis Campos','alanis@gmail.com','11556677881',7,'Administrador');

CREATE TABLE
    Produto (
        idProduto INT PRIMARY KEY AUTO_INCREMENT,
        nomeProduto VARCHAR(45) NOT NULL,
        marcaProduto VARCHAR(45)
    );

     
-- INSERT na tabela produto
INSERT INTO Produto
	VALUES  
		(NULL,'Mussarela','Sadia'),
        (NULL,'Presunto','Seara'),
        (NULL,'Miojo','Nissin'),
        (NULL,'Arroz','Tio João'),
        (NULL,'Refrigerante','Coca-Cola'),        
        (NULL,'Refrigerante','Guaraná Antartica'),
        (NULL,'Bala','Fini'),
        (NULL,'Lanche','Naturales'),
        (NULL,'Maça','Mançaneta'),
        (NULL,'Pera','Peralandia'),
        (NULL,'Picanha','Friboi'),
        (NULL,'Maminha','Friboi'),
        (NULL,'Água sanitária','Candida'),
        (NULL,'Bom ar','Lavanda'),
        (NULL,'Frauda','Pampers'),
        (NULL,'Mamadeira','MaisKids'),
        (NULL,'Ração','Pedigree'),
        (NULL,'Osso','Ossolandia'),
        (NULL,'Pasta dental',NULL),
        (NULL,'Fosforo',NULL)
        ;        


CREATE TABLE 
    Prateleira(
        idPrateleira INT PRIMARY KEY AUTO_INCREMENT,
        setor VARCHAR(45) NOT NULL,CONSTRAINT chkSetor CHECK 
            (setor in(
                'Frios e congelados',
                'Mercearia',
                'Bebidas',
                'Doces e lanches',
                'Cuidados pessoais',
                'Hortifruti',
                'Carnes',
                'Limpeza',
                'Infantil',
                'Pets',
                'Outros'
            )),
        fkEmpresa INT NOT NULL,
        fkProduto INT NOT NULL,
        Foreign Key (fkEmpresa) REFERENCES Empresa(idEmpresa),
        Foreign Key (fkProduto) REFERENCES Produto(idProduto)
);

-- INSERT NA TEBELA Prateleira
INSERT INTO Prateleira
    VALUES
    (NULL,'Frios e congelados',1,1),
    (NULL,'Frios e congelados',2,2),
    (NULL,'Mercearia',3,3),
    (NULL,'Mercearia',4,4),
    (NULL,'Bebidas',5,5),
    (NULL,'Bebidas',1,6),
    (NULL,'Doces e lanches',2,7),
    (NULL,'Doces e lanches',3,8),
    (NULL,'Cuidados pessoais',4,9),
    (NULL,'Cuidados pessoais',5,10),
    (NULL,'Hortifruti',1,11),
    (NULL,'Hortifruti',2,12),
    (NULL,'Carnes',3,13),
    (NULL,'Carnes',4,14),
    (NULL,'Limpeza',5,15),
    (NULL,'Limpeza',1,16),
    (NULL,'Infantil',2,17),
    (NULL,'Infantil',3,18),
    (NULL,'Pets',4,19),
    (NULL,'Pets',5,20),
    (NULL,'Outros',1,20),
    (NULL,'Outros',2,20);

CREATE TABLE
    Sensor (
        idSensor INT PRIMARY KEY AUTO_INCREMENT,
        fkPrateleira INT,
        FOREIGN KEY (fkPrateleira) REFERENCES Prateleira(idPrateleira)
    );
        
-- INSERT na tabela sensor
INSERT INTO Sensor
	VALUES 
		(NULL,1),
		(NULL,2),
		(NULL,3),
		(NULL,4),
		(NULL,5),
		(NULL,6),
		(NULL,7),
		(NULL,8),
		(NULL,9),
		(NULL,10),
		(NULL,11),
		(NULL,12),
		(NULL,13),
		(NULL,14),
		(NULL,15),
		(NULL,16),
		(NULL,17),
		(NULL,18),
		(NULL,19),
        (NULL,20);
   
CREATE TABLE
    Dados(
        idDado INT PRIMARY KEY AUTO_INCREMENT,
        statusSensor INT,
        dtSensor DATETIME DEFAULT CURRENT_TIMESTAMP,
        fkSensor INT,
        Foreign Key (fkSensor) REFERENCES Sensor(idSensor)
    );

-- Inserindo Dados dos sensores
INSERT INTO Dados
    VALUES
        (NULL,0,'2022-10-10 00:00:30',1),
        (NULL,1,'2022-10-10 12:00:30',2),
        (NULL,0,'2022-10-10 00:30:30',3),
        (NULL,1,'2022-10-10 12:40:30',4),
        (NULL,0,'2022-10-10 15:20:30',5),
        (NULL,1,'2022-10-10 19:40:30',6),
        (NULL,0,'2022-10-10 13:40:30',7),
        (NULL,1,'2022-10-10 06:40:30',8),
        (NULL,0,'2022-10-10 12:40:30',9),
        (NULL,1,'2022-10-10 19:40:30',10),
        (NULL,0,'2022-10-10 10:40:30',11),
        (NULL,1,'2022-10-10 19:40:30',12),
        (NULL,0,'2022-10-10 19:40:30',13),
        (NULL,1,'2022-10-10 14:40:30',14),
        (NULL,0,'2022-10-10 19:40:30',15),
        (NULL,1,'2022-10-10 19:40:30',16),
        (NULL,0,'2022-10-10 09:40:30',17),
        (NULL,1,'2022-10-10 19:40:30',18),
        (NULL,0,'2022-10-10 10:40:30',19),
        (NULL,1,'2022-10-10 12:40:30',20);
DESC Sensor;
	
-- Exibir dados das tabelas
SELECT * FROM Perfil;
SELECT * FROM Empresa;
SELECT * FROM Dados;
SELECT * FROM Produto;
SELECT * FROM Sensor;
SELECT * FROM Prateleira;

-- Exibir Todos os dados das Empresas e de seus funcionarios
select * from Empresa 
    JOIN Perfil 
        ON idEmpresa = fkEmpresa;

-- Exibir Nome das Empresas e de seus funcionarios com seus rescpectivos cargos
select emp.nomeEmpresa,user.nome,user.funcao from Perfil AS user 
    JOIN Empresa AS emp 
            ON fkEmpresa = idEmpresa order by user.funcao;



-- Exibir os dados do sensor de determinado produto em determinado 
-- setor na pratileira por empresa
-- SELECT pra.setor,
--          pro.nomeProduto,
--          pro.marcaProduto,
--          da.statusSensor
--             FROM Prateleira AS pra
--                 JOIN Produto AS pro
--                     ON idProduto = fkProduto
--                         JOIN Dados as da
--                             ON idDado = fkSensor;

-- -- Exibir produtos em falta em determinada empresa
-- SELECT emp.nomeEmpresa,
--          pro.nomeProduto,
--          pro.MarcaProduto,
--          sen.statusSensor,
--             FROM produto AS pro
--                 JOIN Dados AS sen
--                     ON idProduto = fkProduto
--                         JOIN empresa AS emp
--                              ON idEmpresa = fkProduto where idEmpresa = 2 and statusSensor = 0;
