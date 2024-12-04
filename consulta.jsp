<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <style>
    body {
        display: flex;
        font-family: Arial, sans-serif;
        justify-content: space-between;
        margin: 0;
        padding: 0;
        display: flex;
        min-height: 200vh;
        background-image: url('img/ft-prato.png');
        background-size: cover;
        
        color: #333;
    }
    .espaco{
        width: 20%;
        height: 100%;
    }
    nav{
        position: fixed;
        width: 20%;
        height: 100%;
        background: #c4c3c3;
        box-shadow: 1px 0px 15px #000;
    }
    nav ul{
        margin: 0px;
        padding: 0px;
    }
    nav ul li a{
        padding: 0px ;
    }
    nav ul li{
        text-transform: uppercase;
        font-weight: 700;
        font-size: 13px;
        text-align: center;
        list-style: none;
        padding: 20px;
        transition: 0.5s;
    }
    nav ul li:hover{
        background: #b1b1b1;
    }

    .bd{
        font-family: "Bebas Neue", sans-serif;
        letter-spacing: 3px;
        font-size: 25px;
        background: #97c78b;
        border-bottom: 1px solid #000;
    }
    .bd a{
        color: #0d160b;
        padding: 0px;
        width: 100%;
    }
    nav ul li:hover:nth-child(1){
        background: #97c78b;
    }
    .div1{
        display:flex;
        flex-direction: column;
        margin-left: 30px;
    }
    .div2{
        margin: 20px 0px;
    }
    h1{
        color: #fff;
        text-shadow: 0 0 10px #1b8d05;
        text-transform: uppercase;
    }
    table, th, td{
        font-family: "Arial";
        background: #fff;
        border-collapse:collapse;
        padding: 10px;
        text-align: left;
        border: 1px solid #000;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    thead tr td{
        font-weight: 700;
        background: #c0c0c0;
        text-align: center;
    }
    div ul{
        display: flex;
        flex-direction: column;
    }
    div ul li{
        margin: 20px 25px;
    }
    li::marker{
        font-size: 20px;
    }
    li a{
        text-decoration: none;
        color: #000;
        padding: 0px;
    }
    .pk{
        background-color: #fff5cc; 
    }
    .fk{
        background-color: #95c1da;
    }
    .status1::marker{
        color: red;
    }
    .status2::marker{
        color: orange;
    }
    .status3::marker{
        color: green;
    }
    .status4::marker{
        color: yellow;
    }
    .status5::marker{
        color: blue;
    }
    .pendente {
        background-color: #ffcccc;
    }
    .concluido {
        background-color: #ccffcc; 
    }
    .em-andamento {
        background-color: #fff5cc; 
    }

    .info li{
        color: #fff;
    }
    .sel{
        border-left: 5px solid #428032;
    }
    </style>
</head>
<body>
    <%
    String database = "cestabasica";
    String enderecoDB = "jdbc:mysql://localhost:3306/" + database + "?useUnicode=true&characterEncoding=UTF-8";
    String usuarioDB = "root";
    String senhaDB = "";

    String driver = "com.mysql.jdbc.Driver"; 
    Class.forName(driver); 
    Connection conexao = DriverManager.getConnection(enderecoDB, usuarioDB, senhaDB);

    String sql = "SELECT * FROM cestasbasicas";

    PreparedStatement stm = conexao.prepareStatement(sql);

    out.print("<nav>");
        out.print("<ul>");
            out.print("<li class='bd'><a href='#'>Banco de Dados</a></li>");
            out.print("<li><a href='usuarios.jsp'>Usuários</a></li>");
            out.print("<li><a href='enderecos.jsp'>Endereços</a></li>");
            out.print("<li class='sel'><a href='consulta.jsp'>Pedidos</a></li>");
            out.print("<li><a href='http://localhost:8080/cesta/index.html'>Ir para o site</a></li>");
        out.print("</ul>");
    out.print("</nav>");


    out.print("<div class='espaco'>");
    out.print("</div>");
    out.print("<div class= 'div1'>");
    ResultSet dados = stm.executeQuery();
    out.print("<div class= 'div2'>");
    out.print("<header>");
        out.print("<h1>#PEDIDOS</h1>");
    out.print("</header>");
    out.print("</div>");
    out.print("<table>");
        out.print("<thead>"); 
            out.print("<tr>");
                out.print("<td class= 'pk'>Código</td>");
                out.print("<td class= 'fk'>Usuário</td>");
                out.print("<td class= 'fk'>Endereço</td>");
                out.print("<td>Data do pedido</td>");
                out.print("<td>Situação</td>");
            out.print("</tr>");
        out.print("</thead>");
    while( dados.next() ) 
    {
        String situacao = dados.getString("Situacao").toLowerCase();
        String corClasse = "";
        if("pendente".equals(situacao)){
            corClasse = "pendente";
        }else if ("concluida".equals(situacao)){
            corClasse = "concluido";
        }else if ("em andamento".equals(situacao)){
            corClasse = "em-andamento";
        }

        out.print("<tr>");
            out.print("<td>");
                 out.print(dados.getString("id_cesta"));
            out.print("</td>");

            out.print("<td>");
                out.print(dados.getString("id_usuario"));
            out.print("</td>");
           
            out.print("<td>");
                out.print(dados.getString("id_endereco"));
            out.print("</td>");
            
            out.print("<td>");
                out.print(dados.getString("dataDistribuicao"));
            out.print("</td>");
            
            out.print("<td class = '" + corClasse +"'>");
                out.print(dados.getString("Situacao"));
            out.print("</td>");

        out.print("</tr>");
    }
    out.print("</table>");
    out.print("</div>");
    out.print("<div class='div3'>");
    out.print("<ul class='info'>");
        out.print("<li class='status1'>Pedido não aceito</li>");
        out.print("<li class='status2'>Está sendo Processado</li>");
        out.print("<li class='status3'>Pedido Entregue</li>");
        out.print("<li class='status4'>Chave Primária</li>");
        out.print("<li class='status5'>Chave estrangeira</li>");
    out.print("</ul>");
    out.print("</div>");
    %>
</body>
</html>