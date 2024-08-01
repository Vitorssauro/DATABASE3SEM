<?php
include 'functions.php';
?>

<?=template_header('Administrador')?>

<div class="content">
    <h2>Administrador</h2>
    <p>Bem-vindo à área administrativa.</p>
    <form action="cliente.php" method="get">
        <button type="submit"><i class="fas fa-users"></i> Consultar Clientes</button>
</form>
</div>

<?=template_footer()?>