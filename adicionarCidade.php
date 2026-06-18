<?php
// Definindo o tipo de conteúdo da página
header("Content-type: text/html; charset=utf-8", true);
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Adicionar e Modificar Cidade</title>
    </head>
    <body>
        <h1 id="titulo">Adicionar e Modificar Cidade</h1>
        <p id="descricao"> Central com dados de clubes, jogadores do futebol mundial</p>

        <form action="addCidade.php" method="POST">
            <?php
                if(isset($_GET["codigo"])){
                    include("./config.php");
                    $con = mysqli_connect($host, $login, $senha, $bd);

                    if(!$con){
                        die("Conexão falhou!" . mysqli_connect_error());
                    }
            ?>
            <center>
                <h3 id="tituloModificar">Modificar dados da cidade</h3>
            </center>
            <?php 
                $sql = "SELECT * FROM cidade WHERE idCidade = ".$_GET["codigo"];
                $result = mysqli_query($con, $sql);
                $vetor = mysqli_fetch_array($result, MYSQLI_ASSOC);
                mysqli_close($con);
            ?>
            <input type="hidden" name="codigo" value="<?php echo $vetor["idCidade"] ?>">
            <?php
                }else{
            ?>
            <center>
                <h3 id="tituloAdicionar">Adicionar cidade</h3>
            </center>
            <?php
                }
            ?>

            <table border = "1" cellspacing = "0">
                <tr>
                    <td>
                        <font size = "3"> Digite os dados da cidade: </font>
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> ID da Cidade: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "idCidade" value = "<?php echo @$vetor["idCidade"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>   

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Nome da Cidade: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "nome" value = "<?php echo @$vetor["nome"] ?>" maxlength="45" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Estado (Sigla): </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "estado" value = "<?php echo @$vetor["estado"] ?>" maxlength="2" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td>
                        <input type="button" value="Voltar" onclick="location.href='index.php'">
                        <input type="submit" value="Cadastrar">
                    </td>
                </tr>  
            </table>
        </form>
    </body>
</html>