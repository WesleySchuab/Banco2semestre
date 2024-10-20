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