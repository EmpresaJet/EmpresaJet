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
        fkEmpresa INT,
        funcao VARCHAR(45) DEFAULT 'Usuário', CONSTRAINT chkFuncao CHECK (funcao in('Administrador','Usuário')),
        FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
    );
    
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
        Foreign Key (fkEmpresa) REFERENCES Empresa(idEmpresa)
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
        fkProduto INT,
        FOREIGN KEY (fkPrateleira) REFERENCES prateleira (idPrateleira),
        FOREIGN KEY (fkProduto) REFERENCES produto (idProduto),
        PRIMARY KEY (id, fkPrateleira, fkProduto)
    );
   
CREATE TABLE
    dado(
        idDado INT PRIMARY KEY AUTO_INCREMENT,
        statusPrateleira INT,
        dtPrateleira DATETIME DEFAULT CURRENT_TIMESTAMP,
        fkPrateleira INT,
        Foreign Key (fkPrateleira) REFERENCES Pratelria (idPrateleira)
    );        
     
CREATE TABLE 
	historico_alerta (
		idHistorico INT PRIMARY KEY AUTO_INCREMENT,
		statusHistorico VARCHAR(45),
		dtHistorico DATETIME DEFAULT CURRENT_TIMESTAMP, 
		tipo VARCHAR(45),
		fkDado INT, 
		FOREIGN KEY (fkDado) REFERENCES dado (idDado)
);
