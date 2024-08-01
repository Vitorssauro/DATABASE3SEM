-- Correção exercícios Pizzaria - Parte I

SELECT * FROM pedido
SELECT * FROM entregas
SELECT * FROM pizzas
SELECT * FROM contatos


--1 
SELECT pedido.*, contatos.nome AS nome_cliente
FROM pedido
INNER JOIN contatos ON pedido.id_contato = contatos.id_contato;


--2
SELECT pedido.*, pizzas.nome AS nome_pizza
FROM pedido
INNER JOIN pizzas ON pedido.id_pizza = pizzas.id_pizza;


--3
SELECT funcionarios.*, areas.nome AS nome_area
FROM funcionarios
INNER JOIN areas ON funcionarios.id_area = areas.id_area;


--4
SELECT pedidos.*, status_pedido.nome AS status, funcionarios.nome AS responsavel
FROM pedidos
INNER JOIN status_pedido ON pedidos.id_status = status_pedido.id_status
INNER JOIN funcionarios ON pedidos.id_funcionario = funcionarios.id_funcionario;

--5
SELECT contatos.*, COUNT(pedidos.id_pedido) AS total_pedidos
FROM contatos
LEFT JOIN pedidos ON contatos.id_contato = pedidos.id_contato
GROUP BY contatos.id_contato;

--6
SELECT * FROM pizzas;

--7
SELECT pedidos.*, entregas.*
FROM pedidos
INNER JOIN entregas ON pedidos.id_entrega = entregas.id_entrega;

--8
SELECT funcionarios.nome AS funcionario, supervisores.nome AS supervisor
FROM funcionarios
LEFT JOIN funcionarios AS supervisores ON funcionarios.id_supervisor = supervisores.id_funcionario;

--9
SELECT itens_pedido.*, tamanhos_pizza.descricao AS tamanho
FROM itens_pedido
INNER JOIN tamanhos_pizza ON itens_pedido.id_tamanho = tamanhos_pizza.id_tamanho;

--10
SELECT pizzas.*, promocoes.descricao AS promocao
FROM pizzas
LEFT JOIN promocoes ON pizzas.id_promocao = promocoes.id_promocao;

-- Correção exercícios Pizzaria - Parte II

--1
SELECT DISTINCT contatos.*
FROM contatos
INNER JOIN pedidos ON contatos.id_contato = pedidos.id_contato;

--2
SELECT * FROM pedido
WHERE data_pedido BETWEEN '2024-01-01' AND '2024-12-31';

--3
SELECT *
FROM itens_pedido
WHERE id_pedido = <id_do_pedido>;


--4
SELECT contatos.nome, SUM(pizzas.preco) AS total_gasto
FROM contatos
INNER JOIN pedidos ON contatos.id_contato = pedidos.id_contato
INNER JOIN itens_pedido ON pedidos.id_pedido = itens_pedido.id_pedido
INNER JOIN pizzas ON itens_pedido.id_pizza = pizzas.id_pizza
GROUP BY contatos.nome;

--5
SELECT pizzas.nome AS sabor_pizza, COUNT(*) AS total_pedidos
FROM pizzas
INNER JOIN itens_pedido ON pizzas.id_pizza = itens_pedido.id_pizza
GROUP BY pizzas.nome
ORDER BY total_pedidos DESC;

--6
SELECT * FROM pizzas
WHERE nome = 'Nome do sabor da pizza desejado';

--7
SELECT * FROM funcionarios;

--8
SELECT horario_abertura, horario_fechamento
FROM horario_funcionamento;

SELECT * FROM pedidos
WHERE situacao = 'andamento';

SELECT AVG(EXTRACT(EPOCH FROM (hora_entrega - hora_pedido))) AS tempo_medio_espera
FROM entregas
WHERE situacao = 'entregue';
