DROP DATABASE pizzaria;

CREATE DATABASE pizzaria;

-- Criação das tabelas

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE pizzas (
    id_pizza SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    tamanho VARCHAR(20)
);

CREATE TABLE ingredientes (
    id_ingrediente SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE pizzas_ingredientes (
    id_pizza INTEGER REFERENCES pizzas(id_pizza),
    id_ingrediente INTEGER REFERENCES ingredientes(id_ingrediente),
    PRIMARY KEY (id_pizza, id_ingrediente)
);

CREATE TABLE funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    supervisor_id INTEGER REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE atributos_funcionarios (
    id_atributo SERIAL PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE funcionarios_atributos (
    id_funcionario INTEGER REFERENCES funcionarios(id_funcionario),
    id_atributo INTEGER REFERENCES atributos_funcionarios(id_atributo),
    PRIMARY KEY (id_funcionario, id_atributo)
);

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES clientes(id_cliente),
    id_funcionario INTEGER REFERENCES funcionarios(id_funcionario),
    status VARCHAR(50),
    data_pedido TIMESTAMP
);

CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INTEGER REFERENCES pedidos(id_pedido),
    id_pizza INTEGER REFERENCES pizzas(id_pizza),
    quantidade INTEGER
);

CREATE TABLE entregas (
    id_entrega SERIAL PRIMARY KEY,
    id_pedido INTEGER REFERENCES pedidos(id_pedido),
    endereco_entrega VARCHAR(255),
    data_entrega TIMESTAMP
);

CREATE TABLE promocoes (
    id_promocao SERIAL PRIMARY KEY,
    descricao VARCHAR(100),
    desconto DECIMAL(5, 2)
);

CREATE TABLE pizzas_promocoes (
    id_pizza INTEGER REFERENCES pizzas(id_pizza),
    id_promocao INTEGER REFERENCES promocoes(id_promocao),
    PRIMARY KEY (id_pizza, id_promocao)
);


-- INSERT

INSERT INTO clientes (nome, telefone) VALUES 
('João Silva', '9999-1111'), 
('Maria Oliveira', '9999-2222'), 
('Carlos Pereira', '9999-3333');

INSERT INTO pizzas (nome, preco, tamanho) VALUES 
('Margherita', 20.00, 'Grande'), 
('Pepperoni', 25.00, 'Média'), 
('Quatro Queijos', 30.00, 'Grande');

INSERT INTO ingredientes (nome) VALUES 
('Mussarela'), 
('Tomate'), 
('Pepperoni'), 
('Gorgonzola'), 
('Parmesão'), 
('Provolone');

INSERT INTO pizzas_ingredientes (id_pizza, id_ingrediente) VALUES 
(1, 1), (1, 2), 
(2, 1), (2, 3), 
(3, 1), (3, 4), (3, 5), (3, 6);

INSERT INTO funcionarios (nome, supervisor_id) VALUES 
('Ana Souza', NULL), 
('Paulo Mendes', 1), 
('Renata Lima', 1);

INSERT INTO atributos_funcionarios (descricao) VALUES 
('Atendimento'), 
('Cozinha'), 
('Entrega');

INSERT INTO funcionarios_atributos (id_funcionario, id_atributo) VALUES 
(1, 1), 
(2, 2), 
(3, 3);

INSERT INTO pedidos (id_cliente, id_funcionario, status, data_pedido) VALUES 
(1, 1, 'Entregue', '2024-05-26 19:30:00'), 
(2, 2, 'Preparando', '2024-05-27 20:00:00'), 
(3, 3, 'Entregue', '2024-05-27 20:30:00');

INSERT INTO itens_pedido (id_pedido, id_pizza, quantidade) VALUES 
(1, 1, 2), 
(1, 2, 1), 
(2, 3, 1), 
(3, 1, 1), 
(3, 3, 2);

INSERT INTO entregas (id_pedido, endereco_entrega, data_entrega) VALUES 
(1, 'Rua A, 123', '2024-05-26 20:00:00'), 
(3, 'Rua B, 456', '2024-05-27 21:00:00');

INSERT INTO promocoes (descricao, desconto) VALUES 
('Desconto de 10%', 10.00), 
('Desconto de 15%', 15.00);

INSERT INTO pizzas_promocoes (id_pizza, id_promocao) VALUES 
(1, 1), 
(3, 2);

-- ATIVIDADES

-- 1. Listar todos os pedidos com detalhes do cliente
SELECT p.id_pedido, c.nome, c.telefone, p.status, p.data_pedido
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente;

-- 2. Listar todos os itens de pedidos com detalhes da pizza
SELECT i.id_item, p.id_pedido, pizza.nome, pizza.preco, i.quantidade
FROM itens_pedido i
INNER JOIN pizzas pizza ON i.id_pizza = pizza.id_pizza
INNER JOIN pedidos p ON i.id_pedido = p.id_pedido;

-- 3. Listar todos os funcionários com suas respectivas atribuições
SELECT f.nome, a.descricao
FROM funcionarios f
INNER JOIN funcionarios_atributos fa ON f.id_funcionario = fa.id_funcionario
INNER JOIN atributos_funcionarios a ON fa.id_atributo = a.id_atributo;

-- 4. Listar todos os pedidos com status e funcionários responsáveis
SELECT p.id_pedido, p.status, f.nome AS funcionario_responsavel
FROM pedidos p
INNER JOIN funcionarios f ON p.id_funcionario = f.id_funcionario;

-- 5. Listar todos os clientes com seus pedidos realizados
SELECT c.nome, p.id_pedido, p.status, p.data_pedido
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- 6. Listar todas as pizzas disponíveis com seus respectivos ingredientes
SELECT pizza.nome AS pizza, ing.nome AS ingrediente
FROM pizzas pizza
INNER JOIN pizzas_ingredientes pi ON pizza.id_pizza = pi.id_pizza
INNER JOIN ingredientes ing ON pi.id_ingrediente = ing.id_ingrediente;

-- 7. Listar todos os pedidos com detalhes de entrega
SELECT p.id_pedido, e.endereco_entrega, e.data_entrega
FROM pedidos p
INNER JOIN entregas e ON p.id_pedido = e.id_pedido;

-- 8. Listar todos os funcionários com seus respectivos supervisores
SELECT f.nome AS funcionario, s.nome AS supervisor
FROM funcionarios f
LEFT JOIN funcionarios s ON f.supervisor_id = s.id_funcionario;

-- 9. Listar todos os itens de pedidos com seus respectivos tamanhos
SELECT i.id_item, pizza.nome AS pizza, pizza.tamanho
FROM itens_pedido i
INNER JOIN pizzas pizza ON i.id_pizza = pizza.id_pizza;

-- 10. Listar todas as pizzas com suas respectivas promoções
SELECT pizza.nome AS pizza, promo.descricao AS promocao, promo.desconto
FROM pizzas pizza
INNER JOIN pizzas_promocoes pp ON pizza.id_pizza = pp.id_pizza
INNER JOIN promocoes promo ON pp.id_promocao = promo.id_promocao;

-- Segunda Parte (Consultas com comandos SQL básicos)

-- 1. Listar todos os clientes cadastrados
SELECT * FROM clientes;

-- 2. Listar todos os pedidos realizados em um determinado período
-- Substitua '2024-05-01' e '2024-05-31' pelas datas desejadas
SELECT * FROM pedidos
WHERE data_pedido BETWEEN '2024-05-01' AND '2024-05-31';

-- 3. Listar os itens de um pedido específico
-- Substitua '1' pelo ID do pedido desejado
SELECT i.id_item, i.id_pedido, p.nome AS pizza, i.quantidade
FROM itens_pedido i
INNER JOIN pizzas p ON i.id_pizza = p.id_pizza
WHERE i.id_pedido = 1;

-- 4. Calcular o total gasto por um cliente
-- Substitua '1' pelo ID do cliente desejado
SELECT c.nome, SUM(p.preco * i.quantidade) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
INNER JOIN itens_pedido i ON p.id_pedido = i.id_pedido
INNER JOIN pizzas pi ON i.id_pizza = pi.id_pizza
WHERE c.id_cliente = 1
GROUP BY c.nome;

-- 5. Listar os sabores de pizza mais populares
SELECT pi.nome, COUNT(i.id_item) AS quantidade_pedida
FROM itens_pedido i
INNER JOIN pizzas pi ON i.id_pizza = pi.id_pizza
GROUP BY pi.nome
ORDER BY quantidade_pedida DESC;

-- 6. Verificar a disponibilidade de um determinado sabor de pizza
-- Substitua 'Margherita' pelo nome do sabor desejado
SELECT * FROM pizzas
WHERE nome = 'Margherita';

-- 7. Listar todos os funcionários
SELECT * FROM funcionarios;

-- 8. Verificar o horário de funcionamento da pizzaria
-- Esta consulta assume que há uma tabela 'horarios_funcionamento'
-- Crie a tabela com os horários de funcionamento, se necessário
-- Substitua o SQL abaixo pela estrutura de sua tabela específica
SELECT * FROM horarios_funcionamento;

-- 9. Listar os pedidos em andamento
SELECT * FROM pedidos
WHERE status NOT IN ('Entregue', 'Cancelado');

-- 10. Calcular o tempo médio de espera dos pedidos
-- Esta consulta assume que os tempos de entrega estão registrados na tabela 'entregas'
SELECT AVG(EXTRACT(EPOCH FROM (e.data_entrega - p.data_pedido))/60) AS tempo_medio_espera_minutos
FROM pedidos p
INNER JOIN entregas e ON p.id_pedido = e.id_pedido;
