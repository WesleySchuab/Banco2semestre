-- Criando o banco
CREATE DATABASE Empresacj3024865;
GO

--Habilitar o contexto 
USE Empresacj3024865;
GO
-- Criando a tabela
CREATE TABLE FUNCIONARIOS (
	ID INT PRIMARY KEY,
	Nome VARCHAR(25) NOT NULL,
	Sexo CHAR(1) NULL,
	Admissao DATE NOT NUll,
	Salario Decimal(10,2) NOT NULL
);