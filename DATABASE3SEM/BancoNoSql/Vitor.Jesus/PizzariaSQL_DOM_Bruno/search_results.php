<?php
include 'functions.php';
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados da Pesquisa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        h2 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background-color: #fff;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<?=template_header('Cadastro de Pedidos')?>

<div class="content update">
	<h2>Realizar Pesquisas</h2>
    <?php
    // Verificar se o sabor da pizza foi enviado
    if (isset($_GET['pizza_flavor'])) {
        $pizza_flavor = $_GET['pizza_flavor'];

        // Conectar ao banco de dados
        include 'functions.php'; // Inclua seu arquivo de funções aqui
        $pdo = pdo_connect_pgsql();

        // Consulta SQL para buscar as pizzas com o sabor selecionado
        $sql = "SELECT * FROM entregas WHERE pizza = :pizza_flavor";

        // Preparar e executar a consulta SQL
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(':pizza_flavor' => $pizza_flavor));

        // Exibir os resultados da pesquisa
        echo "<ul>";
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<li>{$row['nome']}</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>Por favor, selecione um sabor de pizza para pesquisar.</p>";
    }
    ?>



<?=template_footer()?>
</body>
</html>
