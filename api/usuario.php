<?php

header("Content-Type: application/json; charset=UTF-8");

require_once "conexao.php";

$sql = "SELECT
            u.cd_usuario,
            u.id_tipo_usuario,
            u.nm_usuario,
            u.nm_email,
            u.st_usuario
        FROM tb_usuario u
        inner join tb_tipo_usuario t
        on u.id_tipo_usuario = t.cd_tipo_usuario
";

$resultado = $conn->query($sql);

if (!$resultado) {
    http_response_code(500);

    echo json_encode([
        "erro" => "Erro ao consultar usuários"
    ]);

    exit;
}

$usuarios = [];

while ($usuario = $resultado->fetch_assoc()) {
    $usuarios[] = $usuario;
}

echo json_encode(
    $usuarios,
    JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT
);

$conn->close();
?>