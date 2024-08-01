-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE Pizzaria_Bruno;

CREATE TABLE Cliente (
CPF varchar (14) not null PRIMARY KEY,
Endereco varchar(100) not null,
Nome varchar(15) not null,
Telefone varchar(19) not null
);

CREATE TABLE Pedido (
Num_Pedido int not null PRIMARY KEY,
Total_Pedido decimal(7,2) not null,
Data_Pedido date not null,
CPF varchar (14) not null,
FOREIGN KEY(CPF) REFERENCES Cliente (CPF)
);

CREATE TABLE Produto (
Id_Produto int not null PRIMARY KEY,
Preco decimal(7,2) not null,
Nome varchar(100) not null,
Estoque int not null
);

CREATE TABLE Contem (
Quantidade int not null,
Comprovante varchar(255) primary key,
Id_Produto int not null,
Num_Pedido int not null,
FOREIGN KEY(Id_Produto) REFERENCES Produto (Id_Produto),
FOREIGN KEY(Num_Pedido) REFERENCES Pedido (Num_Pedido)
);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (CPF, Endereco, Nome, Telefone) VALUES
('19123456789', 'Rua A, 123', 'João', '11987654321'),
('19123456788', 'Rua B, 456', 'Maria', '11987654322'),
('19123456787', 'Rua C, 789', 'Pedro', '11987654323'),
('19123456786', 'Rua D, 1011', 'Ana', '11987654324'),
('19123456785', 'Rua E, 1213', 'Paula', '11987654325'),
('19123456784', 'Rua F, 1415', 'Carlos', '11987654326'),
('19123456783', 'Rua G, 1617', 'Julia', '11987654327'),
('19123456782', 'Rua H, 1819', 'Lucas', '11987654328'),
('19123456781', 'Rua I, 2021', 'Mariana', '11987654329'),
('19123456780', 'Rua J, 2223', 'Rafael', '11987654330');

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (Num_Pedido, Total_Pedido, Data_Pedido, CPF) VALUES
(1, 100.00, '2024-05-01', '19123456789'),
(2, 150.00, '2024-05-02', '19123456788'),
(3, 80.00, '2024-05-03', '19123456787'),
(4, 200.00, '2024-05-04', '19123456786'),
(5, 120.00, '2024-05-05', '19123456785'),
(6, 90.00, '2024-05-06', '19123456784'),
(7, 170.00, '2024-05-07', '19123456783'),
(8, 110.00, '2024-05-08', '19123456782'),
(9, 130.00, '2024-05-09', '19123456781'),
(10, 95.00, '2024-05-10', '19123456780');

-- Inserindo dados na tabela Produto
INSERT INTO Produto (Id_Produto, Preco, Nome, Estoque) VALUES
(1, 10.00, 'Camiseta', 50),
(2, 20.00, 'Calça Jeans', 30),
(3, 15.00, 'Tênis', 40),
(4, 25.00, 'Moletom', 20),
(5, 12.00, 'Boné', 60),
(6, 18.00, 'Jaqueta', 25),
(7, 22.00, 'Bolsa', 35),
(8, 30.00, 'Sapato', 45),
(9, 28.00, 'Saia', 15),
(10, 16.00, 'Cinto', 55);

-- Inserindo dados na tabela Contem
INSERT INTO Contem (Quantidade, Comprovante, Id_Produto, Num_Pedido) VALUES
(5, 'ABCD123456', 1, 1),
(3, 'EFGH123456', 2, 2),
(2, 'IJKL123456', 3, 3),
(4, 'MNOP123456', 4, 4),
(6, 'QRST123456', 5, 5),
(1, 'UVWX123456', 6, 6),
(7, 'YZAB123456', 7, 7),
(8, 'CDEF123456', 8, 8),
(9, 'GHIJ123456', 9, 9),
(10, 'KLMN123456', 10, 10);

-- Selecionando todos os registros da tabela Cliente
SELECT * FROM Cliente;

-- Selecionando todos os registros da tabela Pedido
SELECT * FROM Pedido;

-- Selecionando todos os registros da tabela Produto
SELECT * FROM Produto;

-- Selecionando todos os registros da tabela Contem
SELECT * FROM Contem;

-- Consultar informações do cliente apenas cpf e nome
SELECT CPF, Nome FROM Cliente;

-- Consultar número do pedido e total na tabela pedido
SELECT Num_Pedido, Total_Pedido FROM Pedido;

-- Consultar nome produto e preço da tabela produto
SELECT Nome, Preco FROM Produto;