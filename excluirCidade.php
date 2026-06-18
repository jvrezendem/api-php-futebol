<?php
include("config.php");

// Estabelece a conexão com o banco de dados
$con = mysqli_connect($host, $login, $senha, $bd);

if(!$con){
    die("Conexão falhou!" . mysqli_connect_error());
}

// Recupera o ID da cidade passado via URL
$codigo = $_GET['codigo'];

// Executa a exclusão
$sql = "DELETE FROM cidade WHERE idCidade = $codigo";
$resultado = mysqli_query($con, $sql);

if($resultado){
    mysqli_close($con);
    header("Location: index.php");
    exit();
} else {
    // Se a cidade estiver vinculada a algum clube existente, o banco não deixará apagar e avisará aqui
    echo "Erro ao excluir a cidade: " . mysqli_error($con);
    mysqli_close($con);
}
?>