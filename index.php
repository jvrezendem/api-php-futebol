<?php
// Definindo o tipo de conteúdo da página
header("Content-type: text/html; charset=utf-8", true);
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Central do Futebol</title>
    </head>
    <body>
        <h1 id="titulo">Página Inicial</h1>
        <p id="descricao"> Central com dados de clubes, jogadores do futebol mundial</p>
        
    </body>
</html>

<?php
// Definindo a conexão com o banco de dados
$con = mysqli_connect($host, $login, $senha, $bd);

// Verificando se a conexão foi estabelecida
if(!$con){
    die("Conexão falhou!");
}


//definição dos dados de clube e jogador puxados do bd
$sqlJogador = "SELECT * FROM jogador ORDER BY id";
$tabelaJogador = mysqli_query($con, $sqlJogador);

$sqlClube = "SELECT * FROM clube ORDER BY id";
$tabelaClube = mysqli_query($con, $sqlClube);

//Criação da tabela de jogadores

//Verifica se há dados nas tabelas, se não houver, exibe mensagem de erro
if(mysqli_num_rows($tabelaJogador) > 0){
?>

<tr id="nenhumjogador"><td align="center"> Nenhum jogador encontrado. </td></tr>
<tr id="adicionarJogador"><td align="center"><input type="button" value="Adicionar Jogador"> </td></tr>

<?php
//Se houver dados, exibe a tabela de jogadores
}else{
?>

<tr id="dadosJogadores" bgcolor="grey">
    <td id="colunaID" align="left"> ID </td>
    <td id="colunaNome" align="left"> Nome </td>
    <td id="colunaNacionalidade" align="left"> Nacionalidade </td>
    <td id="colunaIdade" align="left"> Idade </td>
    <td id="colunaPosicao" align="left"> Posição </td>
    <td id="colunaClube" align="left"> Clube </td>
    <td id="colunaValorMercado" align="left"> Valor de mercado </td>
</tr>

<?php
}
?>

<?php
//criação da tabela de clubes
if(mysqli_num_rows($tabelaClube) > 0){
?>

<tr id="nenhumClube"><td align="center"> Nenhum clube encontrado. </td></tr>
<tr id="adicionarClube"><td align="center"><input type="button" value="Adicionar Clube"> </td></tr>

<?php
//Se houver dados, exibe a tabela de clubes
}else{
?>

<tr id="dadosClubes" bgcolor="grey">
    <td id="colunaID" align="left"> ID </td>
    <td id="colunaNome" align="left"> Nome </td>
    <td id="colunaAnoFundacao" align="left"> Ano de fundação </td>
    <td id="colunaCidade" align="left"> Cidade </td>
    <td id="colunaEstado" align="left"> Estado </td>
</tr>

<?php
}
?>
