<?php

header("Content-Type: application/json; charset=UTF-8");

require_once "conexao.php";

if (!isset($_GET['email']) || empty($_GET['email'])) {
    http_response_code(400);

    echo json_encode([
        "erro" => "Email não infomado!"
    ]);

    exit;
};

$email = $_GET['email'];

$sql = "SELECT
            u.cd_usuario,
            u.id_tipo_usuario,
            u.nm_usuario,
            u.st_usuario
            t.cd_tipo_usuario,
            t.nm_tipo_usuario
        FROM tb_usuario u
        inner join tb_tipo_usuario t
        on u.id_tipo_usuario = t.cd_tipo_usuario
        where u.nm_email = ?
";



?>