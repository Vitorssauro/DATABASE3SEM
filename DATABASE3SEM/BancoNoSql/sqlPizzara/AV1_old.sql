CREATE DATABASE pizzaria;

-- Tabela de Clientes
CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Tabela de Pedidos
CREATE TABLE pedido (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    status_id INT,
    funcionario_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (status_id) REFERENCES status_pedido(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);

-- Tabela de Status de Pedidos
CREATE TABLE status_pedido (
    id SERIAL PRIMARY KEY,
    status VARCHAR(50)
);

-- Tabela de Funcionários
CREATE TABLE funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(100),
    area_id INT,
    supervisor_id INT,
    FOREIGN KEY (area_id) REFERENCES area_trabalho(id),
    FOREIGN KEY (supervisor_id) REFERENCES funcionario(id)
);

-- Tabela de Áreas de Trabalho
CREATE TABLE area_trabalho (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela de Detalhes de Entrega
CREATE TABLE detalhes_entrega (
    id SERIAL PRIMARY KEY,
    pedido_id INT,
    endereco_entrega VARCHAR(255),
    data_entrega DATE,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id)
);

-- Tabela de Itens de Pedido
CREATE TABLE item_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT,
    pizza_id INT,
    tamanho_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (pizza_id) REFERENCES pizza(id),
    FOREIGN KEY (tamanho_id) REFERENCES tamanho(id)
);

-- Tabela de Pizzas
CREATE TABLE pizza (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(8, 2),
    promocao_id INT,
    FOREIGN KEY (promocao_id) REFERENCES promocao(id)
);

-- Tabela de Ingredientes
CREATE TABLE ingrediente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela de Ingredientes de Pizza (relacionamento muitos para muitos)
CREATE TABLE pizza_ingrediente (
    pizza_id INT,
    ingrediente_id INT,
    FOREIGN KEY (pizza_id) REFERENCES pizza(id),
    FOREIGN KEY (ingrediente_id) REFERENCES ingrediente(id)
);

-- Tabela de Tamanhos de Pizza
CREATE TABLE tamanho (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50),
    diametro_cm INT
);

-- Tabela de Promoções
CREATE TABLE promocao (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(255),
    desconto DECIMAL(5, 2)
);

-- INSERTS

-- Inserções na tabela de Áreas de Trabalho
INSERT INTO area_trabalho (nome) VALUES 
('Cozinha'),
('Atendimento ao Cliente'),
('Entrega'),
('Gestão de Estoque'),
('Manutenção'),
('Marketing'),
('Financeiro'),
('Recursos Humanos'),
('TI'),
('Segurança');

-- Inserções na tabela de Status de Pedidos
INSERT INTO status_pedido (status) VALUES 
('Em preparo'),
('Aguardando pagamento'),
('A caminho'),
('Entregue'),
('Cancelado'),
('Aguardando confirmação'),
('Reembolsado'),
('Aguardando retirada'),
('Em análise'),
('Finalizado');

-- Inserções na tabela de Clientes
INSERT INTO cliente (nome, endereco, telefone) VALUES 
('João Silva', 'Rua das Flores, 123', '123456789'),
('Maria Oliveira', 'Av. Brasil, 456', '987654321'),
('Pedro Santos', 'Rua dos Limoeiros, 789', '456123789'),
('Ana Costa', 'Av. Central, 101', '789123456'),
('Lucas Pereira', 'Rua das Palmeiras, 202', '321654987'),
('Carla Souza', 'Av. Atlântica, 303', '654789123'),
('Fernanda Lima', 'Rua das Mangueiras, 404', '987321654'),
('Ricardo Mendes', 'Av. Paulista, 505', '321987654'),
('Patrícia Carvalho', 'Rua das Américas, 606', '654321987'),
('Gustavo Almeida', 'Av. Independência, 707', '789654321');

-- Inserções na tabela de Funcionários
INSERT INTO funcionario (nome, cargo, area_id, supervisor_id) VALUES 
('Carlos Nunes', 'Cozinheiro', 1, NULL),
('Sofia Fernandes', 'Atendente', 2, NULL),
('Bruno Oliveira', 'Entregador', 3, NULL),
('Juliana Marques', 'Gestora de Estoque', 4, NULL),
('Roberto Lima', 'Técnico de Manutenção', 5, NULL),
('Larissa Ferreira', 'Analista de Marketing', 6, NULL),
('Vinícius Castro', 'Analista Financeiro', 7, NULL),
('Helena Martins', 'Analista de RH', 8, NULL),
('Fábio Santos', 'Técnico de TI', 9, NULL),
('Ricardo Mendonça', 'Segurança', 10, NULL);

-- Inserções na tabela de Tamanhos de Pizza
INSERT INTO tamanho (descricao, diametro_cm) VALUES 
('Pequena', 20),
('Média', 25),
('Grande', 30),
('Família', 35),
('Gigante', 40),
('Individual', 15),
('Super', 50),
('Mega', 55),
('Ultra', 60),
('Extra Grande', 70);

-- Inserções na tabela de Promoções
INSERT INTO promocao (descricao, desconto) VALUES 
('Promoção de Verão', 10.00),
('Semana do Cliente', 15.00),
('Festival da Pizza', 20.00),
('Desconto de Fim de Semana', 5.00),
('Black Friday', 25.00);

-- Inserções na tabela de Pizzas
INSERT INTO pizza (nome, preco, promocao_id) VALUES 
('Margherita', 25.50, NULL),
('Pepperoni', 30.00, 1),
('Quatro Queijos', 28.00, 2),
('Frango com Catupiry', 29.50, NULL),
('Calabresa', 27.00, 3),
('Portuguesa', 26.50, NULL),
('Vegetariana', 24.00, 4),
('Bacon', 31.00, NULL),
('Chocolate', 22.00, 5),
('Banana com Canela', 23.00, NULL);

-- Inserções na tabela de Ingredientes
INSERT INTO ingrediente (nome) VALUES 
('Tomate'),
('Mussarela'),
('Pepperoni'),
('Frango'),
('Catupiry'),
('Calabresa'),
('Cebola'),
('Pimentão'),
('Bacon'),
('Chocolate');

-- Inserções na tabela de Ingredientes de Pizza
INSERT INTO pizza_ingrediente (pizza_id, ingrediente_id) VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 2),
(3, 4),
(4, 4),
(4, 5),
(5, 6),
(6, 2),
(6, 7),
(7, 1),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- Inserções na tabela de Pedidos
INSERT INTO pedido (cliente_id, status_id, funcionario_id) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Inserções na tabela de Detalhes de Entrega
INSERT INTO detalhes_entrega (pedido_id, endereco_entrega, data_entrega) VALUES 
(1, 'Rua das Flores, 123', '2024-06-01'),
(2, 'Av. Brasil, 456', '2024-06-02'),
(3, 'Rua dos Limoeiros, 789', '2024-06-03'),
(4, 'Av. Central, 101', '2024-06-04'),
(5, 'Rua das Palmeiras, 202', '2024-06-05'),
(6, 'Av. Atlântica, 303', '2024-06-06'),
(7, 'Rua das Mangueiras, 404', '2024-06-07'),
(8, 'Av. Paulista, 505', '2024-06-08'),
(9, 'Rua das Américas, 606', '2024-06-09'),
(10, 'Av. Independência, 707', '2024-06-10');
