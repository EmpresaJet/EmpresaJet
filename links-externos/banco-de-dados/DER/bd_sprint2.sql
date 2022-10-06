-- Active: 1663369181228@@127.0.0.1@3306@empresajet
CREATE DATABASE empresajet;
USE empresajet;

CREATE TABLE
    Usuario (
        idUsuario INT PRIMARY KEY AUTO_INCREMENT,
        username VARCHAR(45) NOT NULL,
        senha VARCHAR(45) NOT NULL,
        nome VARCHAR(60) NOT NULL,
        email VARCHAR(50) NOT NULL,
        telefoneCelular VARCHAR(11) NOT NULL
    );
    


-- Insert da tabela usuario
INSERT INTO Usuario
	VALUES 
		(NULL,'Gustavo12','1234567','Gustavo de Santana','gustavo@gmail.com','1122233344'),
		(NULL,'Roberto34','abcdefg','Roberto Almeida','roberto@gmail.com','119887755'),
        (NULL,'Marcela56','abcd5678','Marcela Campos','marcela@gmail.com','11556677881');


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
        cnpj CHAR(14) NOT NULL,
        fkMatriz INT,
        FOREIGN KEY (fkMatriz) REFERENCES Empresa(idEmpresa)
    );

-- INSERT na tabela empresa        
INSERT INTO Empresa
	VALUES 
		(NULL,'Rossi','SP','São Paulo','Guaianases','Estrada Dom João Nery','0151000',NULL,'87107874000120',NULL),
		(NULL,'Rossi','MG','Ourinhos','Chapadinha','Estrada Querinda','9151094',NULL,'87107874000120',1),
		(NULL,'Rossi','RJ','Rio de Janeiro','Copacabana','Avenida Atlântica','4341934',NULL,'87107874000120',1),
		(NULL,'Assai','SP','São Paulo','Inacio Monteiro','Cachoeira Jaciquara','0432000',NULL,'96255082000194',NULL),
		(NULL,'Carrefour','SP','São Paulo','Jardim Itapemirim','Rua Reserva','0230800',NULL,'86041273000108',NULL),      
		(NULL,'Carrefour','ES','Vitória','Jardim Damasceno','Rua Reverendo ','68220840',NULL,'86041273000108',5),
		(NULL,'Carrefour','RS','Porto Alegre','Pontal','Rua Monete Claro','58230290',NULL,'86041273000108',5);       

CREATE TABLE
    Empresa_has_Usuario (
        fkEmpresa INT,
        fkUsuario INT,
        funcao VARCHAR(45) NOT NULL, CONSTRAINT chkFuncao CHECK (funcao in('Administrador','Usuario')),
        FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
        FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario),
        primary key (fkEmpresa, fkUsuario)
    );

INSERT INTO Empresa_has_Usuario 
    VALUES 
        (1,1,'Administrador'),
        (1,2,'Usuario'),
        (2,1,'Administrador'),
        (3,1,'Administrador'),
        (4,1,'Administrador'),
        (5,1,'Administrador'),
        (5,2,'Usuario');

CREATE TABLE
    Produto (
        idProduto INT PRIMARY KEY AUTO_INCREMENT,
        nomeProduto VARCHAR(50) NOT NULL,
        categoria VARCHAR(50) NOT NULL,
        preco DECIMAL(10, 2) NOT NULL,
        fkEmpresa INT,
        FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
    );

     
-- INSERT na tabela produto
INSERT INTO Produto
	VALUES  
		(NULL,'Café Pilão','Café',4.99,1),
		(NULL,'Arroz Camil','Arroz',8.98,1),
		(NULL,'Bala Fini','Doce',7.65,5);        


CREATE TABLE
    Sensor (
        idSensor INT PRIMARY KEY AUTO_INCREMENT,
        nomeSensor VARCHAR(40),
        statusSensor INT,
        fileira VARCHAR(20),
        dtSensor DATETIME DEFAULT CURRENT_TIMESTAMP,
        fkProduto INT,
        FOREIGN KEY (fkProduto) REFERENCES Produto(idProduto)
    );
        
-- INSERT na tabela sensor
INSERT INTO Sensor
	VALUES 
		(NULL,'Sensor Café',1,'2B',"2018-06-11 23:20:00",1),
		(NULL,'Sensor Arroz',0,'4B',"2018-05-11 13:30:00",2),
		(NULL,'Sensor Doces',1,'5A',"2022-04-11 23:50:00",3);
   

DESC Sensor;



   
	
-- Exibir dados das tabelas
SELECT * FROM Usuario;
SELECT * FROM Empresa;
SELECT * FROM Empresa_has_Usuario;
SELECT * FROM Produto;
SELECT * FROM Sensor;
-- Exibir Todos os dados das Empresas e de seus funcionarios
select * from Usuario 
    JOIN Empresa_has_Usuario 
        ON idUsuario = fkUsuario 
            JOIN Empresa 
                ON idEmpresa = fkEmpresa;

-- Exibir Nome das Empresas e de seus funcionarios com seus rescpectivos cargos
select emp.nomeEmpresa,user.nome,empUser.funcao from Usuario AS user 
    JOIN Empresa_has_Usuario AS empUser 
        ON idUsuario = fkUsuario 
            JOIN Empresa AS emp
                ON idEmpresa = fkEmpresa;

-- Exibir apenas funcionarios de matrizes
select emp.nomeEmpresa,user.nome,empUser.funcao from Usuario AS user 
    JOIN Empresa_has_Usuario AS empUser 
        ON idUsuario = fkUsuario 
            JOIN Empresa AS emp
                ON idEmpresa = fkEmpresa where fkMatriz is null;

-- Exibir apenas funcionarios de filiais
select emp.nomeEmpresa,user.nome,empUser.funcao from Usuario AS user 
    JOIN Empresa_has_Usuario AS empUser 
        ON idUsuario = fkUsuario 
            JOIN Empresa AS emp
                ON idEmpresa = fkEmpresa where fkMatriz >= 1;

-- Exibir os dados do sensor de determinado produto por empresa
SELECT emp.nomeEmpresa,
         pro.nomeProduto,
         pro.categoria,
         sen.nomeSensor,
         sen.statusSensor,
         sen.fileira
            FROM produto AS pro
                JOIN sensor AS sen
                    ON idProduto = fkProduto
                        JOIN empresa AS emp
                             ON idEmpresa = fkProduto;

-- Exibir produtos em falta em determinada empresa
SELECT emp.nomeEmpresa,
         pro.nomeProduto,
         pro.categoria,
         sen.nomeSensor,
         sen.statusSensor,
         sen.fileira
            FROM produto AS pro
                JOIN sensor AS sen
                    ON idProduto = fkProduto
                        JOIN empresa AS emp
                             ON idEmpresa = fkProduto where idEmpresa = 2 and statusSensor = 0;
