<?php
include 'functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se os dados POST não estão vazios
if (!empty($_POST)) {
    // Se os dados POST não estiverem vazios, insere um novo registro
    // Configura as variáveis que serão inserid_entregasas. Devemos verificar se as variáveis POST existem e, se não existirem, podemos atribuir um valor padrão a elas.
    $id_entregas = isset($_POST['id_entregas']) && !empty($_POST['id_entregas']) && $_POST['id_entregas'] != 'auto' ? $_POST['id_entregas'] : NULL;
    // Verifica se a variável POST "nome" existe, se não existir, atribui o valor padrão para vazio, basicamente o mesmo para todas as variáveis
    $nome = isset($_POST['nome']) ? $_POST['nome'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $celular = isset($_POST['celular']) ? $_POST['celular'] : '';
    $pizza = isset($_POST['pizza']) ? $_POST['pizza'] : '';
    $status = isset($_POST['status']) ? $_POST['status'] : '';
    // Insere um novo registro na tabela contacts
    $stmt = $pdo->prepare('INSERT INTO entregas (id_entregas, nome, email, celular, pizza, status) VALUES (?, ?, ?, ?, ?, ?)');
    $stmt->execute([$id_entregas, $nome, $email, $celular, $pizza, $status]);
    // Mensagem de saída
    $msg = 'Pedido Realizado com Sucesso!';
}
?>


<?= template_header('Cadastro de Pedidos') ?>

<div class="content update">
    <h2>Registrar Pedido</h2>
    <form action="create.php" method="post">
        <label for="id_entregas">ID</label>
        <label for="nome">Nome</label>
        <input type="text" name="id_entregas" placeholder="" value="" id="id_entregas">
        <input type="text" name="nome" placeholder="Seu Nome" id="nome">
        <label for="email">Email</label>
        <label for="celular">Celular</label>
        <input type="text" name="email" placeholder="seuemail@seuprovedor.com.br" id="email">
        <input type="text" name="celular" placeholder="(XX) X.XXXX-XXXX" id="celular">
        <label for="pizza">Sabor Pizza</label>
        <label for="pizza">Status da Entrega</label>
        <input type="text" name="pizza" placeholder="Seu Sabor" id="pizza">
        <select name="status" id="status">
            <option value="A Caminho">A Caminho</option>
            <option value="Entregue">Entregue</option>
        </select>
        <input type="submit" value="Cadastrar Entrega">
    </form>
    <?php if ($msg) : ?>
        <p><?= $msg ?></p>
    <?php endif; ?>
</div>

<?= template_footer() ?>