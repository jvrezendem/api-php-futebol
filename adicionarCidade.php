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

            <table border = "1" cellspacing = "0" class="tabela">
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