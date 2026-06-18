<?php
// Definindo o tipo de conteúdo da página
header("Content-type: text/html; charset=utf-8", true);
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Adicionar e Modificar Técnico</title>
    </head>
    <body>
        <h1 id="titulo">Adicionar e Modificar Técnico</h1>
        <p id="descricao"> Central com dados de clubes, jogadores do futebol mundial</p>

        <form action="addTecnico.php" method="POST">
            <?php
                if(isset($_GET["codigo"])){
                    include("./config.php");
                    $con = mysqli_connect($host, $login, $senha, $bd);

                    if(!$con){
                        die("Conexão falhou!" . mysqli_connect_error());
                    }
            ?>
            <center>
                <h3 id="tituloModificar">Modificar dados do técnico</h3>
            </center>
            <?php 
                $sql = "SELECT * FROM tecnico WHERE idTecnico = ".$_GET["codigo"];
                $result = mysqli_query($con, $sql);
                $vetor = mysqli_fetch_array($result, MYSQLI_ASSOC);
                mysqli_close($con);
            ?>
            <input type="hidden" name="codigo" value="<?php echo $vetor["idTecnico"] ?>">
            <?php
                }else{
            ?>
            <center>
                <h3 id="tituloAdicionar">Adicionar técnico</h3>
            </center>
            <?php
                }
            ?>

            <table border = "1" cellspacing = "0">
                <tr>
                    <td>
                        <font size = "3"> Digite os dados do técnico: </font>
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> ID do Técnico: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "idTecnico" value = "<?php echo @$vetor["idTecnico"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>   

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Nome: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "nome" value = "<?php echo @$vetor["nome"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Estilo de Jogo: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "estiloJogo" value = "<?php echo @$vetor["estiloJogo"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Data de Nascimento: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "dataNascimento" value = "<?php echo @$vetor["dataNascimento"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Nacionalidade: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "nacionalidade" value = "<?php echo @$vetor["nacionalidade"] ?>" maxlength="30" size="31"> 
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