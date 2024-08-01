--1. **Listar todos os clientes cadastrados:**
SELECT DISTINCT contatos.*
FROM contatos
INNER JOIN pedidos ON contatos.id_contato = pedidos.id_contato;

--2. **Listar todos os pedidos realizados em um determinado período:**
SELECT *
FROM pedidos
WHERE data_pedido BETWEEN '2024-01-01' AND '2024-12-31';

Substitua '2024-01-01' e '2024-12-31' pelas datas inicial e final do período desejado.

--3. **Listar os itens de um pedido específico:**
SELECT *
FROM itens_pedido
WHERE id_pedido = <id_do_pedido>;

Substitua `<id_do_pedido>` pelo ID do pedido específico.

--4. **Calcular o total gasto por um cliente:**
SELECT contatos.nome, SUM(pizzas.preco) AS total_gasto
FROM contatos
INNER JOIN pedidos ON contatos.id_contato = pedidos.id_contato
INNER JOIN itens_pedido ON pedidos.id_pedido = itens_pedido.id_pedido
INNER JOIN pizzas ON itens_pedido.id_pizza = pizzas.id_pizza
GROUP BY contatos.nome;

--5. **Listar os sabores de pizza mais populares:**
SELECT pizzas.nome AS sabor_pizza, COUNT(*) AS total_pedidos
FROM pizzas
INNER JOIN itens_pedido ON pizzas.id_pizza = itens_pedido.id_pizza
GROUP BY pizzas.nome
ORDER BY total_pedidos DESC;

--6. **Verificar a disponibilidade de um determinado sabor de pizza:**
SELECT * FROM pizzas
WHERE nome = 'Nome do sabor da pizza desejado';

Substitua 'Nome do sabor da pizza desejado' pelo sabor de pizza que você quer verificar a disponibilidade.

--7. **Listar todos os funcionários:**
SELECT * FROM funcionarios;

--8. **Verificar o horário de funcionamento da pizzaria:**
SELECT horario_abertura, horario_fechamento FROM horario_funcionamento;

--9. **Listar os pedidos em andamento:**
SELECT * FROM pedidos
WHERE situacao = 'andamento';

--10. **Calcular o tempo médio de espera dos pedidos:**
SELECT AVG(EXTRACT(EPOCH FROM (hora_entrega - hora_pedido))) AS tempo_medio_espera
FROM entregas
WHERE situacao = 'entregue';
