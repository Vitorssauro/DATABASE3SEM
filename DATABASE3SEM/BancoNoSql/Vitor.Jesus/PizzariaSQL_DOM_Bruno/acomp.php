<?php
include 'functions.php';

// Variável para armazenar os resultados da pesquisa e a situação selecionada
$contacts = [];
$situacaoSelecionada = $_GET['search'] ?? '';

if (isset($_GET['search'])) {
    // Conectar ao banco de dados PostgreSQL
    $pdo = pdo_connect_pgsql();

    // Preparar a consulta SQL para buscar as entregas com a situação selecionada
    $stmt = $pdo->prepare('SELECT * FROM entregas WHERE situacao LIKE :search');
    $stmt->bindValue(':search', $situacaoSelecionada, PDO::PARAM_STR);
    $stmt->execute();

    // Obter os resultados da consulta
    $contacts = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Verificar se foram encontrados resultados
    if (empty($contacts)) {
        $error = 'Nenhuma entrega encontrada para a situação especificada.';
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados da Pesquisa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 300px;
            margin-bottom: 10px;
        }
        button[type="submit"], button[type="button"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button[type="submit"]:hover, button[type="button"]:hover {
            background-color: #45a049;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .error {
            color: red;
        }
    </style>
</head>

<body>
    <?=template_header('Pizzaria Dom Bruno')?><br><br>
    <div class="content read">
        <form id="searchForm" action="" method="get">
            <label for="search">Pesquisar por situação do pedido:</label>
            <select id="search" name="search">
                <option value="">Selecione a situação do pedido...</option>
                <option value="cancelada" <?= $situacaoSelecionada === 'cancelada' ? 'selected' : '' ?>>Cancelada</option>
                <option value="entregue" <?= $situacaoSelecionada === 'entregue' ? 'selected' : '' ?>>Entregue</option>
                <option value="andamento" <?= $situacaoSelecionada === 'andamento' ? 'selected' : '' ?>>Andamento</option>
            </select>
            <button class="create-contact" type="submit" id="searchButton">Pesquisar</button>
            <button type="button" id="clearButton" onclick="window.location.href='';">Limpar</button>
        </form>
    </div>

    <div class="content read">
        <?php if (isset($error)): ?>
            <p class="error"><?=htmlspecialchars($error, ENT_QUOTES)?></p>
        <?php elseif ($contacts): ?>
            <h3>Resultados da Pesquisa</h3>
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Celular</th>
                        <th>Pizza</th>
                        <th>Situação</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($contacts as $contact): ?>
                        <tr>
                            <td><?=htmlspecialchars($contact['id_entregas'], ENT_QUOTES)?></td>
                            <td><?=htmlspecialchars($contact['nome'], ENT_QUOTES)?></td>
                            <td><?=htmlspecialchars($contact['email'], ENT_QUOTES)?></td>
                            <td><?=htmlspecialchars($contact['cel'], ENT_QUOTES)?></td>
                            <td><?=htmlspecialchars($contact['pizza'], ENT_QUOTES)?></td>
                            <td><?=htmlspecialchars($contact['situacao'], ENT_QUOTES)?></td>
                            <td class="actions">
                                <a href="alterar_entrega.php?id=<?=htmlspecialchars($contact['id_entregas'], ENT_QUOTES)?>" class="edit"><i class="fas fa-pen fa-xs"></i></a>
                                <a href="apagar_entrega.php?id=<?=htmlspecialchars($contact['id_entregas'], ENT_QUOTES)?>" class="trash"><i class="fas fa-trash fa-xs"></i></a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </div>

    <script>
        document.getElementById('clearButton').addEventListener('click', function() {
            document.getElementById('search').selectedIndex = 0;
        });
    </script>
</body>
</html>
