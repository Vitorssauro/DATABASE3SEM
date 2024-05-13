<?php
include 'functions.php';
// Conectar ao banco de dados PostgreSQL
$pdo = pdo_connect_pgsql();
// Obter a página via solicitação GET (parâmetro URL: page), se não existir, defina a página como 1 por padrão
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
// Número de registros para mostrar em cada página
$records_per_page = 5;

// Preparar a instrução SQL e obter registros da tabela contacts, LIMIT irá determinar a página
$stmt = $pdo->prepare('SELECT * FROM entregas ORDER BY id_entregas OFFSET :offset LIMIT :limit');
$stmt->bindValue(':offset', ($page - 1) * $records_per_page, PDO::PARAM_INT);
$stmt->bindValue(':limit', $records_per_page, PDO::PARAM_INT);
$stmt->execute();
// Buscar os registros para exibi-los em nosso modelo.
$contacts = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Obter o número total de contatos, isso é para determinar se deve haver um botão de próxima e anterior
$num_contacts = $pdo->query('SELECT COUNT(*) FROM entregas')->fetchColumn();
?>


<?=template_header('Visualizar Entrgas')?>

<div class="content read">
	<h2>Visualizar Entrags</h2>
	<a href="send_create.php" class="create-contact">Cadastrar Entrega</a>
	<table>
        <thead>
            <tr>
                <td>#</td>
                <td>Nome</td>
                <td>Email</td>
                <td>Celular</td>
                <td>Pizza</td>
                <td>Status</td>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($contacts as $contact): ?>
            <tr>
                <td><?=$contact['id_entregas']?></td>
                <td><?=$contact['nome']?></td>
                <td><?=$contact['email']?></td>
                <td><?=$contact['celular']?></td>
                <td><?=$contact['pizza']?></td>
                <td><?=$contact['status']?></td>
                <td class="actions">
                    <a href="update.php?id=<?=$contact['id_entregas']?>" class="edit"><i class="fas fa-pen fa-xs"></i></a>
                    <a href="delete.php?id=<?=$contact['id_entregas']?>" class="trash"><i class="fas fa-trash fa-xs"></i></a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
	<div class="pagination">
		<?php if ($page > 1): ?>
		<a href="send.php?page=<?=$page-1?>"><i class="fas fa-angle-double-left fa-sm"></i></a>
		<?php endif; ?>
		<?php if ($page*$records_per_page < $num_contacts): ?>
		<a href="send.php?page=<?=$page+1?>"><i class="fas fa-angle-double-right fa-sm"></i></a>
		<?php endif; ?>
	</div>
</div>

<?=template_footer()?>