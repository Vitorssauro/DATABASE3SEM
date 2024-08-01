<?php
function pdo_connect_pgsql() {
    $DATABASE_HOST = 'localhost';
    $DATABASE_PORT = '5432';
    $DATABASE_USER = 'postgres';
    $DATABASE_PASS = 'postgres';
    $DATABASE_NAME = 'pizzaria';
    try {
        $pdo = new PDO('pgsql:host=' . $DATABASE_HOST . ';port=' . $DATABASE_PORT . ';dbname=' . $DATABASE_NAME . ';user=' . $DATABASE_USER . ';password=' . $DATABASE_PASS);
        // Define o modo de erro para Exception para que os erros sejam lançados e possam ser capturados.
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $exception) {
        // Log do erro ou exibição de mensagem mais detalhada.
        $errorDetails = 'Error details: ' . $exception->getMessage() . ' Code: ' . $exception->getCode();
        error_log('Failed to connect to database: ' . $errorDetails);
        exit('Failed to connect to database. Check error log for details. Debug: ' . $errorDetails);
    }
    function perform_search($query, $pizza = '') {
        // Conexão com o banco de dados
        $pdo = pdo_connect_pgsql();
        
        // Consulta SQL base
        $sql = "SELECT * FROM entregas WHERE pizza LIKE :query";
    
        // Se um sabor de pizza foi selecionado, adicione uma cláusula WHERE para filtrar por sabor
        if (!empty($pizza)) {
            $sql .= " AND sabor = :pizza";
        }
    
        // Preparar a consulta
        $stmt = $pdo->prepare($sql);
    
        // Substituir parâmetros na consulta
        $stmt->bindValue(':query', '%' . $query . '%', PDO::PARAM_STR);
        if (!empty($pizza)) {
            $stmt->bindValue(':pizza', $pizza, PDO::PARAM_STR);
        }
    
        // Executar a consulta
        $stmt->execute();
    
        // Obter os resultados da consulta
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
        return $results;
    }
    
}

function template_header($title) {
echo <<<EOT
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>$title</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
	</head>
	<body>
    <nav class="navtop">
    	<div>
    		<h1> Pizzaria Dom Uburu </h1>
            <a href="index.php"><i class="fas fa-home"></i>Inicio</a>
    		<a href="read.php"><i class="fas fa-shopping-basket"></i>Pedidos</a>
    		<a href="acomp.php"><i class="fas fa-cart-shopping"></i>Acompanhamento</a>
            <a href="ler_entregas.php"><i class="fa-solid fa-motorcycle"></i>Entregas</a>
            <a href="pesquisar.php"><i class="fa-solid fa-magnifying-glass"></i>Pesquisar</a>
            <a href="processar_pedido.php"><i class="fa-solid fa-cart-shopping"></i>Comprar</a>
    	</div>
    </nav>
EOT;
}
function template_footer() {
echo <<<EOT
    </body>
</html>
EOT;
}
?>