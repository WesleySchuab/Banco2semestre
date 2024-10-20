-- Cria o banco de Dados Ou habilita seu contexto 
IF DB_ID (N'LojaIFSP') IS NULL
    CREATE DATABASE LojaIFSP;
ELSE
    USE LojaIFSP;
GO
