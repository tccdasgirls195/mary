<?php

$host = "localhost";
$usuario = "root";
$senha = "";
$banco = "etec3";

$conn = new mysqli($host, $usuario, $senha, $banco);

// serve para mostrar mensagem de erro caso a conexão não de certo

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");

echo "Conexão feita com sucesso!!";

?>