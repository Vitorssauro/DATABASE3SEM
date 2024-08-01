<?php
include 'functions.php'; // Inclua seu arquivo de funções aqui

// Conectar ao banco de dados
$pdo = pdo_connect_pgsql();

// Consulta SQL para obter os sabores de pizza
$sql = "SELECT DISTINCT sabor FROM pizzas ORDER BY sabor";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$pizza_flavors = $stmt->fetchAll(PDO::FETCH_COLUMN);

// Retornar os sabores de pizza como um JSON
header('Content-Type: application/json');
echo json_encode($pizza_flavors);
?>
