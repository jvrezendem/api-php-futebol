<?php
include("config.php");

// Estabelece a conexão com o banco de dados
$con = mysqli_connect($host, $login, $senha, $bd);

if(!$con){
    die("Conexão falhou!" . mysqli_connect_error());
}

// Recupera o ID do técnico passado via URL
$codigo = $_GET['codigo'];

// Executa a exclusão
$sql = "DELETE FROM tecnico WHERE idTecnico = $codigo";
$resultado = mysqli_query($con, $sql);

if($resultado){
    mysqli_close($con);
    header("Location: index.php");
    exit();
} else {
    // Se o técnico estiver vinculado a algum clube, o banco vai barrar e mostrar o erro aqui
    echo "Erro ao excluir o técnico: " . mysqli_error($con);
    mysqli_close($con);
}
?>