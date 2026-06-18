<?php
include("config.php");

$con = mysqli_connect($host, $login, $senha, $bd);

if(!$con){
    die("Conexão falhou!" . mysqli_connect_error());
}

$idCidade = $_POST['idCidade'];
$nome     = $_POST['nome'];
$estado   = $_POST['estado'];

if(isset($_POST['codigo']) && !empty($_POST['codigo'])) {
    $codigo = $_POST['codigo'];
    $sql = "UPDATE cidade SET idCidade = '$idCidade', nome = '$nome', estado = '$estado' WHERE idCidade = $codigo";
} else {
    $sql = "INSERT INTO cidade (idCidade, nome, estado) VALUES ('$idCidade', '$nome', '$estado')";
}

$resultado = mysqli_query($con, $sql);

if($resultado){
    mysqli_close($con);
    header("Location: index.php");
    exit();
} else {
    echo "Erro ao salvar a cidade: " . mysqli_error($con);
    mysqli_close($con);
}
?>