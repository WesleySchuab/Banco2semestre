-- Cria o banco de dados LojaIFSP
-- Cria o banco de dados ou habilita seu contexto
IF DB_ID (N'LojaIFSP') is NULL 
    CREATE DATABASE LojaIFSP;
ELSE 
    USE LojaIFSP;
GO
--Ebxbi a data da criação e o nome das tabelas que existem no banoc de dados em uso
SELECT create_date AS 'Data de Criação',
    name AS 'Nome da Tabela'
FROM sys.tables;
GO

-- Cria a tabela para armazenar os clientes
-- Observe a maneira como são criadas as restrições

CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NULL,
    Idade  INT CHECK (Idade > 18 ) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(200) DEFAULT 'meuemail@email.com' NOT NULL
    
);
GO
-- Verifica a inserção dos registros com restrições
-- OK, registros inseridos normalmente 
INSERT INTO CLIENTES VALUES
    (1, 'Ana Cristina', 'F', 20, '11111111111',
'ana@gmail.com');
GO

-- Erro devido ao valor repetido da chave primaria
INSERT INTO CLIENTES VALUES 
(1, 'Marcos Paulo', 'M', 45, '22222222222',
'marcos@gmail.com');
GO

-- Erro devido o valor da idade ser menor que 18
INSERT INTO CLIENTES VALUES
    (2, 'Andre Luis', 'M', 15, '333333333333',
'andre@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (2, 'Maria Clara', 'M', 22, '4444444444444',
'maria@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (2, 'Pedro Augusto', 'M', 45, '11111111111',
'pedro@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (2, 'Ricardo Lima', 'M', 52, NULL,
'ricardo@gmail.com');
GO

INSERT INTO CLIENTES VALUES
    (2, 'Jose Pereira ', 'M', 45, '77777777777',
'marcos@gmail.com');
GO

-- Erro devido a o total de carateres do Sexo
INSERT INTO CLIENTES VALUES
    (8, 'Marcelo Souza', 'Masculino', 56, '87777777777',
'marcelo@gmail.com');
GO

-- Maneira de inserir campso com valor DEFAULT
INSERT INTO CLIENTES VALUES
(ID, Nome, Sexo, Idade, CPF )
    VALUES (9, 'Daphne Lima', 'F', 32,
    '99999999');
GO

-- Exibi todos os registros da tabela Clientes
SELECT * FROM CLIENTES;
GO

-- Insere os registros corrigindo os erros
INSERT INTO CLIENTES VALUES
    (2, 'Marcos Paulo', 'M', 45, '22222222222', 
'marcos@gmail.com'),
    (3, 'Andre Luis', 'M', 25, '333333333333',
'andre@gmail.com'),
    (5, 'Pedro Augusto', 'M', 45, '11111111111',
'pedro@gmail.com'),
    (6, 'Ricardo Lima', 'M', 52, '66666666666',
'ricardo@gmail.com'),
    (7, 'Jose Pereira ', 'M', 45, '77777777777',
'marcos@gmail.com'),
    (8, 'Marcelo Souza', 'Masculino', 56, '87777777777',
'marcelo@gmail.com'),
    (10, 'Sheila Pereira', NULL, 21, 10101010101),
'sheila@yahoo.com.br'),
    (11,'Tiago Augusto', NULL, 70, '20202020202',
'tiago@yahoo.com.br'),
    (12, 'Maria Pereira', 'F', 45, '30303030303',
    'maria@bol.com.br');
GO    

