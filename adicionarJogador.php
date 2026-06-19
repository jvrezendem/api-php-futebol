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

        <form action="addJogador.php" method="POST">
            <?php
                if(isset($_GET["codigo"])){
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
                $sql = "SELECT * FROM jogador WHERE idJogador = ".$_GET["codigo"];
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

            <table border = "1" cellspace = "0" class="tabela">
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

<style>
    body {
        background-color: #FAF6EB;
        margin: 0;
        padding: 0;
        font-family: sans-serif;
    }
    #cabecalho-titulo{
        text-align: center;
        margin-top: 30px;
    }
    #titulo{
        color: #123B35;
        font-size: 30px;
        
    }
    #imagem-titulo{
        width: 5%;
    }
    #descricao{
        color: #123B35;
        font-size: 24px;
        padding-left: 100px;
    }
    .tabela {
    width: 90%;
    margin: 30px auto;
    border-collapse: separate;
    border-spacing: 0;
    background-color: #FAF6EB;

    border: 2px solid #123B35;
    border-radius: 22px;
    overflow: hidden;

    box-shadow: 0 18px 40px rgba(18, 59, 53, 0.12);
}

/* Células da tabela */
.tabela td,
.tabela th {
    padding: 14px 16px;
    border-bottom: 1px solid #D8CDB8;
    border-right: 1px solid #D8CDB8;
    color: #123B35;
    font-weight: 600;
}

/* Remove borda da última coluna */
.tabela td:last-child,
.tabela th:last-child {
    border-right: none;
}

/* Remove borda da última linha */
.tabela tr:last-child td {
    border-bottom: none;
}

/* Linha do título da tabela */
.tabela h2 {
    margin: 0;
    padding: 18px;
    color: #123B35;
    font-size: 32px;
}

/* Cabeçalho das colunas */
.tabela tr[bgcolor="grey"] td {
    background-color: #123B35;
    color: #FAF6EB;
    font-weight: bold;
}

/* Linhas normais */
.tabela tr:not(:first-child):not([bgcolor="grey"]):hover {
    background-color: #E8F7F1;
}

/* Botões */
input[type="button"],
input[type="submit"] {
    background-color: #123B35;
    color: #FAF6EB;
    padding: 11px 18px;
    border: none;
    border-radius: 999px;
    cursor: pointer;
    font-weight: bold;
    transition: 0.2s;
}

input[type="button"]:hover,
input[type="submit"]:hover {
    background-color: #1F8F80;
    transform: translateY(-2px);
}
</style>
