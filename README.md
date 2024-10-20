# Banco 3 semestre
Material das aulas de Banco de Dados do  Instituto Federal de Educação e Tecnlogia do Estado de São Paulo.
Após aprender sobre o modelo conceitual, logico e relacional iniciamos a criação de modelos usando o BrModelo.
Modelo de exemplo criado no Drawio.
Na hora de realizar o select devemos tomar cuidado com a ordeque é
COLUNA
TABELA
CONDIÇÃO
![DigramaTeste drawio](https://github.com/user-attachments/assets/89790ff7-9dd2-4552-9833-c4ce7d81f078)

Exemplo de retorno do código inserido
![image](https://github.com/user-attachments/assets/e9c85bc1-6751-41e6-a40d-3980a040d009)

Inserindo primeiro registro no banco

![Captura de tela 2024-09-16 213836](https://github.com/user-attachments/assets/42307cb9-6100-4f64-a59c-3ff52ad5f5eb)

-- Exibi Infomarações sobre a estrutura da tabela 
SELECT TABLE_CATALOG    AS 'Banco de Dados',
        TABLE_NAME      AS 'Tabela',
        ORDINAL_POSITION AS 'Posição',
        COLUMN_NAME AS 'Coluna',
        DATA_TYPE AS 'Tipo de Dados',
        COLLATION_NAME AS 'Idioma da Coluna',
        IS_NULLABLE AS ' Aceita Nulo ?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Clientes';
GO
print da saida no Azure
![alt text](image.png)

