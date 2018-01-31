/*PETICIONES EN AJAX*/
var peticion = false;
var testPasado = false;
try {
    peticion = new XMLHttpRequest();
} catch (trymicrosoft) {
    try {
        peticion = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (othermicrosoft) {
        try {
            peticion = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (failed) {
            peticion = false;
        }
    }
}


function mostrarFrame(url, val_resul) {
    //alert("DENTRO DE LA FUNCION mostrarFrame :)!!!");
    var elemento = document.getElementById(val_resul);
    var fragment_url = url;
    //alert(fragment_url);
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
}

function mensaje(msj) {
    alert(msj);
}

function mensajeRetorno(msj, retorno, div) {
    alert(msj);
    //alert(retorno);
    mostrarFrame(retorno, div);
}

function cambiarMensaje(msg) {
    alert("MENSAJE" + msg);
    var status = document.getElementById('status');
    status.innerHTML = ""+msg;
    var finalMessage = document.getElementById('finalMessage');
    finalMessage.innerHTML = "Process is complete";
}


function mostrarModelos(url, marca, val_resul) {
//    alert("DENTRO DE LA FUNCION mostrarModelos:)!!!");
    var elemento = document.getElementById(val_resul);
    var marcaDepende = document.getElementById(marca);
    var marcaValue = marcaDepende.value;
    var fragment_url = url+"?identificaMarca="+marcaValue;
//    alert(fragment_url);
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
}

function mostrarVersiones(url, modelo, val_resul) {
//    alert("DENTRO DE LA FUNCION mostrarModelos:)!!!");
    var elemento = document.getElementById(val_resul);
    var modeloDepende = document.getElementById(modelo);
    var modeloValue = modeloDepende.value;
//    alert("MODELO: " + modeloValue);
    var fragment_url = url+"&idModelo="+modeloValue;
//    alert(fragment_url);
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
}

function mostrarAnios(url, version, val_resul) {
//    alert("DENTRO DE LA FUNCION mostrarModelos:)!!!");
    var elemento = document.getElementById(val_resul);
    var versionDepende = document.getElementById(version);
    var versionValue = versionDepende.value;
//    alert("MODELO: " + modeloValue);
    var fragment_url = url+"&version="+versionValue;
//    alert(fragment_url);
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
}

function mostrarUnidad(url, unidad, val_resul) {
//    alert("DENTRO DE LA FUNCION mostrarModelos:)!!!");
    var elemento = document.getElementById(val_resul);
    var unidadDepende = document.getElementById(unidad);
    var unidadValue = unidadDepende.value;
//    alert("MODELO: " + modeloValue);
    var fragment_url = url+"&idUnidad="+unidadValue;
//    alert(fragment_url);
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
}