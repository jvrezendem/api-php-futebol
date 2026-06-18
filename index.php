<?php
// Definindo o tipo de conteúdo da página
header("Content-type: text/html; charset=utf-8", true);

include("config.php");
// Definindo a conexão com o banco de dados
$con = mysqli_connect($host, $login, $senha, $bd);

// Verificando se a conexão foi estabelecida
if(!$con){
    die("Conexão falhou!" . mysqli_connect_error());
}

//definição dos dados de clube, jogador, cidade e tecnico puxados do bd
$sqlJogador = "SELECT * FROM jogador ORDER BY idJogador";
$tabelaJogador = mysqli_query($con, $sqlJogador);

$sqlClube = "SELECT * FROM clube ORDER BY idClube";
$tabelaClube = mysqli_query($con, $sqlClube);

$sqlCidade = "SELECT * FROM cidade ORDER BY idCidade";
$tabelaCidade = mysqli_query($con, $sqlCidade);

$sqlTecnico = "SELECT * FROM tecnico ORDER BY idTecnico";
$tabelaTecnico = mysqli_query($con, $sqlTecnico);
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
            if(mysqli_num_rows($tabelaJogador) == 0){
            ?>
                <tr id="nenhumJogador"><td align="center"> Nenhum jogador encontrado. </td></tr>
                <tr id="adicionarJogador"><td align="center"><input type="button" value="Adicionar Jogador"> </td></tr>
            <?php
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
                    <td align="center"> Ações </td>
                </tr>
                <?php
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
                        <td align="center">
                            <input type="button" value="Excluir" onclick="location.href='excluirJogador.php?codigo=<?php echo $dadosJogador[0]; ?>'">
                            <input type="button" value="Editar" onclick="location.href='adicionarJogador.php?codigo=<?php echo $dadosJogador[0]; ?>'">
                        </td>
                    </tr>
                <?php
                }
            }
            ?>    
            <tr id="adicionarJogador"><td colspan="8" align="center"><input type="submit" value="Adicionar Jogador"> </td></tr>
            </table>
        </form>

        <br>

        <form name="form2" method="POST" action="adicionarClube.php">
            <table border="1" cellspacing="0">
                <?php
                if(mysqli_num_rows($tabelaClube) == 0){
                ?>
                <tr id="nenhumClube"><td align="center"> Nenhum clube encontrado. </td></tr>
                <tr id="adicionarClube"><td align="center"><input type="button" value="Adicionar Clube"> </td></tr>
                <?php
                }else{
                ?>
                    <tr id="dadosClubes" bgcolor="grey">
                        <td id="colunaID" align="left"> Id Clube </td>
                        <td id="colunaNome" align="left"> Nome </td>
                        <td id="colunaAnoFundacao" align="left"> Ano de fundação </td>
                        <td id="colunaCidade" align="left"> Id Cidade </td>
                        <td id="colunaEstado" align="left"> Id Treinador </td>
                        <td align="center"> Ações </td>
                    </tr>
                    <?php
                    while($dadosClube = mysqli_fetch_row($tabelaClube)){
                    ?>
                    <tr id="dadosClubes">
                        <td id="colunaID" align="left"><?php echo $dadosClube[0]; ?></td>
                        <td id="colunaNome" align="left"><?php echo $dadosClube[1]; ?></td>
                        <td id="colunaAnoFundacao" align="left"><?php echo $dadosClube[2]; ?></td>
                        <td id="colunaCidade" align="left"><?php echo $dadosClube[3]; ?></td>
                        <td id="colunaEstado" align="left"><?php echo $dadosClube[4]; ?></td>
                        <td align="center">
                            <input type="button" value="Excluir" onclick="location.href='excluirClube.php?codigo=<?php echo $dadosClube[0]; ?>'">
                            <input type="button" value="Editar" onclick="location.href='modificarClube.php?codigo=<?php echo $dadosClube[0]; ?>'">
                        </td>
                    </tr>
                    <?php
                    }
                }
                ?>
                <tr id="adicionarClube"><td colspan="6" align="center"><input type="submit" value="Adicionar Clube"> </td></tr>
            </table>
        </form>

        <br>

        <form name="form3" method="POST" action="adicionarCidade.php">
            <table border="1" cellspacing="0">
                <?php
                if(mysqli_num_rows($tabelaCidade) == 0){
                ?>
                <tr id="nenhumaCidade"><td align="center"> Nenhuma cidade encontrada. </td></tr>
                <tr id="adicionarCidade"><td align="center"><input type="button" value="Adicionar Cidade"> </td></tr>
                <?php
                }else{
                ?>
                    <tr id="dadosCidades" bgcolor="grey">
                        <td id="colunaID" align="left"> Id Cidade </td>
                        <td id="colunaNome" align="left"> Nome </td>
                        <td id="colunaEstado" align="left"> Estado </td>
                        <td align="center"> Ações </td>
                    </tr>
                    <?php
                    while($dadosCidade = mysqli_fetch_row($tabelaCidade)){
                    ?>
                    <tr id="dadosCidades">
                        <td id="colunaID" align="left"><?php echo $dadosCidade[0]; ?></td>
                        <td id="colunaNome" align="left"><?php echo $dadosCidade[1]; ?></td>
                        <td id="colunaEstado" align="left"><?php echo $dadosCidade[2]; ?></td>
                        <td align="center">
                            <input type="button" value="Excluir" onclick="location.href='excluirCidade.php?codigo=<?php echo $dadosCidade[0]; ?>'">
                            <input type="button" value="Editar" onclick="location.href='modificarCidade.php?codigo=<?php echo $dadosCidade[0]; ?>'">
                        </td>
                    </tr>
                    <?php
                    }
                }
                ?>
                <tr id="adicionarCidade"><td colspan="4" align="center"><input type="submit" value="Adicionar Cidade"> </td></tr>
            </table>
        </form>

        <br>

        <form name="form4" method="POST" action="adicionarTecnico.php">
            <table border="1" cellspacing="0">
                <?php
                if(mysqli_num_rows($tabelaTecnico) == 0){
                ?>
                <tr id="nenhumTecnico"><td align="center"> Nenhum técnico encontrado. </td></tr>
                <tr id="adicionarTecnico"><td align="center"><input type="button" value="Adicionar Técnico"> </td></tr>
                <?php
                }else{
                ?>
                    <tr id="dadosTecnicos" bgcolor="grey">
                        <td id="colunaID" align="left"> Id Técnico </td>
                        <td id="colunaNome" align="left"> Nome </td>
                        <td id="colunaEstilo" align="left"> Estilo de Jogo </td>
                        <td id="colunaNascimento" align="left"> Data de Nascimento </td>
                        <td id="colunaNacionalidade" align="left"> Nacionalidade </td>
                        <td align="center"> Ações </td>
                    </tr>
                    <?php
                    while($dadosTecnico = mysqli_fetch_row($tabelaTecnico)){
                    ?>
                    <tr id="dadosTecnicos">
                        <td id="colunaID" align="left"><?php echo $dadosTecnico[0]; ?></td>
                        <td id="colunaNome" align="left"><?php echo $dadosTecnico[1]; ?></td>
                        <td id="colunaEstilo" align="left"><?php echo $dadosTecnico[2]; ?></td>
                        <td id="colunaNascimento" align="left"><?php echo $dadosTecnico[3]; ?></td>
                        <td id="colunaNacionalidade" align="left"><?php echo $dadosTecnico[4]; ?></td>
                        <td align="center">
                            <input type="button" value="Excluir" onclick="location.href='excluirTecnico.php?codigo=<?php echo $dadosTecnico[0]; ?>'">
                            <input type="button" value="Editar" onclick="location.href='modificarTecnico.php?codigo=<?php echo $dadosTecnico[0]; ?>'">
                        </td>
                    </tr>
                    <?php
                    }
                }
                ?>
                <tr id="adicionarTecnico"><td colspan="6" align="center"><input type="submit" value="Adicionar Técnico"> </td></tr>
            </table>
        </form>
    </body>
</html>