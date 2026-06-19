<?php
  include("./config.php");
  $con = mysqli_connect($host, $login, $senha, $bd);
  if(isset($_POST["codigo"])){
    $sql = "SELECT idClube FROM clube WHERE idClube=".$_POST["codigo"];
    $result = mysqli_query($con, $sql);
    if(mysqli_num_rows($result)!=0){
      $sql = "UPDATE clube SET nome='".$_POST["nome"]."',anoFundacao='".$_POST["anoFundacao"]."',idCidade='".$_POST["idCidade"]."',idTecnico='".$_POST["idTecnico"]." WHERE idClube=".$_POST["codigo"];
    }
  }else{
    $sql = "INSERT INTO clube VALUES (".$_POST["idClube"].",'".$_POST["nome"]."',".$_POST["anoFundacao"].",".$_POST["idCidade"].",".$_POST["idTecnico"].")";
  }
  mysqli_query($con, $sql);
  mysqli_close($con);
  header("location: ./index.php");
?>
