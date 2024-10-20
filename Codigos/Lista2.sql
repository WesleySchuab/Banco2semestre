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