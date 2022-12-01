-- Active: 1663369181228@@127.0.0.1@3306@empresajet
CREATE DATABASE empresajet;
USE empresajet;

CREATE TABLE
    empresa (
        idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
        nomeEmpresa VARCHAR(45) NOT NULL,
        estado CHAR(2) NOT NULL,
        cidade VARCHAR(45) NOT NULL,
        bairro VARCHAR(45),
        logradouro VARCHAR(80) NOT NULL,
        cep CHAR(8) NOT NULL,
        complemento VARCHAR(45),
        cnpj CHAR(14) NOT NULL
    );


CREATE TABLE
    perfil (
        idPerfil INT PRIMARY KEY AUTO_INCREMENT,
        username VARCHAR(45) NOT NULL,
        senha VARCHAR(45) NOT NULL,
        nome VARCHAR(60) NOT NULL,
        email VARCHAR(50) NOT NULL,
        telefone VARCHAR(11),
        funcao VARCHAR(45) DEFAULT 'Administrador', CONSTRAINT chkFuncao CHECK (funcao in('Administrador','Usuário')),
        fkEmpresa INT,
        FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
    );

-- PersonID int FOREIGN KEY REFERENCES Persons(PersonID)


    CREATE TABLE 
    prateleira (
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
        fkEmpresa INT,  
        FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

CREATE TABLE
    produto (
        idProduto INT PRIMARY KEY AUTO_INCREMENT,
        nomeProduto VARCHAR(45) NOT NULL,
        descricao VARCHAR(45)
    );
    
CREATE TABLE 
	prateleira_produto (
		id INT AUTO_INCREMENT,
        fkPrateleira INT,
        FOREIGN KEY (fkPrateleira) REFERENCES prateleira (idPrateleira),
        fkProduto INT,
        FOREIGN KEY (fkProduto) REFERENCES produto (idProduto),
        PRIMARY KEY (id, fkPrateleira, fkProduto)
    );
   
CREATE TABLE
    dados_sensor(
        idDado INT PRIMARY KEY AUTO_INCREMENT,
        statusPrateleira INT,
        dtPrateleira DATETIME DEFAULT CURRENT_TIMESTAMP,
        fkPrateleira INT,
        FOREIGN KEY (fkPrateleira) REFERENCES prateleira (idPrateleira)
    );      
 
     
CREATE TABLE 
	historico_alerta (
		idHistorico INT PRIMARY KEY AUTO_INCREMENT,
		statusHistorico VARCHAR(45),
		dtHistorico DATETIME DEFAULT CURRENT_TIMESTAMP,
        titulo VARCHAR(45),
        setor VARCHAR(45),
        abastecimento int,
		estado VARCHAR(45),
        produto VARCHAR(45),
		fkDado INT,
        FOREIGN KEY (fkDado) REFERENCES dados_sensor (idDado)
);


INSERT INTO prateleira(setor,fkEmpresa) VALUES
('Frios e congelados', 1),
('Frios e congelados', 1),
('Frios e congelados', 1),
('Frios e congelados', 1),
('Frios e congelados', 1),
('Frios e congelados', 1),
('Frios e congelados', 1),
('Frios e congelados', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Mercearia', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Hortifruti', 1),
('Cuidados Pessoais', 1),
('Cuidados Pessoais', 1),
('Cuidados Pessoais', 1),
('Cuidados Pessoais', 1),
('Cuidados Pessoais', 1),
('Cuidados Pessoais', 1),
('Cuidados Pessoais', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1),
('Bebidas', 1);

-- FRIOS E CONGELADOS	
INSERT INTO Produto (nomeProduto, descricao) VALUES
('Mussarela','Mussarela 500G'),
('Queijo Prado','Queijo Prado 300G'),
('BATATA FRITA','Presunto Sadia 400G'),
('SALADA','Manteiga 1KG'),
('Requeijão','Requeijão 400G'),
('Iogurte de Morango','Iogurte de Morango 500G'),
('Sorvete Tentação','Sorvete Tentação 1L'),
('Hot Pocket','Hot Pocket de carne');

-- MERCEARIA	
INSERT INTO Produto (nomeProduto, descricao) VALUES
('Cereal Sucrilhos Kelloggs',null),
('Cereal Muslix Quacker',null),
('Arroz Branco Camil',null),
('Feijão Preto Camil',null),
('Azeitona Galo',null),
('Ketchup',null),
('Maionese',null),
('Sal Lebre', null),
('Óleo vegetal Soya', null),
('Achocolatado Nescau', null);

-- HORTIFRUTI
INSERT INTO Produto (nomeProduto, descricao) VALUES
('Tomate Italiano orgânico Taeq',null),
('Batata Baroa orgânica Taeq',null),
('Cenoura orgânica Taeq',null),
('Cebola Amarela orgânica Taeq',null),
('Alho orgânico Taeq',null),
('Banana prata',null),
('Maçã fuji',null),
('Morango orgânico', null),
('Alface Americano', null);

-- CUIDADOS PESSOAIS	
INSERT INTO Produto (nomeProduto) VALUES
('Pasta de Dente Colgate'),
('Fio Dental OralB'),
('Sabonete Palmolive'),
('Sabonete Dove'),
('Shampoo Pantene'),
('Condicionador Pantene'),
('Desodorante Dove');

-- BEBIDAS
INSERT INTO Produto (nomeProduto) VALUES
('Refrigerante Coca-Cola'),
('Refrigerante Coca-Cola Zero'),
('Energético Redbull'),
('Energético Redbull Sem açucar'),
('Refrigerante Fanta Laranja'),
('Refrigerante Fanta Guaraná'),
('Cerveja Heineken'),
('Cerveja Original'),
('Cerveja Amster Lager'),
('Chá Matte Limão');

INSERT INTO Prateleira_Produto(fkPrateleira, fkProduto) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30),
(31,31),
(32,32),
(33,33),
(34,34),
(35,35),
(36,36),
(37,37),
(38,38),
(39,39),
(40,40),
(41,41),
(42,42),
(43,43),
(44,44);

use empresajet;

-- estado atual das gondolas 

select * from dados_sensor ; 

select count(idDado) from dados_sensor where statusPrateleira = 3  order by dtPrateleira desc limit 5;

SELECT (SELECT DISTINCT ROUND ((SUM(statusPrateleira) / (44 * 3) * 100)) 
FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as wip_abastecido ) as abastecido,
(SELECT DISTINCT ROUND ((100 - (SUM(statusPrateleira) / (44 * 3) * 100))) FROM 
(SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) AS wip_nao_abastecido)  as nao_abastecido;
                        

select * from usuario;
select * from prateleira;
  
  
-- Pegar quantos tao faltando de cada setor, nos ultimos 44 dados 
SELECT COUNT(idPrateleira) FROM prateleira WHERE setor = 'Bebidas';

SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.setor = 'Mercearia'
ORDER BY ds.idDado DESC LIMIT 10) as empresa_dados;

SELECT DISTINCT setor FROM prateleira;

-- FRIOS E CONGELADOS: 8 prat 

SELECT (SELECT (24 - SUM(statusPrateleira)) FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.setor = 'Frios e congelados'
ORDER BY ds.idDado DESC LIMIT 8) as empresa_dados) falta_frios;

-- MERCEARIA: 10 prat

SELECT (SELECT (30 - SUM(statusPrateleira)) FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.setor = 'Mercearia'
ORDER BY ds.idDado DESC LIMIT 10) as empresa_dados) falta_mercearia;

-- HORTIFRUTI: 9 prat

SELECT (SELECT (27 - SUM(statusPrateleira)) FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.setor = 'Hortifruti'
ORDER BY ds.idDado DESC LIMIT 9) as empresa_dados) falta_hortifruti;

-- CUIDADOS PESSOAIS: 7 prat 

SELECT (SELECT (21 - SUM(statusPrateleira)) FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.setor = 'Cuidados Pessoais'
ORDER BY ds.idDado DESC LIMIT 7) as empresa_dados) falta_cuidados;

-- BEBIDAS: 10 prat 

SELECT (SELECT (30 - SUM(statusPrateleira)) FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.setor = 'Bebidas'
ORDER BY ds.idDado DESC LIMIT 10) as empresa_dados) falta_bebidas;





























-- ------------------------------------------------------------------------------

SELECT (24 - SUM(statusPrateleira)) FROM (SELECT ds.statusPrateleira FROM ((SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.setor = 'Frios e congelados'
ORDER BY ds.idDado DESC LIMIT 8) as empresa_dados)) AS dados_setor;

SELECT (24 - SUM(statusPrateleira)) FROM (SELECT ds.statusPrateleira FROM ((SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as empresa_dados) WHERE prat.setor = 'Frios e congelados') AS dados_setor;


SELECT (SELECT DISTINCT (SELECT (24 - SUM(statusPrateleira)) 
FROM (SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as dados_empresa) AS dados_setor ) FROM prateleira prat WHERE prat.setor = 'Frios e congelados') AS faltas_setor ;


SELECT (SELECT DISTINCT (24 - SUM(statusPrateleira)) 
FROM (SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as dados_empresa) AS dados_setor ) AS faltas_setor ;

SELECT (SELECT DISTINCT (24 - SUM(statusPrateleira)) 
FROM (SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as dados_empresa
) AS dados_setor ) AS faltas_setor ;

SELECT COUNT(ds.statusPrateleira) FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44;

SELECT (SELECT DISTINCT (SELECT (24 - SUM(statusPrateleira)) 
FROM (SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as dados_empresa) AS dados_setor ) FROM prateleira prat WHERE prat.setor = 'Frios e congelados') 
AS faltas_setor ;


SELECT (24 - SUM(statusPrateleira)) FROM (SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as dados_empresa) as dados WHERE setor = 'Frios e congelados';




-- ----------------------------

SELECT (SELECT DISTINCT (SELECT (24 - SUM(statusPrateleira)) 
FROM (SELECT (SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as dados_empresa) AS dados_setor  FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
 WHERE prat.setor = 'Frios e congelados')as wip) 
AS wip2) AS faltas_setor;



SELECT (SELECT DISTINCT (SELECT (24 - SUM(statusPrateleira)) 
FROM (SELECT ((SELECT statusPrateleira FROM (SELECT ds.statusPrateleira FROM dados_sensor ds 
JOIN prateleira prat ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1
ORDER BY ds.idDado DESC LIMIT 44) as dados_empresa) AS dados_setor ) FROM prateleira prat WHERE prat.setor = 'Frios e congelados') as wip) 
AS wip2) AS faltas_setor;


SELECT COUNT(idPrateleira) FROM (SELECT prat.idPrateleira FROM prateleira prat
JOIN dados_sensor ds  ON ds.fkPrateleira = prat.idPrateleira
JOIN empresa e ON prat.fkEmpresa = e.idEmpresa WHERE e.idEmpresa = 1 AND prat.idPrateleira >= 1 AND prat.idPrateleira <= 8
ORDER BY ds.idDado DESC LIMIT 44) as wip;

