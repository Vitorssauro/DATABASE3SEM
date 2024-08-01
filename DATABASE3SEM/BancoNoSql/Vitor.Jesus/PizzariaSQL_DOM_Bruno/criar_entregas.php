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
    $cel = isset($_POST['cel']) ? $_POST['cel'] : '';
    $pizza = isset($_POST['pizza']) ? $_POST['pizza'] : '';
    $cadastro = isset($_POST['cadastro']) ? $_POST['cadastro'] : date('Y-m-d H:i:s');
    $situacao = isset($_POST['situacao']) ? $_POST['situacao'] : '';
    // Insere um novo registro na tabela contacts
    $stmt = $pdo->prepare('INSERT INTO entregas (id_entregas, nome, email, cel, pizza, cadastro,situacao) VALUES (?, ?, ?, ?, ?, ?,?)');
    $stmt->execute([$id_entregas, $nome, $email, $cel, $pizza, $cadastro, $situacao]);
    // Mensagem de saída
    $msg = 'Entrega Realizada com Sucesso!';
}
?>


<?=template_header('Cadastro Entregas')?>

<div class="content update">
	<h2>Registrar Pedido</h2>
    <form action="criar_entregas.php" method="post">
        <label for="id_entregas">ID</label>
        <label for="nome">Nome</label>
        <input type="text" name="id_entregas" placeholder="" value="" id_entregas="id_entregas" >
        <input type="text" name="nome" placeholder="Seu Nome" id_entregas="nome">
        <label for="email">Email</label>
        <label for="cel">Celular</label>
        <input type="text" name="email" placeholder="seuemail@seuprovedor.com.br" id_entregas="email">
        <input type="text" name="cel" placeholder="(XX) X.XXXX-XXXX" id_entregas="cel">
        <label for="pizza">Sabor Pizza</label>
        <label for="cadastro">Data do Pedido</label>
        <input type="text" name="pizza" placeholder="Pizza" id_entregas="pizza">
        <input type="datetime-local" name="Criar" value="<?=date('Y-m-d\TH:i')?>" id_entregas="cadastro">
        
        <label for="situacao">Situação</label>
<select name="situacao" id="situacao" class="custom-select">
    <option value="andamento">Em andamento</option>
    <option value="entregue">Entregue</option>
    <option value="cancelado">Cancelado</option>
</select>


        <input type="submit" value="Cadastrar Entrega">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>