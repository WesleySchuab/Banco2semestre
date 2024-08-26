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

-- Day, Month, Yeaar
SET DATEFORMAT DMY;
GO

-- Inserir dados na tabela
INSERT INTO FUNCIONARIOS (
	ID,
	Nome,
	Sexo,
	Admissao,
	Salario)
VALUES (1, 'Maria da Silva', 'F', '10/01/2018', 2500);
GO

SELECT * FROM FUNCIONARIOS;
GO