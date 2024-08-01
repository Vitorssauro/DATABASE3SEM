<?php
include 'functions.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="/icones/icone1.svg" type="image/x-icon">
	<?= template_header('Pizzaria Dom Bruno') ?>

	<div class="content">
		<h2>Inicio</h2>
		<p>Seja Bem-Vindo!</p>
		<br>
		<form action="admin.php" method="get">
			<button type="submit"><i class="fas fa-user-cog"></i> Admin</button>
		</form>
	</div>

	<?= template_footer() ?>

</head>

</html>