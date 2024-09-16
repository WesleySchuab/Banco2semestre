CREATE TABLE TESTE(
    ID INT,
    Nome CHAR(10)
);
GO
EXEC sp_columns TESTE;
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TESTE';
GO
SELECT TABLE_CATALOG        AS 'Banco de Dados',
        TABLE_NAME          AS 'Tabela',
        ORDINAL_POSITION    AS 'Posição',
        COLUMN_NAME        AS 'Coluna',
        DATA_TYPE           AS 'Tipo de Dados',
        COLLATION_NAME      AS 'Idioma da Coluna',
        IS_NULLABLE         AS 'Aceita Nulo?'
        FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE';

ALTER TABLE TESTE
    ADD Sexo CHAR(1) NULL;
GO

ALTER TABLE TESTE
    ADD DataNascimento DATE,
    Peso DECIMAL(5,2);
GO

ALTER TABLE TESTE 
    DROP COLUMN DataNascimento;
GO

//torna um campo unico
ALTER TABLE TESTE
    ADD UNIQUE (Sexo);
GO

ALTER TABLE TESTE 
    ALTER COLUMN ID INT NOT NULL;
GO


ALTER TABLE TESTE
    ADD CONSTRAINT pk_id PRIMARY KEY (ID);
GO

SELECT CONSTRAINT_CATALOG AS 'Banco de Dados',
       TABLE_NAME         AS 'Tabela',
       CONSTRAINT_TYPE    AS 'Tipo de Restrição',
       CONSTRAINT_NAME    AS 'Tipo de Restrição'
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'TESTE';      

ALTER TABLE TESTE
    DROP CONSTRAINT pk_id PRIMARY KEY (ID);
GO

DROP TABLE TESTE;
GO
SELECT * FROM TESTE;
GO

CREATE TABLE #TabelaA (
    INT ID NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Sexo CHAR(1) NULL,
    PRIMARY KEY (ID)
);