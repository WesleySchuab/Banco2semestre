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

INSERT INTO FUNCIONARIOS VALUES (2, 'Pedro Pereira', 'M', '25/05/2015', 990.00);
GO

INSERT INTO FUNCIONARIOS VALUES (3, 'Maria Cristina', 'F', '10/09/2015', 990.00);
GO

INSERT INTO FUNCIONARIOS VALUES (4, 'Antonio Carlos', 'M', '15/05/2015', 990.00);
GO

INSERT INTO FUNCIONARIOS VALUES (5, 'Marcelo Augusto', 'M', '09/12/2017', 990.00);
GO

INSERT INTO FUNCIONARIOS VALUES (6, 'Pedro Silva', 'M', '15/11/2015', 990.00);
GO

INSERT INTO FUNCIONARIOS VALUES (7, 'Monica da Silva ', 'F', '12/10/2014', 990.00);
GO

INSERT INTO FUNCIONARIOS VALUES (8, 'Tiago lima', 'M', '12/10/2014', 990.00);
GO
SELECT ID AS 'Codigo do funcionário',
    Nome,
    Sexo,
    Salario AS 'Salarios'
FROM FUNCIONARIOS;
GO
--SELECT * FROM FUNCIONARIOS;
--GO