-- Cria o banco de Dados Ou habilita seu contexto 
IF DB_ID (N'LojaIFSP') IS NULL
    CREATE DATABASE LojaIFSP;
ELSE
    USE LojaIFSP;
GO
-- Exibir a data de criação e nome das tabelas
SELECT create_date AS 'Data de Criação',
    name AS 'Nome da Tabela'
FROM Sys.tables 

-- Cria tabela para armazenar os clientes
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY ,
    Nome  VARCHAR ( 50 ) NOT NULL,
    Sexo CHAR ( 1 ) NULL,
    Idade INT CHECK ( Idade > 18 ) NOT NULL,
    CPF CHAR ( 11 ) UNIQUE NOT NULL ,
    Email VARCHAR ( 200 ) DEFAULT 'meu@email.com' NOT NULL
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

-- Erro no azure
--Msg 2627, Level 14, State 1, Line 1
--Violation of PRIMARY KEY constraint 'PK__CLIENTES__3214EC277C3456C8'. Cannot insert duplicate key in object 'dbo.CLIENTES'. The duplicate key value --is (1).

-- Erro devido a o valor da idade ser menor que 18
INSERT INTO CLIENTES VALUES
    (3, 'Andre Luis', 'M', 15, '33333333333',
'andre@gmail.com');
GO

--Msg 547, Level 16, State 0, Line 1
--The INSERT statement conflicted with the CHECK constraint "CK__CLIENTES__Idade__38996AB5". The conflict occurred in database "LojaIFSP", table "dbo.--CLIENTES", column 'Idade'.

-- OK, registros inseridos normalmente 
INSERT INTO CLIENTES VALUES
    (4, 'Maria Clara', 'M', 22, '44444444444',
'maria@gmail.com');
GO

-- Erro devido a o valor do cpf
INSERT INTO CLIENTES VALUES
    (5, 'Pedro Augusto', 'M', 45, '11111111111',
'pedro@gmail.com');
GO

--Msg 2627, Level 14, State 1, Line 2
--Violation of UNIQUE KEY constraint 'UQ__CLIENTES__C1F89731F5C5D56B'. Cannot insert duplicate key in object 'dbo.CLIENTES'. The duplicate key value --is (11111111111).

-- Erro devido a o valor do CPf ser nulo
INSERT INTO CLIENTES VALUES
    (6, 'Ricardo Lima', 'M', 52, NULL,
'ricardo@gmail.com');
GO

Msg 515, Level 16, State 2, Line 2
Cannot insert the value NULL into column 'CPF', table 'LojaIFSP.dbo.CLIENTES'; column does not allow nulls. INSERT fails.

-- Insere os registros corrigindo os erros
INSERT INTO CLIENTES VALUES
    (2, 'Marcos Paulo', 'M', 45, '22222222222', 'marcos@gmail.com'),

    (3, 'Andre Luis', 'M', 25, '33333333333', 'andre@gmail.com'),

    (5, 'Pedro Augusto', 'M', 45, '12121111111', 'pedro@gmail.com'),

    (6, 'Ricardo Lima', 'M', 52, '66666666666', 'ricardo@gmail.com'),

    (7, 'Jose Pereira ', 'M', 45, '77777777777', 'marcos@gmail.com'),

    (8, 'Marcelo Souza', 'M', 56, '88888888888', 'marcelo@gmail.com'),

    (10, 'Sheila Pereira', NULL, 21, '10101010101', 'sheila@yahoo.com.br'),

    (11,'Tiago Augusto', NULL, 70, '20202020202', 'tiago@yahoo.com.br'),

    (12, 'Maria Pereira', 'F', 45, '30303030303', 'maria@bol.com.br');
GO 

-- Inseri os registro sem email
INSERT INTO CLIENTES (ID, Nome, Sexo, Idade, CPF )
    VALUES (13, 'Lucas Silva', 'M', 19, '40404040404'),
            (14, 'Benedito SIlva', NULL, 44, '505050505'),
            (15, 'Fernanda Pereira', 'F', 31, '606060606');
GO           

-- Exibi todos os registros da tabela cliente
SELECT * FROM CLIENTES;
GO

-- Exibi as informações sobre as Restrições
SELECT CONSTRAINT_CATALOG AS 'Banco de Dados',
         TABLE_NAME      AS 'Tabela',
         CONSTRAINT_TYPE AS 'Tipo de restrições',
         CONSTRAINT_NAME AS 'Nome da Restrição'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Clientes';
GO