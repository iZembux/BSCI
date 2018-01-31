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

function mostrarLimites(url, anio, val_resul) {
//    alert("DENTRO DE LA FUNCION mostrarLimites:)!!!");
    var elemento = document.getElementById(val_resul);
    var anioDepende = document.getElementById(anio);
    var anioValue = anioDepende.value;
    var fragment_url = url + "?anioLimites=" + anioValue;
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

function calcularIsan(url, modelo, tipo, calcularX, precio, val_resul) {
//    alert("DENTRO DE LA FUNCION mostrarModelos:)!!!");
    var elemento = document.getElementById(val_resul);
    var modeloDepende = document.getElementById(modelo);
    var modeloValue = modeloDepende.value; //alert("MODELO: " + modeloValue);
    var tipoDepende = document.getElementById(tipo);
    var tipoValue = tipoDepende.value; 
    //var tipoValue = "";
    /*for(var i = 0; i < tipoDepende.length; i ++){
        if(tipoDepende[i].checked){
            tipoValue = tipoDepende[i].value;
        }
    }*/
    //alert("TIPO: " + tipoValue);
    var calcularXDepende = document.getElementById(calcularX);
    var calcularXValue = calcularXDepende.value; //alert("CACULAR X: " + calcularXValue);
    var precioDepende = document.getElementById(precio);
    var precioValue = precioDepende.value;  //alert("PRECIO: " + precioValue);
    var fragment_url = url + "?anio=" + modeloValue + "&tipo=" + tipoValue + "&calcularX=" + calcularXValue + "&valorUnidad=" + precioValue;
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

function capturar(){
    var resultado = "ninguno";
    var porNombre = document.getElementsByName("deacuerdo");
    // Recorremos todos los valores del radio button para encontrar el seleccionado
    for (var i = 0; i < porNombre.length; i++){
        if (porNombre[i].checked)
            resultado = porNombre[i].value;
    }
    document.getElementById("resultado").innerHTML = " \
            Por Nombre: " + resultado;
}