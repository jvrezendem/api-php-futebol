<?php
// Definindo o tipo de conteúdo da página
header("Content-type: text/html; charset=utf-8", true);
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Adicionar e Modificar Jogador</title>
    </head>
    <body>
        <h1 id="titulo">Adicionar e Modificar Jogador</h1>
        <p id="descricao"> Central com dados de clubes, jogadores do futebol mundial</p>

        <form action="addJogador.php" method="POST">
            <?php
                if(isset($_GET["idJogador"])){
                    include("./config.php");
                    // Definindo a conexão com o banco de dados
                    $con = mysqli_connect($host, $login, $senha, $bd);

                    // Verificando se a conexão foi estabelecida
                    if(!$con){
                        die("Conexão falhou!" . mysqli_connect_error());
                    }
            ?>
            <center>
                <h3 id="tituloModificar">Modificar dados do jogador</h3>
            </center>
            <?php 
                //Consulta SQL a ser realizada
                $sql = "SELECT * FROM jogador WHERE idJogador = ".$_GET["idJogador"];
                $result = mysqli_query($con, $sql);
                $vetor = mysqli_fetch_array($result, MYSQLI_ASSOC);
                mysqli_close($con);
            ?>
            <input type="hidden" name="codigo" value="<?php echo $vetor["idJogador"] ?>">
            <?php
                }else{
            ?>
            <center>
                <h3 id="tituloAdicionar">Adicionar jogador</h3>
            </center>
            <?php
                }
            ?>

            <table border = "1" cellspace = "0">
                <tr>
                    <td>
                        <font size = "3"> Digite os dados do jogador: </font>
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> ID do Jogador: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "idJogador" maxlenght = "50" value = "<?php echo @$vetor["idJogador"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>   

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Nome: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "nome" maxlenght = "50" value = "<?php echo @$vetor["nome"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Posição principal: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "posicaoPrincipal" maxlenght = "50" value = "<?php echo @$vetor["posicaoPrincipal"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Nacionalidade Esportiva: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "nacionalidadeEsportiva" maxlenght = "50" value = "<?php echo @$vetor["nacionalidadeEsportiva"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Numero da camisa: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "numeroCamisa" maxlenght = "50" value = "<?php echo @$vetor["numeroCamisa"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> Data de nascimento: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "dataNascimento" maxlenght = "50" value = "<?php echo @$vetor["dataNascimento"] ?>" maxlength="50" size="31"> 
                    </td>
                </tr>

                <tr> 
                    <td width = 20%>
                        <font size = "3"> ID do Clube: </font>
                    </td>
                    <td colspan="2" width = 80%>
                        <input type = "text" name = "idClube" maxlenght = "50" value = "<?php echo @$vetor["idClube"] ?>" maxlength="50" size="31"> 
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
