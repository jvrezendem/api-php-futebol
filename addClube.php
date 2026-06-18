<?php
include("config.php");

// 1. Estabelece a conexão com o banco de dados
$con = mysqli_connect($host, $login, $senha, $bd);

if(!$con){
    die("Conexão falhou!" . mysqli_connect_error());
}

// 2. Recupera os dados enviados pelo formulário do clube
$idClube     = $_POST['idClube'];
$nome        = $_POST['nome'];
$anoFundacao = $_POST['anoFundacao'];
$idCidade    = $_POST['idCidade'];
$idTecnico   = $_POST['idTecnico'];

// 3. Verifica se é uma EDIÇÃO (se o campo 'codigo' veio preenchido)
if(isset($_POST['codigo']) && !empty($_POST['codigo'])) {
    $codigo = $_POST['codigo'];
    // Query de Atualização
    $sql = "UPDATE clube 
            SET idClube = '$idClube', nome = '$nome', anoFundacao = '$anoFundacao', idCidade = '$idCidade', idTecnico = '$idTecnico' 
            WHERE idClube = $codigo";
} else {
    // Query de Inserção (Caso seja um novo clube)
    $sql = "INSERT INTO clube (idClube, nome, anoFundacao, idCidade, idTecnico) 
            VALUES ('$idClube', '$nome', '$anoFundacao', '$idCidade', '$idTecnico')";
}

// 4. Executa a query no banco de dados
$resultado = mysqli_query($con, $sql);

// 5. Verifica o resultado, fecha a conexão e redireciona
if($resultado){
    mysqli_close($con);
    header("Location: index.php");
    exit();
} else {
    // Se der erro de integridade (ex: ID de cidade ou técnico que não existem), ele avisa aqui
    echo "Erro ao salvar o clube: " . mysqli_error($con);
    mysqli_close($con);
}
?>