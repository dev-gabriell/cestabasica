function validar(){
    limpar()
    let enviar = true;
    let nome = document.getElementById('txtTexto').value;
    let sobrenome = document.getElementById('txtTexto2').value;
    let end = document.getElementById('txtTexto3').value;
    let num = document.getElementById('txtn').value;
    let email = document.getElementById('txtTexto5').value;
    let numero = document.getElementById('num').value;
    let txt = document.getElementById('txtTexto6').value; 

    if(nome.length == 0){
        enviar = false;
        document.getElementById('txtTexto').placeholder = "Campo obrigatório*: "
        document.getElementById('txtTexto').style.backgroundColor = "#FA8072"
        document.getElementById('txtTexto').style.border = "1px solid red"
    }
    if(sobrenome.length == 0){
        enviar = false;
        document.getElementById('txtTexto2').placeholder = "Campo obrigatório*: "
        document.getElementById('txtTexto2').style.backgroundColor = "#FA8072"
        document.getElementById('txtTexto2').style.border = "1px solid red"
    }
    if(end.length == 0){
        enviar = false;
        document.getElementById('txtTexto3').placeholder = "Campo obrigatório*: "
        document.getElementById('txtTexto3').style.backgroundColor = "#FA8072"
        document.getElementById('txtTexto3').style.border = "1px solid red"
    }
    if(num.length == 0){
        enviar = false;
        document.getElementById('txtn').placeholder = "obrigatório*: "
        document.getElementById('txtn').style.backgroundColor = "#FA8072"
        document.getElementById('txtn').style.border = "1px solid red"
    }
    if(email.indexOf("@") < 0){
        enviar = false;
        document.getElementById('txtTexto5').placeholder = "Campo obrigatório*: "
        document.getElementById('txtTexto5').style.backgroundColor = "#FA8072"
        document.getElementById('txtTexto5').style.border = "1px solid red"
    }
    if(numero.length < 11){
        enviar = false;
        document.getElementById('num').placeholder = "Campo obrigatório*: "
        document.getElementById('num').style.backgroundColor = "#FA8072"
        document.getElementById('num').style.border = "1px solid red"
    }
    if(txt.length == 0){
        enviar = false;
        document.getElementById('txtTexto6').placeholder = "Por favor, digite um pouco*: "
        document.getElementById('txtTexto6').style.backgroundColor = "#FA8072"
        document.getElementById('txtTexto6').style.border = "1px solid red"
    }

    if(enviar == true){
        document.form1.submit()
    }
}

function limpar(){

    //NOME
    document.getElementById('txtTexto').style.backgroundColor = "#fff"
    document.getElementById('txtTexto').style.border = "none"

    //SOBRENOME
    document.getElementById('txtTexto2').style.backgroundColor = "#fff"
    document.getElementById('txtTexto2').style.border = "none"

    //ENDEREÇO
    document.getElementById('txtTexto3').style.backgroundColor = "#fff"
    document.getElementById('txtTexto3').style.border = "none"

    //EMAIL
    document.getElementById('txtTexto5').style.backgroundColor = "#fff"
    document.getElementById('txtTexto5').style.border = "none"

    //NUMERO
    document.getElementById('num').style.backgroundColor = "#fff"
    document.getElementById('num').style.border = "none"

    //MENSAGEM
    document.getElementById('txtTexto6').style.backgroundColor = "#fff"
    document.getElementById('txtTexto6').style.border = "none"

}