# Tutorial completo: PHP com Banco de Dados

> Objetivo deste tutorial: entender as principais técnicas de programação de banco de dados e aprender, com mais detalhes, como usar PHP para construir aplicações Web com acesso a banco de dados.

# 12. PHP: introdução e funcionamento em aplicações Web

PHP é uma linguagem de script muito usada para gerar páginas Web dinâmicas.

A ideia central é simples:

1. O navegador faz uma requisição.
2. O servidor Web recebe a requisição.
3. O PHP executa no servidor.
4. O PHP pode consultar o banco de dados.
5. O PHP gera HTML.
6. O navegador recebe apenas o resultado final.

## 12.1 PHP roda no servidor

Diferente do JavaScript tradicional no navegador, o PHP é executado no servidor.

Exemplo:

```php
<?php
$nome = "João";
echo "<h1>Bem-vindo, $nome</h1>";
?>
```

O navegador não recebe o código PHP. Ele recebe algo como:

```html
<h1>Bem-vindo, João</h1>
```

## 12.2 Arquitetura de três camadas

Em aplicações Web com banco de dados, normalmente temos:

| Camada | Responsabilidade |
|---|---|
| Cliente | Navegador do usuário |
| Servidor Web / aplicação | Executa PHP e gera HTML |
| Banco de dados | Armazena e consulta dados |

Fluxo:

```text
Navegador -> Servidor PHP -> Banco de Dados
Navegador <- HTML gerado <- Resultado SQL
```

---

# 13. Usando PHP no VS Code

Esta seção ensina como preparar o ambiente para escrever e executar PHP no Visual Studio Code.

## 13.1 O que instalar

Você precisa de:

1. **Visual Studio Code**.
2. **PHP instalado no computador**.
3. Opcionalmente, um pacote como **XAMPP**, **Laragon** ou **WampServer**, que já vem com Apache, PHP e MySQL/MariaDB.
4. Extensões úteis no VS Code.

## 13.2 Opção mais simples para estudo: XAMPP ou Laragon

Para quem está começando, a forma mais fácil é instalar um ambiente pronto:

- XAMPP: Apache + PHP + MariaDB/MySQL + phpMyAdmin.
- Laragon: ambiente local simples para Windows.

Depois disso, você consegue criar projetos PHP e acessar pelo navegador.

## 13.3 Conferindo se o PHP está instalado

Abra o terminal do VS Code e digite:

```bash
php -v
```

Se aparecer a versão do PHP, está funcionando.

Exemplo de saída:

```text
PHP 8.x.x (cli)
```

Se aparecer erro dizendo que `php` não é reconhecido, significa que o PHP não está no PATH do sistema.

## 13.4 Configurando o PATH no Windows

Se você usa XAMPP, o PHP geralmente fica em:

```text
C:\xampp\php
```

Adicione esse caminho à variável de ambiente `Path`.

Depois feche e abra o VS Code novamente.

Teste:

```bash
php -v
```

## 13.5 Extensões recomendadas no VS Code

Instale pelo menu de extensões:

- **PHP Intelephense**: autocompletar, análise e navegação no código.
- **PHP Debug**: depuração com Xdebug, opcional.
- **MySQL** ou **Database Client JDBC**: para visualizar bancos dentro do VS Code, opcional.

## 13.6 Criando o primeiro arquivo PHP

Crie uma pasta chamada:

```text
aula-php
```

Dentro dela, crie o arquivo:

```text
index.php
```

Código:

```php
<?php
$nome = "João";
echo "Olá, $nome! Meu primeiro PHP no VS Code.";
?>
```

## 13.7 Executando PHP pelo terminal

No terminal, dentro da pasta do projeto, rode:

```bash
php index.php
```

Resultado esperado:

```text
Olá, João! Meu primeiro PHP no VS Code.
```

## 13.8 Executando PHP no navegador com servidor embutido

Para páginas Web, use o servidor embutido do PHP:

```bash
php -S localhost:8000
```

Depois acesse no navegador:

```text
http://localhost:8000
```

Se o arquivo `index.php` estiver na pasta, ele será executado automaticamente.

## 13.9 Estrutura recomendada para estudar

```text
aula-php/
│
├── index.php
├── formulario.php
├── salvar.php
├── config/
│   └── conexao.php
└── public/
    └── style.css
```

## 13.10 Erros comuns no VS Code

### Erro: `php não é reconhecido`

Solução: instalar o PHP ou colocar a pasta do PHP no PATH.

### Página mostra o código PHP em vez de executar

Isso acontece quando você abre o arquivo direto no navegador, tipo:

```text
file:///C:/projeto/index.php
```

Use servidor local:

```bash
php -S localhost:8000
```

E acesse:

```text
http://localhost:8000
```

### Erro de conexão com MySQL

Confira:

- servidor MySQL ligado;
- nome do banco correto;
- usuário e senha corretos;
- extensão PDO MySQL habilitada.

---

# 14. Fundamentos de PHP

## 14.1 Tags PHP

O código PHP fica entre:

```php
<?php
// código aqui
?>
```

Em arquivos puramente PHP, é comum omitir a tag final `?>` para evitar espaços acidentais no final do arquivo.

## 14.2 Comentários

Comentário de uma linha:

```php
// Este é um comentário
```

Comentário de várias linhas:

```php
/*
Este comentário
ocupa várias linhas.
*/
```

## 14.3 Variáveis

Toda variável em PHP começa com `$`.

```php
$nome = "Ana";
$idade = 20;
$salario = 2500.75;
$ativo = true;
```

PHP tem tipagem dinâmica. O tipo depende do valor atribuído.

```php
$valor = 10;       // inteiro
$valor = "dez";   // agora é string
```

## 14.4 Diferença entre aspas simples e duplas

Aspas simples não interpretam variáveis:

```php
$nome = "Ana";
echo 'Olá, $nome';
```

Saída:

```text
Olá, $nome
```

Aspas duplas interpretam variáveis:

```php
$nome = "Ana";
echo "Olá, $nome";
```

Saída:

```text
Olá, Ana
```

## 14.5 Concatenação

Em PHP, concatenação usa ponto:

```php
$nome = "Ana";
$sobrenome = "Silva";

$completo = $nome . " " . $sobrenome;

echo $completo;
```

## 14.6 Heredoc

Heredoc é útil para textos grandes, principalmente HTML.

```php
$nome = "Ana";

$html = <<<HTML
<h1>Bem-vinda, $nome</h1>
<p>Seu cadastro foi realizado.</p>
HTML;

echo $html;
```

## 14.7 Condicionais

```php
$salario = 3000;

if ($salario >= 5000) {
    echo "Salário alto";
} elseif ($salario >= 2500) {
    echo "Salário médio";
} else {
    echo "Salário baixo";
}
```

## 14.8 Repetição

### while

```php
$i = 1;

while ($i <= 5) {
    echo $i . "<br>";
    $i++;
}
```

### for

```php
for ($i = 1; $i <= 5; $i++) {
    echo $i . "<br>";
}
```

### foreach

```php
$nomes = ["Ana", "Bruno", "Carlos"];

foreach ($nomes as $nome) {
    echo $nome . "<br>";
}
```

---

# 15. Formulários HTML com PHP

Formulários permitem enviar dados do usuário para o PHP.

## 15.1 Formulário com método POST

Arquivo `index.php`:

```php
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Formulário PHP</title>
</head>
<body>
    <form method="post" action="processa.php">
        <label>Digite seu nome:</label>
        <input type="text" name="nome_usuario">
        <button type="submit">Enviar</button>
    </form>
</body>
</html>
```

Arquivo `processa.php`:

```php
<?php
$nome = $_POST["nome_usuario"] ?? "";

echo "Bem-vindo, " . htmlspecialchars($nome) . "!";
?>
```

## 15.2 O que é `$_POST`?

`$_POST` é uma variável superglobal do PHP.

Ela guarda os valores enviados por formulário usando o método POST.

Exemplo:

```html
<input type="text" name="nome_usuario">
```

No PHP:

```php
$_POST["nome_usuario"]
```

## 15.3 Reprocessando o mesmo arquivo

É possível enviar o formulário para o próprio arquivo.

```php
<?php
$nome = $_POST["nome_usuario"] ?? null;
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Mesmo arquivo</title>
</head>
<body>

<?php if ($nome): ?>
    <p>Bem-vindo, <?= htmlspecialchars($nome) ?>!</p>
<?php else: ?>
    <form method="post" action="<?= htmlspecialchars($_SERVER['PHP_SELF']) ?>">
        <label>Digite seu nome:</label>
        <input type="text" name="nome_usuario">
        <button type="submit">Enviar</button>
    </form>
<?php endif; ?>

</body>
</html>
```

## 15.4 Por que usar `htmlspecialchars`?

Porque dados digitados pelo usuário não devem ser enviados diretamente para o HTML.

Exemplo perigoso:

```php
echo $_POST["nome_usuario"];
```

Se o usuário digitar código HTML ou JavaScript, isso pode causar problemas.

Forma melhor:

```php
echo htmlspecialchars($_POST["nome_usuario"]);
```

---

# 16. Vetores/arrays em PHP

PHP usa arrays de forma muito flexível.

## 16.1 Array numérico

```php
$disciplinas = ["Banco de Dados", "Sistemas Operacionais", "Grafos"];

echo $disciplinas[0]; // Banco de Dados
```

## 16.2 Array associativo

```php
$professores = [
    "Banco de Dados" => "Silva",
    "Sistemas Operacionais" => "Carrick",
    "Grafos" => "Kam"
];

echo $professores["Banco de Dados"];
```

## 16.3 Percorrendo array associativo

```php
foreach ($professores as $disciplina => $professor) {
    echo "$disciplina é lecionada por $professor <br>";
}
```

## 16.4 Array bidimensional

Resultados de banco de dados costumam virar arrays bidimensionais.

```php
$funcionarios = [
    ["nome" => "Ana", "cargo" => "Dev", "salario" => 3000],
    ["nome" => "Bruno", "cargo" => "DBA", "salario" => 4500],
];

foreach ($funcionarios as $funcionario) {
    echo $funcionario["nome"] . " - " . $funcionario["cargo"] . "<br>";
}
```

---

# 17. Funções em PHP

Funções ajudam a organizar o código.

## 17.1 Exemplo básico

```php
function saudacao($nome) {
    return "Olá, $nome!";
}

echo saudacao("Ana");
```

## 17.2 Função com array associativo

```php
function professorDisciplina($disciplina, $professores) {
    if (array_key_exists($disciplina, $professores)) {
        return $professores[$disciplina] . " leciona $disciplina";
    }

    return "Não existe professor cadastrado para $disciplina";
}

$professores = [
    "Banco de Dados" => "Silva",
    "SO" => "Carrick",
    "Grafos" => "Kam"
];

echo professorDisciplina("Banco de Dados", $professores);
```

## 17.3 Parâmetros por valor

Por padrão, PHP passa parâmetros por valor.

```php
function dobrar($numero) {
    $numero = $numero * 2;
    return $numero;
}

$x = 10;
echo dobrar($x); // 20
echo $x;         // continua 10
```

## 17.4 Parâmetros por referência

Se quiser alterar o valor original, use `&`.

```php
function dobrarOriginal(&$numero) {
    $numero = $numero * 2;
}

$x = 10;
dobrarOriginal($x);
echo $x; // 20
```

---

# 18. PHP com banco de dados

Os slides apresentam a biblioteca **PEAR DB**, uma biblioteca usada historicamente para acesso a bancos em PHP.

Hoje, em projetos novos, é mais comum usar:

- **PDO**;
- **MySQLi**;
- frameworks como Laravel, Symfony ou CodeIgniter.

Neste tutorial, vamos explicar a ideia da PEAR DB e depois usar **PDO**, que é mais adequado para estudo atual e para programação segura.

## 18.1 Ideia da PEAR DB

A PEAR DB permitia conectar e executar comandos assim, de forma conceitual:

```php
require 'DB.php';

$db = DB::connect('mysql://usuario:senha@localhost/banco');

if (DB::isError($db)) {
    die('Não foi possível conectar: ' . $db->getMessage());
}

$resultado = $db->query('SELECT nome FROM funcionario');
```

Ela também usava marcadores `?` para parâmetros:

```php
$sql = 'INSERT INTO funcionario VALUES (?, ?, ?)';
$db->query($sql, [$id, $nome, $cargo]);
```

A ideia importante é: **nunca montar SQL colocando dados do usuário diretamente dentro da string**.

## 18.2 Usando PDO

PDO significa **PHP Data Objects**.

Ele oferece uma interface para acessar diferentes bancos de dados.

## 18.3 Conectando ao MySQL com PDO

```php
<?php
$host = "localhost";
$banco = "empresa";
$usuario = "root";
$senha = "";

$dsn = "mysql:host=$host;dbname=$banco;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $usuario, $senha);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conectado com sucesso!";
} catch (PDOException $e) {
    echo "Erro ao conectar: " . $e->getMessage();
}
?>
```

## 18.4 Criando uma tabela

```sql
CREATE DATABASE empresa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE empresa;

CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    departamento VARCHAR(100) NOT NULL
);
```

## 18.5 Inserindo dados com prepared statement

```php
<?php
$sql = "INSERT INTO funcionario (nome, cargo, salario, departamento)
        VALUES (:nome, :cargo, :salario, :departamento)";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    ":nome" => "Ana Silva",
    ":cargo" => "Desenvolvedora",
    ":salario" => 3500.00,
    ":departamento" => "TI"
]);

echo "Funcionário cadastrado!";
?>
```

## 18.6 Buscando dados com query simples

Use `query` quando não há parâmetros do usuário.

```php
<?php
$stmt = $pdo->query("SELECT * FROM funcionario ORDER BY nome");
$funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($funcionarios as $funcionario) {
    echo $funcionario["nome"] . " - " . $funcionario["cargo"] . "<br>";
}
?>
```

## 18.7 Buscando dados com parâmetros

Use `prepare` quando a consulta depende de entrada do usuário.

```php
<?php
$departamento = "TI";

$sql = "SELECT * FROM funcionario WHERE departamento = :departamento";
$stmt = $pdo->prepare($sql);
$stmt->execute([":departamento" => $departamento]);

$resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($resultado as $funcionario) {
    echo $funcionario["nome"] . "<br>";
}
?>
```

## 18.8 Atualizando dados

```php
<?php
$sql = "UPDATE funcionario
        SET salario = :salario
        WHERE id = :id";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    ":salario" => 4200.00,
    ":id" => 1
]);

echo "Salário atualizado!";
?>
```

## 18.9 Excluindo dados

```php
<?php
$sql = "DELETE FROM funcionario WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([":id" => 1]);

echo "Funcionário removido!";
?>
```

## 18.10 Por que prepared statements são importantes?

Porque eles separam:

- a estrutura do SQL;
- os dados enviados pelo usuário.

Errado:

```php
$sql = "SELECT * FROM usuario WHERE email = '$email' AND senha = '$senha'";
```

Certo:

```php
$sql = "SELECT * FROM usuario WHERE email = :email AND senha = :senha";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    ":email" => $email,
    ":senha" => $senha
]);
```

---

# 19. Projeto prático: CRUD de funcionários em PHP + MySQL

CRUD significa:

- **Create**: criar;
- **Read**: ler/listar;
- **Update**: atualizar;
- **Delete**: excluir.

Vamos criar um sistema simples de cadastro de funcionários.

## 19.1 Banco de dados

Execute no MySQL:

```sql
CREATE DATABASE aula_php_bd
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE aula_php_bd;

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO funcionarios (nome, cargo, salario, departamento) VALUES
('Ana Silva', 'Desenvolvedora', 3500.00, 'TI'),
('Bruno Souza', 'Analista de Dados', 4200.00, 'Dados'),
('Carla Lima', 'Designer', 2800.00, 'Marketing');
```

## 19.2 Estrutura do projeto

```text
crud-funcionarios/
│
├── config/
│   └── conexao.php
│
├── index.php
├── criar.php
├── salvar.php
├── editar.php
├── atualizar.php
└── excluir.php
```

## 19.3 Arquivo `config/conexao.php`

```php
<?php
$host = "localhost";
$banco = "aula_php_bd";
$usuario = "root";
$senha = "";

$dsn = "mysql:host=$host;dbname=$banco;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $usuario, $senha);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Erro ao conectar com o banco: " . $e->getMessage());
}
```

## 19.4 Arquivo `index.php`: listar funcionários

```php
<?php
require_once "config/conexao.php";

$stmt = $pdo->query("SELECT * FROM funcionarios ORDER BY id DESC");
$funcionarios = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Funcionários</title>
</head>
<body>
    <h1>Funcionários</h1>

    <a href="criar.php">Cadastrar novo funcionário</a>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Cargo</th>
            <th>Salário</th>
            <th>Departamento</th>
            <th>Ações</th>
        </tr>

        <?php foreach ($funcionarios as $funcionario): ?>
            <tr>
                <td><?= htmlspecialchars($funcionario["id"]) ?></td>
                <td><?= htmlspecialchars($funcionario["nome"]) ?></td>
                <td><?= htmlspecialchars($funcionario["cargo"]) ?></td>
                <td>R$ <?= number_format($funcionario["salario"], 2, ",", ".") ?></td>
                <td><?= htmlspecialchars($funcionario["departamento"]) ?></td>
                <td>
                    <a href="editar.php?id=<?= $funcionario["id"] ?>">Editar</a>
                    <a href="excluir.php?id=<?= $funcionario["id"] ?>"
                       onclick="return confirm('Tem certeza que deseja excluir?')">
                       Excluir
                    </a>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
```

## 19.5 Arquivo `criar.php`: formulário de cadastro

```php
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Funcionário</title>
</head>
<body>
    <h1>Cadastrar funcionário</h1>

    <form method="post" action="salvar.php">
        <label>Nome:</label><br>
        <input type="text" name="nome" required><br><br>

        <label>Cargo:</label><br>
        <input type="text" name="cargo" required><br><br>

        <label>Salário:</label><br>
        <input type="number" step="0.01" name="salario" required><br><br>

        <label>Departamento:</label><br>
        <input type="text" name="departamento" required><br><br>

        <button type="submit">Salvar</button>
    </form>

    <br>
    <a href="index.php">Voltar</a>
</body>
</html>
```

## 19.6 Arquivo `salvar.php`: inserir no banco

```php
<?php
require_once "config/conexao.php";

$nome = trim($_POST["nome"] ?? "");
$cargo = trim($_POST["cargo"] ?? "");
$salario = $_POST["salario"] ?? 0;
$departamento = trim($_POST["departamento"] ?? "");

if ($nome === "" || $cargo === "" || $salario <= 0 || $departamento === "") {
    die("Preencha todos os campos corretamente.");
}

$sql = "INSERT INTO funcionarios (nome, cargo, salario, departamento)
        VALUES (:nome, :cargo, :salario, :departamento)";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    ":nome" => $nome,
    ":cargo" => $cargo,
    ":salario" => $salario,
    ":departamento" => $departamento
]);

header("Location: index.php");
exit;
```

## 19.7 Arquivo `editar.php`: buscar e exibir formulário

```php
<?php
require_once "config/conexao.php";

$id = $_GET["id"] ?? null;

if (!$id) {
    die("ID não informado.");
}

$stmt = $pdo->prepare("SELECT * FROM funcionarios WHERE id = :id");
$stmt->execute([":id" => $id]);
$funcionario = $stmt->fetch();

if (!$funcionario) {
    die("Funcionário não encontrado.");
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Funcionário</title>
</head>
<body>
    <h1>Editar funcionário</h1>

    <form method="post" action="atualizar.php">
        <input type="hidden" name="id" value="<?= htmlspecialchars($funcionario["id"]) ?>">

        <label>Nome:</label><br>
        <input type="text" name="nome" value="<?= htmlspecialchars($funcionario["nome"]) ?>" required><br><br>

        <label>Cargo:</label><br>
        <input type="text" name="cargo" value="<?= htmlspecialchars($funcionario["cargo"]) ?>" required><br><br>

        <label>Salário:</label><br>
        <input type="number" step="0.01" name="salario" value="<?= htmlspecialchars($funcionario["salario"]) ?>" required><br><br>

        <label>Departamento:</label><br>
        <input type="text" name="departamento" value="<?= htmlspecialchars($funcionario["departamento"]) ?>" required><br><br>

        <button type="submit">Atualizar</button>
    </form>

    <br>
    <a href="index.php">Voltar</a>
</body>
</html>
```

## 19.8 Arquivo `atualizar.php`: atualizar no banco

```php
<?php
require_once "config/conexao.php";

$id = $_POST["id"] ?? null;
$nome = trim($_POST["nome"] ?? "");
$cargo = trim($_POST["cargo"] ?? "");
$salario = $_POST["salario"] ?? 0;
$departamento = trim($_POST["departamento"] ?? "");

if (!$id || $nome === "" || $cargo === "" || $salario <= 0 || $departamento === "") {
    die("Dados inválidos.");
}

$sql = "UPDATE funcionarios
        SET nome = :nome,
            cargo = :cargo,
            salario = :salario,
            departamento = :departamento
        WHERE id = :id";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    ":nome" => $nome,
    ":cargo" => $cargo,
    ":salario" => $salario,
    ":departamento" => $departamento,
    ":id" => $id
]);

header("Location: index.php");
exit;
```

## 19.9 Arquivo `excluir.php`: excluir do banco

```php
<?php
require_once "config/conexao.php";

$id = $_GET["id"] ?? null;

if (!$id) {
    die("ID não informado.");
}

$stmt = $pdo->prepare("DELETE FROM funcionarios WHERE id = :id");
$stmt->execute([":id" => $id]);

header("Location: index.php");
exit;
```

## 19.10 Como rodar o projeto

Entre na pasta do projeto pelo terminal:

```bash
cd crud-funcionarios
```

Rode:

```bash
php -S localhost:8000
```

Acesse:

```text
http://localhost:8000
```

---

# 20. Exemplos resolvidos

## Exemplo resolvido 1: formulário que cumprimenta o usuário

### Problema

Crie uma página PHP que peça o nome do usuário e, ao enviar, mostre uma mensagem de boas-vindas.

### Solução

Arquivo `boas-vindas.php`:

```php
<?php
$nome = $_POST["nome"] ?? null;
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Boas-vindas</title>
</head>
<body>

<?php if ($nome): ?>
    <h1>Bem-vindo, <?= htmlspecialchars($nome) ?>!</h1>
<?php else: ?>
    <form method="post">
        <label>Digite seu nome:</label>
        <input type="text" name="nome" required>
        <button type="submit">Enviar</button>
    </form>
<?php endif; ?>

</body>
</html>
```

### Explicação

- `$_POST["nome"]` recebe o valor enviado pelo formulário.
- `?? null` evita erro caso o formulário ainda não tenha sido enviado.
- `htmlspecialchars` protege a saída HTML.
- O `if` decide se mostra o formulário ou a saudação.

---

## Exemplo resolvido 2: array associativo de disciplinas e professores

### Problema

Crie um array associativo em que a chave é a disciplina e o valor é o professor. Depois, exiba tudo em uma tabela HTML.

### Solução

```php
<?php
$ensinar = [
    "Banco de Dados" => "Silva",
    "Sistemas Operacionais" => "Carrick",
    "Grafos" => "Kam",
    "Mineração de Dados" => "Benson"
];
?>

<table border="1" cellpadding="8">
    <tr>
        <th>Disciplina</th>
        <th>Professor</th>
    </tr>

    <?php foreach ($ensinar as $disciplina => $professor): ?>
        <tr>
            <td><?= htmlspecialchars($disciplina) ?></td>
            <td><?= htmlspecialchars($professor) ?></td>
        </tr>
    <?php endforeach; ?>
</table>
```

### Explicação

- O array é associativo porque usa `disciplina => professor`.
- O `foreach` percorre chave e valor.
- A tabela é gerada dinamicamente.

---

## Exemplo resolvido 3: função que localiza professor por disciplina

### Problema

Crie uma função que receba o nome de uma disciplina e retorne qual professor leciona essa disciplina.

### Solução

```php
<?php
function professorDisciplina($disciplina, $atividadesEnsino) {
    if (array_key_exists($disciplina, $atividadesEnsino)) {
        $professor = $atividadesEnsino[$disciplina];
        return "$professor está lecionando $disciplina";
    }

    return "Não existe a disciplina $disciplina";
}

$ensinar = [
    "Banco de Dados" => "Silva",
    "SO" => "Carrick",
    "Grafos" => "Kam"
];

echo professorDisciplina("Banco de Dados", $ensinar);
echo "<br>";
echo professorDisciplina("Arquitetura de Computadores", $ensinar);
?>
```

### Saída esperada

```text
Silva está lecionando Banco de Dados
Não existe a disciplina Arquitetura de Computadores
```

---

## Exemplo resolvido 4: buscar funcionários por departamento

### Problema

Criar um formulário para digitar o departamento e listar funcionários desse departamento.

### Banco usado

Tabela:

```sql
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    departamento VARCHAR(100)
);
```

### Solução

Arquivo `buscar_departamento.php`:

```php
<?php
require_once "config/conexao.php";

$departamento = $_GET["departamento"] ?? "";
$funcionarios = [];

if ($departamento !== "") {
    $sql = "SELECT * FROM funcionarios WHERE departamento = :departamento ORDER BY nome";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([":departamento" => $departamento]);
    $funcionarios = $stmt->fetchAll();
}
?>

<form method="get">
    <label>Departamento:</label>
    <input type="text" name="departamento" value="<?= htmlspecialchars($departamento) ?>">
    <button type="submit">Buscar</button>
</form>

<?php if ($departamento !== ""): ?>
    <h2>Resultado para: <?= htmlspecialchars($departamento) ?></h2>

    <?php if (count($funcionarios) > 0): ?>
        <ul>
            <?php foreach ($funcionarios as $f): ?>
                <li>
                    <?= htmlspecialchars($f["nome"]) ?> -
                    <?= htmlspecialchars($f["cargo"]) ?> -
                    R$ <?= number_format($f["salario"], 2, ",", ".") ?>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>Nenhum funcionário encontrado.</p>
    <?php endif; ?>
<?php endif; ?>
```

### Explicação

- Foi usado `GET` porque é uma busca.
- O parâmetro `:departamento` evita SQL injection.
- `fetchAll` retorna todos os funcionários encontrados.

---

## Exemplo resolvido 5: reajustar salário por percentual

### Problema

Criar uma página que receba o ID do funcionário e um percentual de reajuste. Depois, atualize o salário.

### Solução

```php
<?php
require_once "config/conexao.php";

$mensagem = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $id = $_POST["id"] ?? null;
    $percentual = $_POST["percentual"] ?? 0;

    if ($id && $percentual > 0) {
        $sql = "UPDATE funcionarios
                SET salario = salario + (salario * :percentual / 100)
                WHERE id = :id";

        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ":percentual" => $percentual,
            ":id" => $id
        ]);

        $mensagem = "Salário reajustado com sucesso.";
    } else {
        $mensagem = "Informe dados válidos.";
    }
}
?>

<form method="post">
    <label>ID do funcionário:</label>
    <input type="number" name="id" required>

    <label>Percentual:</label>
    <input type="number" step="0.01" name="percentual" required>

    <button type="submit">Reajustar</button>
</form>

<p><?= htmlspecialchars($mensagem) ?></p>
```

### Explicação

O cálculo é feito no próprio SQL:

```sql
salario = salario + (salario * percentual / 100)
```

Se o salário era 3000 e o percentual é 10, o novo salário será:

```text
3000 + (3000 * 10 / 100) = 3300
```

---

# 21. Exercícios com gabarito

## Exercício 1

Explique, com suas palavras, o que é divergência de impedância.

### Gabarito

Divergência de impedância é a diferença entre a forma como o banco de dados representa informações e a forma como a linguagem de programação representa informações. O banco relacional retorna dados em tabelas, linhas e colunas, enquanto a linguagem usa variáveis, arrays, objetos e outros tipos. Por isso, o resultado de uma consulta precisa ser convertido para uma estrutura que a linguagem consiga manipular.

---

## Exercício 2

Qual é a sequência típica de interação de um programa com o banco de dados?

### Gabarito

1. Abrir conexão.
2. Informar servidor, banco, usuário e senha.
3. Enviar consultas ou atualizações SQL.
4. Receber e tratar resultados.
5. Fechar conexão.

---

## Exercício 3

O que é um cursor e por que ele é necessário?

### Gabarito

Cursor é um ponteiro para percorrer o resultado de uma consulta linha por linha. Ele é necessário quando a consulta retorna várias tuplas, pois o programa precisa buscar uma linha por vez e copiar seus valores para variáveis ou estruturas da linguagem.

---

## Exercício 4

Crie um formulário PHP que receba nome e idade e mostre a mensagem:

```text
Nome: Ana
Idade: 20 anos
```

### Gabarito

```php
<?php
$nome = $_POST["nome"] ?? null;
$idade = $_POST["idade"] ?? null;
?>

<form method="post">
    <label>Nome:</label>
    <input type="text" name="nome" required>

    <label>Idade:</label>
    <input type="number" name="idade" required>

    <button type="submit">Enviar</button>
</form>

<?php if ($nome && $idade): ?>
    <p>Nome: <?= htmlspecialchars($nome) ?></p>
    <p>Idade: <?= htmlspecialchars($idade) ?> anos</p>
<?php endif; ?>
```

---

## Exercício 5

Crie um array associativo com três produtos e seus preços. Depois, exiba cada produto e preço.

### Gabarito

```php
<?php
$produtos = [
    "Mouse" => 50.00,
    "Teclado" => 120.00,
    "Monitor" => 900.00
];

foreach ($produtos as $produto => $preco) {
    echo $produto . " - R$ " . number_format($preco, 2, ",", ".") . "<br>";
}
?>
```

---

## Exercício 6

Crie uma função chamada `calcularMedia` que receba três notas e retorne a média.

### Gabarito

```php
<?php
function calcularMedia($n1, $n2, $n3) {
    return ($n1 + $n2 + $n3) / 3;
}

echo calcularMedia(8, 7, 9); // 8
?>
```

---

## Exercício 7

Crie uma consulta PHP com PDO para listar todos os funcionários da tabela `funcionarios`.

### Gabarito

```php
<?php
require_once "config/conexao.php";

$stmt = $pdo->query("SELECT * FROM funcionarios ORDER BY nome");
$funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($funcionarios as $funcionario) {
    echo $funcionario["nome"] . " - " . $funcionario["cargo"] . "<br>";
}
?>
```

---

## Exercício 8

Crie uma consulta PHP com PDO que busque funcionários por cargo usando prepared statement.

### Gabarito

```php
<?php
require_once "config/conexao.php";

$cargo = $_GET["cargo"] ?? "";

$sql = "SELECT * FROM funcionarios WHERE cargo = :cargo ORDER BY nome";
$stmt = $pdo->prepare($sql);
$stmt->execute([":cargo" => $cargo]);

$funcionarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($funcionarios as $funcionario) {
    echo htmlspecialchars($funcionario["nome"]) . "<br>";
}
?>
```

---

## Exercício 9

Crie um código PHP para inserir um funcionário com nome, cargo, salário e departamento recebidos por formulário.

### Gabarito

```php
<?php
require_once "config/conexao.php";

$nome = trim($_POST["nome"] ?? "");
$cargo = trim($_POST["cargo"] ?? "");
$salario = $_POST["salario"] ?? 0;
$departamento = trim($_POST["departamento"] ?? "");

if ($nome === "" || $cargo === "" || $salario <= 0 || $departamento === "") {
    die("Dados inválidos.");
}

$sql = "INSERT INTO funcionarios (nome, cargo, salario, departamento)
        VALUES (:nome, :cargo, :salario, :departamento)";

$stmt = $pdo->prepare($sql);
$stmt->execute([
    ":nome" => $nome,
    ":cargo" => $cargo,
    ":salario" => $salario,
    ":departamento" => $departamento
]);

echo "Funcionário cadastrado com sucesso.";
?>
```

---

## Exercício 10

Explique a diferença entre `query` e `prepare` no PDO.

### Gabarito

`query` executa diretamente uma instrução SQL e é indicado quando a consulta não depende de dados enviados pelo usuário. `prepare` prepara uma instrução com parâmetros e depois executa com valores separados, sendo mais seguro para entradas do usuário e ajudando a evitar SQL injection.

---

## Exercício 11

Crie um código PHP para excluir um funcionário pelo ID recebido via GET.

### Gabarito

```php
<?php
require_once "config/conexao.php";

$id = $_GET["id"] ?? null;

if (!$id) {
    die("ID não informado.");
}

$sql = "DELETE FROM funcionarios WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute([":id" => $id]);

echo "Funcionário excluído.";
?>
```

---

## Exercício 12

Crie uma função PHP que receba um salário e retorne:

- `BAIXO`, se for menor que 2500;
- `MEDIO`, se for entre 2500 e 5000;
- `ALTO`, se for maior que 5000.

### Gabarito

```php
<?php
function classificarSalario($salario) {
    if ($salario < 2500) {
        return "BAIXO";
    } elseif ($salario <= 5000) {
        return "MEDIO";
    } else {
        return "ALTO";
    }
}

echo classificarSalario(3200); // MEDIO
?>
```

---

# Referências usadas como base

- Videoaula 8a — Técnicas de Programação para Bancos de Dados, Prof. Denilson Alves Pereira.
- Videoaula 8b — Programação para Bancos de Dados usando PHP, Prof. Denilson Alves Pereira.
- Slides `gcc214-slides-8-programacao-bd.pdf`, DCC-UFLA.
- Manual oficial do PHP: PDO, prepared statements, `query`, `execute`, `fetch` e `fetchAll`.
- Documentação do Visual Studio Code sobre PHP e depuração.

