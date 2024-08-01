--1. **Listar todos os pedidos com detalhes do cliente:**
SELECT pedidos.*, contatos.nome AS nome_cliente
FROM pedidos
INNER JOIN contatos ON pedidos.id_contato = contatos.id_contato;

--2. **Listar todos os itens de pedidos com detalhes da pizza:**
SELECT itens_pedido.*, pizzas.nome AS nome_pizza
FROM itens_pedido
INNER JOIN pizzas ON itens_pedido.id_pizza = pizzas.id_pizza;

--3. **Listar todos os funcionários com suas respectivas atribuições:**
SELECT funcionarios.*, areas.nome AS nome_area
FROM funcionarios
INNER JOIN areas ON funcionarios.id_area = areas.id_area;

--4. **Listar todos os pedidos com status e funcionários responsáveis:**
SELECT pedidos.*, status_pedido.nome AS status, funcionarios.nome AS responsavel
FROM pedidos
INNER JOIN status_pedido ON pedidos.id_status = status_pedido.id_status
INNER JOIN funcionarios ON pedidos.id_funcionario = funcionarios.id_funcionario;

--5. **Listar todos os clientes com seus pedidos realizados:**
SELECT contatos.*, COUNT(pedido.id_pedido) AS total_pedidos
FROM contatos
LEFT JOIN pedido ON contatos.id_contato = pedido.id_contato
GROUP BY contatos.id_contato;

--6. **Listar todas as pizzas disponíveis com seus respectivos ingredientes:**
SELECT * FROM pizzas;

--7. **Listar todos os pedidos com detalhes de entrega:**
SELECT pedido.*, entregas.*
FROM pedido
INNER JOIN entregas ON pedido.id_entrega = entregas.id_entrega;

--8. **Listar todos os funcionários com seus respectivos supervisores:**
SELECT funcionarios.nome AS funcionario, supervisores.nome AS supervisor
FROM funcionarios
LEFT JOIN funcionarios AS supervisores ON funcionarios.id_supervisor = supervisores.id_funcionario;

--9. **Listar todos os itens de pedidos com seus respectivos tamanhos:**
SELECT itens_pedido.*, tamanhos_pizza.descricao AS tamanho
FROM itens_pedido
INNER JOIN tamanhos_pizza ON itens_pedido.id_tamanho = tamanhos_pizza.id_tamanho;

--10. **Listar todas as pizzas com suas respectivas promoções:**
SELECT pizzas.*, promocoes.descricao AS promocao
FROM pizzas
LEFT JOIN promocoes ON pizzas.id_promocao = promocoes.id_promocao;
