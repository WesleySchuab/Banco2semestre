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

INSERT INTO FUNCIONARIOS VALUES (9, 'Maria Cristina', 'F', '12/10/2014', 990.00);
GO

INSERT INTO FUNCIONARIOS VALUES (10, 'Maria Cristina', 'F', '12/10/2014', 990.00);
GO

--SELECT TOP 3 * FROM FUNCIONARIOS;
--GO

SELECT * FROM FUNCIONARIOS
ORDER BY Nome DESC;
GO

SELECT * FROM FUNCIONARIOS
WHERE Salario < 3000
ORDER BY Nome, Salario DESC;
--SELECT * FROM FUNCIONARIOS
--WHERE Sexo = 'M' AND Salario > 1000;
--GO

--SELECT * FROM FUNCIONARIOS
--ORDER BY Nome;
--GO

--SELECT ID AS 'Codigo do funcionário',
  --  Nome,
   -- Sexo,
   -- Salario AS 'Salarios'
--FROM FUNCIONARIOS;
--GO

--SELECT * FROM FUNCIONARIOS;
--GO

-- Habilitar o contexto
USE Empresacj3024865
GO
-- Exibi a data de criação e o nome das tabelas existentes no banco de dados em uso no momento
SELECT create_date AS 'Data de Criação',
		name AS 'Nome da Tabela'
FROM sys.tables;
GO

-- Adiciona o campo telefone na tabela FUNCIONARIOS
ALTER TABLE FUNCIONARIOS
	ADD 	Telefone CHAR(10);
GO

SELECT * FROM FUNCIONARIOS
GO

-- Exibi as informações da estrutura da tabela Funcionarios
SELECT TABLE_CATALOG AS 'Banco de Dados',
	   TABLE_NAME AS 'Tabela',
	   ORDINAL_POSITION AS 'Posição',
	   COLUMN_NAME AS 'Coluna',
	   DATA_TYPE AS 'Tipo de Dados',
	   COLLATION_NAME AS 'Idioma da Coluna',
	   IS_NULLABLE AS 'Aceita Nulo ?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Funcionarios';
GO

------------------------------------------------------------------------------------------------------------
-- Atualização de dados com UPDATE
----------------------------------------------
UPDATE FUNCIONARIOS
	SET Telefone = '3668-0010';
Go

UPDATE FUNCIONARIOS
	SET Telefone = NULL;
Go

UPDATE FUNCIONARIOS
	SET Telefone = '3668-0010'
	WHERE ID = 1;
Go

-- Atualização do Telefone dos funcionários
UPDATE FUNCIONARIOS SET Telefone = '36681550' WHERE ID = 2;
UPDATE FUNCIONARIOS SET Telefone = '36645000' WHERE ID = 3;
UPDATE FUNCIONARIOS SET Telefone = '36642001' WHERE ID = 4;
UPDATE FUNCIONARIOS SET Telefone = '36639000' WHERE ID = 5;
UPDATE FUNCIONARIOS SET Telefone = '36637000' WHERE ID = 6;
UPDATE FUNCIONARIOS SET Telefone = '36621515' WHERE ID = 7;

-- Concede um aumento de 10% para os funcionários que foram admitidos antes de 2016
UPDATE FUNCIONARIOS
	SET Salario = Salario * 1.10
	WHERE YEAR(Admissao) < 2016;
GO

CREATE TABLE FUNCIONARIOSCOPIA (
	ID INT PRIMARY KEY,
	Nome VARCHAR(25) NOT NULL,
	Sexo CHAR(1) NULL,
	Admissao DATE NOT NUll,
	Salario Decimal(10,2) NOT NULL
);

--------------
removendo Regristros
DELETE FROM FUNCIONARIOSCOPIA
WHERE Salario < 1500;
GO


-- Remove todos os registros
TRUNCATE TABLE FUNCIONARIOSCOPIA;
GO
DROP TABLE FUNCIONARIOSCOPIA;
GO
SELECT create_date AS 'DAta de Criação',
	name AS 'Nome da Tabela'
FROM sys.tables;
GO