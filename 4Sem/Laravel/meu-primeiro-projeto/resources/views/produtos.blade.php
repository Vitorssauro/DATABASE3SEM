<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="..assets\css\style.css">
    <title>Produtos</title>
</head>
<body>
    @include('components.header')
    <h1>Produtos</h1>

    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Preço</th>
                <th>Descrição</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Produto 1</td>
                <td>R$ 100,00</td>
                <td>Descrição do produto 1</td>
            </tr>
            <tr>
                <td>Produto 2</td>
                <td>R$ 200,00</td>
                <td>Descrição do produto 2</td>
            </tr>
            <tr>
                <td>Produto 3</td>
                <td>R$ 300,00</td>
                <td>Descrição do produto 3</td>
            </tr>
            <!-- Adicione mais produtos conforme necessário -->
        </tbody>
    </table>

    @include('components.footer')
</body>
</html>