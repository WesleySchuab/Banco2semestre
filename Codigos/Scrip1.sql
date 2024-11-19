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

SELECT * FROM FUNCIONARIOS
WHERE Sexo <> 'M';
GO

SELECT * FROM FUNCIONARIOS
WHERE Sexo != 'M';
GO

-- Roda duas vezes é lento
SELECT * FROM FUNCIONARIOS
WHERE NOT Sexo = 'M';
GO

SELECT * FROM FUNCIONARIOS
WHERE Salario >= 1000 AND 
Salario <= 1800;
GO

SELECT * FROM FUNCIONARIOS
WHERE Salario BETWEEN  1000 AND 1800;
GO

SELECT * FROM FUNCIONARIOS
WHERE Telefone IS NULL;
GO
---------
Operador existentes
IF EXISTS(
	SELECT * FROM FUNCIONARIOS
	WHERE Salario > 2000
)
	PRINT 'Alguem recebe acima de 200';
ELSE
	PRINT 'Ninguem recebe acima de 200'
GO

------------
-- Operador IN
SELECT * FROM FUNCIONARIOS
WHERE ID = 1 ORDER	
	ID = 2 ORDER
	ID = 5;
GO

SELECT * FROM FUNCIONARIOS
WHERE ID IN (1,2,5);
GO

SELECT * FROM FUNCIONARIOS
WHERE Salario IN ( SELECT Salario FROM FUNCIONARIOS WHERE Salario > 2000.00
);
GO

-- Exibe funcionário cujo o nome começa com M
SELECT * FROM FUNCIONARIOS
WHERE Nome LIKE 'M%';
GO

SELECT * FROM FUNCIONARIOS
WHERE UPPER(Nome) LIKE '%SILVA%'
ORDER BY Nome;
GO

USE Empresacj3024865;
GO

-- Criando uma VIEW
-- Utlisando aliases para algumas colunas.

CREATE VIEW MaioresSalarios AS
    SELECT ID AS 'Código do funcionário',
        Nome,
        Sexo,
        Salario AS 'Salário'
    FROM FUNCIONARIOS;
GO

SELECT * FROM CLIENTES;
GO

SELECT * FROM MaioresSalarios;
GO

SELECT [Código do funcionário],
	Nome,
	Salário
FROM MaioresSalarios
GO

--Alterando uma ViEW
ALTER VIEW MaioresSalarios AS
	SELECT ID AS 'Código do funcário',
	Nome,
	Sexo AS 'Sexo do funcionário',
	Salario AS 'Salário'
FROM FUNCIONARIOS
ORDER BY Salario DESC
OFFSET 0 ROWS;
GO

--Utilisando uma VIEW
-- Exibe os salários acima de 1500,00
SELECT [Código do funcário],
Nome,
"Sexo do Funcionário",
Salário
FROM MaioresSalarios
WHERE Salário > 1500;
GO

--Exibindo informações sobre uma VIEW
EXEC sp_helptext MaioresSalarios;
GO
SELECT TABLE_NAME AS 'Nome da View',
		VIEW_DEFINITION AS 'Código SQL'
FROM INFORMATION_SCHEMA.Views;		

-- Exclui a VIEW 
DROP VIEW MaioresSalarios;
GO

--Exibe o local ondde cada banco de dados esta armazenado
SELECT name           AS 'Banco de Dados',
       physical_name  AS 'Diretório'
FROM sys.master_files
GO

--HABILITA O CONTEXTO
use [ Nome do BAnco ]
GO

--exibe a data de criação e o nome das tabelas
--existentes no banco de dados em uso no momento
SELECT create_date AS'Data de Criação',
       name       AS'Nome da Tabela'
FROM sys.tables;
go

-- cria a tabela dependentes
CREATE TABLE DEPENDENTES (
             CodDependente INT PRIMARY KEY,
			 Nome VARCHAR (35) NOT NULL,
			 Sexo CHAR (1) NULL,
			 DataNascimento DATE NOT NULL,
			 ID INT FOREIGN KEY REFERENCES
FUNCIONARIOS (ID)
);
GO

--altera o formato de data do sql sever
SET DATEFORMAT DMY;
GO

-- Insere os dados na tabela DEPENDENTES, utilizando os 
-- dados provenientes do arquivo 'DEPENDENTES.CSV'
-- ATENÇÃO altere o local do arquivo 'DEPENDENTES.CSV'
-- No exemplo em sala o arquivo dependentes.csv foi salvo nesse caminho para os alunos apenas executarem 
-- Exemplo de patch C:\Users\cj3024865\Downloads\dependentes.csv'

BULK INSERT DEPENDENTES
     FROM '/dados/dependentes.csv'
WITH (
     FIRSTROW = 2,
	 DATAFILETYPE = 'widechar',
	 FIELDTERMINATOR = ','
);
GO

SELECT * FROM FUNCIONARIOS;
GO

SELECT * FROM DEPENDENTES;
GO

--CROSS JOIN

--realiza a junção cruzada entre os dados
-- das tabela FUNCIONARIOOS E DEPENDENTES
--Versão 1: sintaxe antiga 

SELECT * FROM FUNCIONARIOS,DEPENDENTES;
GO

--Atualizada
SELECT * FROM FUNCIONARIOS CROSS JOIN
DEPENDENTES;
GO

-- Realiza a junção cruzada entre os dados das tabelas
--FUNCIONARIOS E DEPENDENTES. Utiliza um alias para nomear cada tabela.
SELECT F.ID             AS 'Código do Funcionario',
       F.Nome           AS 'Nome do Funcionario',
       D.Nome           AS 'Nome do Dependente',
	   D.DataNascimento AS 'Data de Nascimento'
FROM FUNCIONARIOS F CROSS JOIN DEPENDENTES D;
GO

-- Exibe O id, NOME E SALARIO DOS FUNCIONARIOS, JUNTO COM O NOME DO DEPENDENTE E O CODIGO DO RESPONSAVELPOR ELE.
 --Exibe SOMENTE o registro do funcionario que possui algum dependente.

 SELECT F.ID      AS 'Código do Funcionario',
        F.Nome    AS 'Nome do funcionario',
        F.Salario AS ' Salário',
		D.Nome    AS 'Nome do Dependente',
		D.ID      AS 'Código do Responsavel'
FROM FUNCIONARIOS F JOIN DEPENDENTES D 
    ON F.ID = D.ID;
GO

-- Exibe os dados dos funcionários e de seus dependentes, utilizando alias para nomear cada coluna. Ordena o resultado pelo nome de funcionário e do dependente.
--exibe somente os registros dos dependentes que nasceram a partir do ano 2000.
SELECT F.ID              AS 'Código do Funcionario',
        F.Nome           AS 'Nome do funcionario',
        F.Salario        AS ' Salário',
		D.Nome           AS 'Nome do Dependente',
		D.DataNascimento as 'Data de Nascimento',
		D.ID             AS 'Código do Responsavel'
FROM FUNCIONARIOS F INNER JOIN DEPENDENTES D 
    ON F.ID = D.ID
WHERE YEAR (D.DataNascimento) >= 2000
ORDER BY F.Nome, D.Nome;
GO

-- Adiciona o telefone
ALTER TABLE FUNCIONARIOS
   ADD Telefone CHAR (10)
GO

--insere mais cinco novos funcionários
INSERT INTO FUNCIONARIOS VALUES
(11, 'Ana Claudia', 'F', '12/09/2011', 4900.00, '3663-9090'),
(12, 'André Lima', 'M', '12/09/2009', 2050.00, '3664-8989'),
(13, 'Marco Souza', 'M', '12/09/2009', 37800.00, 'NULL'),
(14, 'Mariana Gomes', 'F', '12/09/2010', 1750.50, 'NULL'),
(15, 'Cinthia Faria', 'F', '12/09/2016', 1750.50, '3662-1212');
GO


--exibe todos os registros da tabela FUNCIONARIOS
SELECT * FROM FUNCIONARIOS
GO

--exibe as informações de todos os funcionarios, inclusive daqueles 
--que não possuem nenhum dependente
SELECT  F.ID              AS 'Código do Funcionario',
        F.Nome           AS 'Nome do funcionario',
		F.Admissao       AS'Admissão',
        F.Salario        AS ' Salário',
		D.Nome           AS 'Nome do Dependente',
		D.DataNascimento as 'Data de Nascimento'
FROM FUNCIONARIOS F LEFT OUTER JOIN DEPENDENTES D 
    ON F.ID = D.ID;
GO
-- Junção de tabelas 
-- Sintaxe baisca de um JOIN
SELECT CAMPO1, CAMPO2, ... CAMPON
FROM Tabela1 JOIN Tabela2
	ON  Tabela1.PK = Tabela.FK;
GO

-- Sintaxe básica de um join envolvendo mais de duas tabelas
-- Primeiro Subconjunto
SELECT CAMPO1, CAMPO2, ... CAMPON
FROM Tabela1 JOIN Tabela2
	ON  Tabela1.PK = Tabela.FK
	JOIN Tabela3
		ON Tabela1.PK = Tabela3.FK;	
GO

-- Tipos de Join
-- Critérios podem ser internos ou externos
-- INNER JOIN Retorna registros de ambas as tabelas que satisfaçam uma condição.
-- Possui seguintes tipos:
-- Theta Join - Deseigualdade
-- Equi Join uma condição equitativa
-- Natural Join uma condição de igualdade

-- Junção Externa
-- Utilizado para retornar dados de ambas das tabelas que podem ou não satisfazer uma determinada condição
-- Possui os seguintes tipos:
-- LEFT JOIN, RIGHT JOIN, FULL JOIN
-- CROSS JOIN
-- Utilizado para retornar o produto carteziano entre duas tabelas

-- Sintaxe do Cross Join
 SELECT * FROM T1 CROSS JOIN T2; 

-- Sintaxe do Natural Join
 SELECT * FROM T1 Natural JOIN T2; 
-- Retorna somentes os Registros com valores correspondente nas duas tabelas 
-- As colunas devem ter os mesmo nomes e tipos de dados similares

-- Sintaxe do Natural Join Using
 SELECT * FROM T1 Natural JOIN T2
Using(C1);
-- Retorna somentes os Registros com valores correspondente na coluna indicada. No caso a coluna C1 deve exixtir em ambas as tabelas.

Sintaxe do Join ON e Inner JOIN

Join ON
SELECT * FROM T1 JOIN T2 ON T1.PK = T2.FK;

INNER JOIN 
SELECT * FROM T1 INNER JOIN T2 ON T1.PK = T2.FK;

-- Retorna somente os registros que atendam a uma condição de junção 

Sintaxe do LEFT OUTER JOIN
SELECT * FROM T1 LEFT OUTER JOIN T2 ON T1.PK = T2.FK; 
-- Retorna somente os registros que atendam a uma condição de junção. 
-- Inclui as colunas da tabela á esquerda (T1), sem que haja correspondecia de seus valores dentro da tabela da direita 

Sintaxe do RIGHT OUTER JOIN
SELECT * FROM T1 RIGHT OUTER JOIN T2 ON T1.PK = T2.FK; 
-- Retorna somente os registros que atendam a uma condição de junção. 
-- Inclui todas as colunas da tabela á direita (T2),...

Sintaxe do FULL OUTER JOIN 
SELECT * FROM T1 FULL OUTER JOIN T2 ON T1.PK = T2.FK;
Retorna os Registros que atendam ou não uma condição de junção. A clausula é opcional 

Sintaxe do THETA JOIN 
SELECT * FROM T1 INNER JOIN T2 ON T1.PK > T2.FK;
Retorna somente os registros que atendam a uma condição de junção. A junção Thera não utiliza uma condição de igualdade.

Junção de tabelas
O conceito de junção é o mesmo para qualquer DER.

Cláusula CROSS JOIN 
Realiza a junção cruzada de dados das tabelas FUNCIONÁRIOS e DEPENDENTES
