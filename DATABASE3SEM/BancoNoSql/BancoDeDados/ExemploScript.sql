-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE exemplo_database;

CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    celular_cliente VARCHAR(12),
    nome_cliente VARCHAR(100),
    cpf_cliente VARCHAR(14) NOT NULL
);

CREATE TABLE Produto (
    id_produto SERIAL PRIMARY KEY,
    valor_produto DECIMAL(7,2) NOT NULL,
    qtde_produto INT
);

CREATE TABLE Compra (
    data_compra_produto DATE,
    id_pedido SERIAL PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    FOREIGN KEY(id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente)
);

SELECT * FROM CLIENTE, PRODUTO