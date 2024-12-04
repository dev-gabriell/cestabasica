<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<%
    // Configura o encoding da requisição
    request.setCharacterEncoding("UTF-8");

    // Variáveis que armazenam as informações
    String nome = request.getParameter("txtTexto");
    String sobrenome = request.getParameter("txtTexto2");
    String endereco = request.getParameter("txtTexto3");
    String num = request.getParameter("txtn");
    String referencia = request.getParameter("txtTexto4");
    String email = request.getParameter("txtTexto5");
    String numero = request.getParameter("txtNumber");
    String mensagem = request.getParameter("txtTexto6");

    // Acessar banco de dados
    String database = "cestabasica";
    String enderecoDB = "jdbc:mysql://localhost:3306/" + database + "?useUnicode=true&characterEncoding=UTF-8";
    String usuarioDB = "root";
    String senhaDB = "";

    // Driver
    String driver = "com.mysql.jdbc.Driver"; 
    Class.forName(driver); 

    // Cria a variável para conectar com o banco
    Connection conexao = DriverManager.getConnection(enderecoDB, usuarioDB, senhaDB);

    String mensagemResposta = "";
    try {
        // Dados da tabela endereços
        String sqlEndereco = "INSERT INTO enderecos (endereco, referencia, numero) VALUES (?, ?, ?)";
        PreparedStatement stmEndereco = conexao.prepareStatement(sqlEndereco, Statement.RETURN_GENERATED_KEYS);
        stmEndereco.setString(1, endereco);
        stmEndereco.setString(2, referencia);
        stmEndereco.setString(3, num);
        stmEndereco.executeUpdate();

        // Recupera o ID do endereço recém-inserido
        ResultSet rsEndereco = stmEndereco.getGeneratedKeys();
        int enderecoId = 0;
        if (rsEndereco.next()) {
            enderecoId = rsEndereco.getInt(1);
        }
        stmEndereco.close();

        // Dados da tabela usuários
        String sqlUsuario = "INSERT INTO usuarios (nome, endereco_id, sobrenome, email, telefone, mensagem ) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement stmUsuario = conexao.prepareStatement(sqlUsuario);
        stmUsuario.setString(1, nome);
        stmUsuario.setInt(2, enderecoId);
        stmUsuario.setString(3, sobrenome);
        stmUsuario.setString(4, email);
        stmUsuario.setString(5, numero);
        stmUsuario.setString(6, mensagem);
        stmUsuario.executeUpdate();
        stmUsuario.close();

        mensagemResposta = "Seus dados foram enviados com sucesso!";
    } catch (Exception e) {
        mensagemResposta = "Erro ao gravar os dados: " + e.getMessage();
    } finally {
        conexao.close();
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmação de Envio</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f9f9f9;
            color: #333;
        }
        .container {
            text-align: center;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
        }
        .container h1 {
            color: #4CAF50;
        }
        .container p {
            margin: 20px 0;
        }
        .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
            transition: 0.5s ease-in-out
        }
        .button:hover {
            background-color: #006400;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><%= mensagemResposta %></h1>
        <p>Obrigado, <strong><%= nome %> <%= sobrenome %></strong>, por enviar suas informações.</p>
        <a href="index.html" class="button">Voltar ao início</a>
    </div>
</body>
</html>