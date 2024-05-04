-- EXERCÍCIO 1

-- criando data base
CREATE DATABASE sa4_bd;

-- criando tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    ID SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- criando tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    ID SERIAL PRIMARY KEY,
    ID_clientes INT,
    data_pedido DATE,
    total DECIMAL(7,2),
    FOREIGN KEY (ID_clientes) REFERENCES clientes(ID)
);

-- modificação da tabela
ALTER TABLE pedidos
ADD COLUMN Status VARCHAR(20);

-- inserção de itens na tabela clientes
INSERT INTO clientes (nome, sobrenome, email) VALUES
('João', 'Silva', 'joao@gmail.com'),
('Maria', 'Santos', 'maria@outlook.com'),
('José', 'Pereira', 'jose@yahoo.com');

-- inserção de pedidos na tabela pedidos
INSERT INTO pedidos (ID_clientes, data_pedido, total, status) VALUES
(1, '2024-03-05', 100.00, 'Finalizado'),
(2, '2024-04-2', 150.00, 'Em andamento'),
(3, '2024-03-25', 200.00, 'Finalizado'),
(1, '2024-03-12', 120.00, 'Cancelado'),
(3, '2024-04-05', 240.00, 'Em andamento');

-- atualização de dados da tabela pedido na coluna total
UPDATE pedidos
SET Total = 150.00
WHERE ID = 2;

-- exclusão dos pedidos do cliente da tabela "pedidos"
DELETE FROM pedidos WHERE ID_clientes = (1);

-- exclusão do cliente da tabela "clientes"
DELETE FROM Clientes WHERE ID = (1);

-- mostrar pedidos "Em andamento"
SELECT * FROM pedidos
WHERE Status = 'Em andamento';

-- mostrar pedidos nos ultimos 30 dias
SELECT * from PEDIDOS where Data_Pedido > '2024-03-08';


-- EXERCÍCIO 2

-- criando data base
CREATE DATABASE sa4_bd_2;

-- 1.criando tabela de produtos

CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descrição TEXT,
    Preco DECIMAL(7, 2)
);

-- 2.campo preço não pode ser negativo
ALTER TABLE Produtos
ADD CONSTRAINT Preco_Positive CHECK (Preco >= 0);

-- 3.Crie uma tabela chamada “Pedidos” com os campos.
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    Data DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(50)
);

-- 4.Crie uma tabela de junção chamada "Pedidos_Produtos" para registrar os produtos
CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    Quantidade INT,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
);

-- 5.Defina uma restrição de chave composta na tabela "Pedidos_Produtos" utilizando os campos "ID_Pedido" e "ID_Produto".
ALTER TABLE Pedidos_Produtos
ADD CONSTRAINT pk_Pedidos_Produtos PRIMARY KEY (ID_Pedido, ID_Produto);

-- 6.Adicione um índice na coluna "Nome" da tabela "Produtos" para otimizar consultas por nome do produto.
