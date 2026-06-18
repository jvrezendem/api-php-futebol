<?php
// Definindo o tipo de conteúdo da página
header("Content-type: text/html; charset=utf-8", true);

include("./config.php");
// Definindo a conexão com o banco de dados
$con = mysqli_connect($host, $login, $senha, $bd);

// Verificando se a conexão foi estabelecida
if(!$con){
    die("Conexão falhou!" . mysqli_connect_error());
}

//definição dos dados de clube e jogador puxados do bd
$sqlJogador = "SELECT * FROM jogador ORDER BY idJogador";
$tabelaJogador = mysqli_query($con, $sqlJogador);

$sqlClube = "SELECT * FROM clube ORDER BY idClube";
$tabelaClube = mysqli_query($con, $sqlClube);
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Central do Futebol</title>
    </head>
    <body>
        <h1 id="titulo">Página Inicial</h1>
        <p id="descricao"> Central com dados de clubes, jogadores do futebol mundial</p>
        <form name="form1"  method="POST" action="adicionarJogador.php">
            <table border="1" cellspacing="0">
            <?php
            //Criação da tabela de jogadores

            //Verifica se há dados nas tabelas, se não houver, exibe mensagem de erro
            if(mysqli_num_rows($tabelaJogador) == 0){
            ?>

                <tr id="nenhumJogador"><td align="center"> Nenhum jogador encontrado. </td></tr>
                <tr id="adicionarJogador"><td align="center"><input type="button" value="Adicionar Jogador"> </td></tr>

            <?php
            //Se houver dados, exibe a tabela de jogadores
            }else{
            ?>

                <tr id="dadosJogadores" bgcolor="grey">
                    <td id="colunaID" align="left"> Id Jogador </td>
                    <td id="colunaNome" align="left"> Nome </td>
                    <td id="colunaNacionalidade" align="left"> Posição Principal </td>
                    <td id="colunaIdade" align="left"> Nacionalidade Esportiva </td>
                    <td id="colunaPosicao" align="left"> Número da Camisa </td>
                    <td id="colunaClube" align="left"> Data de Nascimento </td>
                    <td id="colunaValorMercado" align="left"> Id do Clube </td>
                </tr>
                
                <?php
                //percorrendo os dados da tabela de jogadores
                while($dadosJogador = mysqli_fetch_row($tabelaJogador)){
                ?>

                    <tr id="dadosJogadores">
                        <td id="colunaID" align="left"><?php echo $dadosJogador[0]; ?></td>
                        <td id="colunaNome" align="left"><?php echo $dadosJogador[1]; ?></td>
                        <td id="colunaNacionalidade" align="left"><?php echo $dadosJogador[2]; ?></td>
                        <td id="colunaIdade" align="left"><?php echo $dadosJogador[3]; ?></td>
                        <td id="colunaPosicao" align="left"><?php echo $dadosJogador[4]; ?></td>
                        <td id="colunaClube" align="left"><?php echo $dadosJogador[5]; ?></td>
                        <td id="colunaValorMercado" align="left"><?php echo $dadosJogador[6]; ?></td>
                    </tr>

                <?php
                }
                ?>
            <?php
            }
            ?>    
            <tr id="adicionarJogador"><td align="center"><input type="submit" value="Adicionar Jogador"> </td></tr>
            </table>
        </form>

        <br>

        <form name="form2" method="POST" action="adicionarClube.php">
            <table border="1" cellspacing="0">
                <?php
                //criação da tabela de clubes
                if(mysqli_num_rows($tabelaClube) == 0){
                ?>

                <tr id="nenhumClube"><td align="center"> Nenhum clube encontrado. </td></tr>
                <tr id="adicionarClube"><td align="center"><input type="button" value="Adicionar Clube"> </td></tr>

                <?php
                //Se houver dados, exibe a tabela de clubes
                }else{
                ?>

                    <tr id="dadosClubes" bgcolor="grey">
                        <td id="colunaID" align="left"> Id Clube </td>
                        <td id="colunaNome" align="left"> Nome </td>
                        <td id="colunaAnoFundacao" align="left"> Ano de fundação </td>
                        <td id="colunaCidade" align="left"> Id Cidade </td>
                        <td id="colunaEstado" align="left"> Id Treinador </td>
                    </tr>

                    <?php
                    //percorrendo os dados da tabela de clubes
                    while($dadosClube = mysqli_fetch_row($tabelaClube)){
                    ?>

                    <tr id="dadosClubes">
                        <td id="colunaID" align="left"><?php echo $dadosClube[0]; ?></td>
                        <td id="colunaNome" align="left"><?php echo $dadosClube[1]; ?></td>
                        <td id="colunaAnoFundacao" align="left"><?php echo $dadosClube[2]; ?></td>
                        <td id="colunaCidade" align="left"><?php echo $dadosClube[3]; ?></td>
                        <td id="colunaEstado" align="left"><?php echo $dadosClube[4]; ?></td>
                    </tr>

                    <?php
                    }
                    ?>
                <?php
                }
                ?>
                <tr id="adicionarClube"><td align="center"><input type="submit" value="Adicionar Clube"> </td></tr>
            </table>
        </form>
    </body>
</html>
