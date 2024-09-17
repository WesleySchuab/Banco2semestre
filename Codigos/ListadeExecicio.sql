-- Cria o banco de dados LojaIFSP
-- Cria o banco de dados ou habilita seu contexto
-- houve um erro na hora de inserir o comando abaixo
-- Para funcionar selecionei apenas a linha 
-- CREATE DATABASE LojaIFSP3024865;
-- e depois 
 -- USE LojaIFSP3024865;
IIF DB_ID (N'LojaIFSP3024865') IS NULL 
    CREATE DATABASE LojaIFSP3024865;
ELSE 
    USE LojaIFSP3024865;
GO
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NULL,
    Idade  INT CHECK (Idade > 18 ) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(200) DEFAULT 'meuemail@email.com' NOT NULL
    
);

--Exibi a data da criação e o nome das tabelas que existem no banoc de dados em uso
SELECT create_date AS 'Data de Criação',
    name AS 'Nome da Tabela'
FROM sys.tables;
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

-- Erro devido a o valor da idade ser menor que 18
INSERT INTO CLIENTES VALUES
    (2, 'Andre Luis', 'M', 15, '33333333333',
'andre@gmail.com');
GO

-- OK, registros inseridos normalmente 
INSERT INTO CLIENTES VALUES
    (2, 'Maria Clara', 'M', 22, '4444444444444',
'maria@gmail.com');
GO

-- Erro devido a o valor do cpf
INSERT INTO CLIENTES VALUES
    (2, 'Pedro Augusto', 'M', 45, '11111111111',
'pedro@gmail.com');
GO

-- Erro devido a o valor do CPf ser nulo
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
INSERT INTO CLIENTES 
(ID, Nome, Sexo, Idade, CPF )
    VALUES (9, 'Daphne Lima', 'F', 32,
    '99999999');
GO


-- Exibi todos os registros da tabela Clientes
SELECT * FROM CLIENTES;
GO

-- Insere os registros corrigindo os erros
INSERT INTO CLIENTES VALUES
    (4, 'Marcos Paulo', 'M', 45, '22222222222', 
'marcos@gmail.com'),
    (3, 'Andre Luis', 'M', 25, '33333333333',
'andre@gmail.com'),
    (5, 'Pedro Augusto', 'M', 45, '12121111111',
'pedro@gmail.com'),
    (6, 'Ricardo Lima', 'M', 52, '66666666666',
'ricardo@gmail.com'),
    (7, 'Jose Pereira ', 'M', 45, '77777777777',
'marcos@gmail.com'),
    (8, 'Marcelo Souza', 'M', 56, '87777777777',
'marcelo@gmail.com'),
    (10, 'Sheila Pereira', NULL, 21, '10101010101',
'sheila@yahoo.com.br'),
    (11,'Tiago Augusto', NULL, 70, '20202020202',
'tiago@yahoo.com.br'),
    (12, 'Maria Pereira', 'F', 45, '30303030303',
    'maria@bol.com.br');
GO 

-- Inseri os registro sem email
INSERT INTO CLIENTES (ID, Nome, Sexo, Idade, CPF )
    VALUES (13, 'Lucas Silva', 'M', 19, '40404040404'),
            (14, 'Benedito SIlva', NULL, 44, '505050505'),
            (15, 'Fernanda Pereira', 'F', 31, '606060606');
GO           

-- Exibi Infomarações sobre a estrutura da tabela
SELECT TABLE_CATALOG    AS 'Banco de Dados',
        TABLE_NAME      AS 'Tabela',
        ORDINAL_POSITION AS 'Posição',
        COLUMN_NAME AS 'Coluna',
        DATA_TYPE AS 'Tipo de Dados',
        COLLATION_NAME AS 'Idioma da Coluna',
        IS_NULLABLE AS ' Aceita Nulo ?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Clientes';
GO

-- Exibi as informações sobre a sRestrições
SELECT CONSTRAINT_CATALOG AS 'Banco de Dados',
         TABLE_NAME      AS 'Tabela',
         CONSTRAINT_TYPE AS 'Tipo de restrições',
         CONSTRAINT_NAME AS 'Nome da Restrição'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Clientes';
GO
-- Verifica a estrutura da tabela usando o comando
-- sp_help
EXEC sp_help 'CLIENTES';
GO


