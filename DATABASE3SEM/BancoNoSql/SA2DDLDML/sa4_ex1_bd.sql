-- criando data base
CREATE DATABASE IF NOT EXISTS sa4_ex1_bd; 

-- criando tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    ID INT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- criando tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    ID INT PRIMARY KEY,
    ID_clientes INT,
    data_pedido DATE,
    total DECIMAL(7,2),
    FOREIGN KEY (ID_cliente) REFERENCES clientes(ID)
);

-- 