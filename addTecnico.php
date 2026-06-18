<?php
include("config.php");

$con = mysqli_connect($host, $login, $senha, $bd);

if(!$con){
    die("Conexão falhou!" . mysqli_connect_error());
}

$idTecnico      = $_POST['idTecnico'];
$nome           = $_POST['nome'];
$estiloJogo     = $_POST['estiloJogo'];
$dataNascimento = $_POST['dataNascimento'];
$nacionalidade  = $_POST['nacionalidade'];

if(isset($_POST['codigo']) && !empty($_POST['codigo'])) {
    $codigo = $_POST['codigo'];
    $sql = "UPDATE tecnico 
            SET idTecnico = '$idTecnico', nome = '$nome', estiloJogo = '$estiloJogo', dataNascimento = '$dataNascimento', nacionalidade = '$nacionalidade' 
            WHERE idTecnico = $codigo";
} else {
    $sql = "INSERT INTO tecnico (idTecnico, nome, estiloJogo, dataNascimento, nacionalidade) 
            VALUES ('$idTecnico', '$nome', '$estiloJogo', '$dataNascimento', '$nacionalidade')";
}

$resultado = mysqli_query($con, $sql);

if($resultado){
    mysqli_close($con);
    header("Location: index.php");
    exit();
} else {
    echo "Erro ao salvar o técnico: " . mysqli_error($con);
    mysqli_close($con);
}
?>