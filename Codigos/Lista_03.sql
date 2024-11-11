-- USE LojaIFSP3024865;
IIF DB_ID (N'LojaIFSP3024865') IS NULL 
    CREATE DATABASE LojaIFSP3024865;
ELSE 
    USE LojaIFSP3024865;
GO

-- Criação da Tabela
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NULL,
    Idade  INT CHECK (Idade > 18 ) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(200) DEFAULT 'meuemail@email.com' NOT NULL
    
);

-- 1
-- Alterar a estrutura da tabela CLIENTES, adicionando os campos DDD e Telefone, utilize os tipos de dados CHAR(2) e CHAR (10)
ALTER TABLE CLIENTES
    ADD DDD CHAR(2) NULL,
     Telefone CHAR(10);
GO

-- 2
-- Setar as informações de DDD e Telefone conforme Fig na lista de exercicios 
-- Caso os nomes esteja corretos pode ignorar essa parte:  Nome = 'Ana Cristina', 

UPDATE CLIENTES SET Nome = 'Ana Cristina', DDD = '12', Telefone = '3664-5060' WHERE ID = 1;
UPDATE CLIENTES SET Nome = 'Marcos Paulo', DDD = '12', Telefone = '3664-8090' WHERE ID = 2;
UPDATE CLIENTES SET Nome = 'André Luís', DDD = '12', Telefone = '3663-1070' WHERE ID = 3;
UPDATE CLIENTES SET Nome = 'Maria Clara', DDD = NULL , Telefone = NULL WHERE ID = 4;
UPDATE CLIENTES SET Nome = ' Pedro Augusto', DDD = '12', Telefone = '3667-6070' WHERE ID = 5;
UPDATE CLIENTES SET Nome = ' Ricardo Lima', DDD = NULL , Telefone = NULL WHERE ID = 6;
UPDATE CLIENTES SET Nome = ' José Pereira', DDD = '12', Telefone = '98790-6070' WHERE ID = 7;
UPDATE CLIENTES SET Nome = ' Marcelo Souza ', DDD = NULL , Telefone = NULL WHERE ID = 8;
UPDATE CLIENTES SET Nome = ' Daphne Lima', DDD = '12', Telefone = '97070-6070' WHERE ID = 9;
UPDATE CLIENTES SET Nome = ' Sheila Pereira ', DDD = NULL , Telefone = NULL WHERE ID = 10;
UPDATE CLIENTES SET Nome = ' Tiago Augusto ', DDD = NULL , Telefone = NULL WHERE ID = 11;
UPDATE CLIENTES SET Nome = ' Maria Pereira', DDD = '11', Telefone = '99555-001' WHERE ID = 12;
UPDATE CLIENTES SET Nome = ' Lucas silva', DDD = '11', Telefone = '97890-1010' WHERE ID = 13;
UPDATE CLIENTES SET Nome = ' Benedito Silva ', DDD = NULL , Telefone = NULL WHERE ID = 14;
UPDATE CLIENTES SET Nome = ' Fernada Pereira ', DDD = NULL , Telefone = '98888-0102' WHERE ID = 15;

-- 3
-- Copiar dasdos para a tabela temprária
SELECT *
INTO clientesCopia
FROM CLIENTES;
GO

-- Criar a restrição dentro da tabela copia 
ALTER TABLE clientesCopia
ADD CONSTRAINT PK_clientesCopia PRIMARY KEY (ID);
GO

-- 4
SELECT 








