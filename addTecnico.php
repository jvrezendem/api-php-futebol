<?php
  include("./config.php");
  $con = mysqli_connect($host, $login, $senha, $bd);
  if(isset($_POST["codigo"])){
    $sql = "SELECT idTecnico FROM tecnico WHERE idTecnico=".$_POST["codigo"];
    $result = mysqli_query($con, $sql);
    if(mysqli_num_rows($result)!=0){
      $sql = "UPDATE tecnico SET nome='".$_POST["nome"]."',estiloJogo='".$_POST["estiloJogo"]."',nacionalidade='".$_POST["nacionalidade"]."',dataNascimento='".$_POST["dataNascimento"]."' WHERE idTecnico=".$_POST["codigo"];
    }
  }else{
    $sql = "INSERT INTO tecnico VALUES (".$_POST["idTecnico"].",'".$_POST["nome"]."','".$_POST["estiloJogo"]."','".$_POST["nacionalidade"]."',".$_POST["dataNascimento"].")";
  }
  mysqli_query($con, $sql);
  mysqli_close($con);
  header("location: ./index.php");
?>
