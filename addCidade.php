<?php
  include("./config.php");
  $con = mysqli_connect($host, $login, $senha, $bd);
  if(isset($_POST["codigo"])){
    $sql = "SELECT idCidade FROM cidade WHERE idCidade=".$_POST["codigo"];
    $result = mysqli_query($con, $sql);
    if(mysqli_num_rows($result)!=0){
      $sql = "UPDATE cidade SET nome='".$_POST["nome"]."',posicaoPrincipal='".$_POST["posicaoPrincipal"]."',nacionalidadeEsportiva='".$_POST["nacionalidadeEsportiva"]."',numeroCamisa=".$_POST["numeroCamisa"].",dataNascimento='".$_POST["dataNascimento"]."',idClube=".$_POST["idClube"]." WHERE idJogador=".$_POST["codigo"];
    }
  }else{
    $sql = "INSERT INTO cidade VALUES (".$_POST["idCidade"].",'".$_POST["nome"]."','".$_POST["uf"]."')";
  }
  mysqli_query($con, $sql);
  mysqli_close($con);
  header("location: ./index.php");
?>
