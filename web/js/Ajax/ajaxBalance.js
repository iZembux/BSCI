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

function mensaje(msj) {
    alert(msj);
}

function mensajeRetorno(msj, retorno, div) {
    alert(msj);
    //alert(retorno);
    mostrarFrame(retorno, div);
}

function cambiarMensaje(msg) {
    alert("MENSAJE");
    alert("MENSAJE" + msg);
    var status = document.getElementById('status');
    status.innerHTML = ""+msg;
    var finalMessage = document.getElementById('finalMessage');
    finalMessage.innerHTML = "Process is complete";
}

function mostrarFrame(url, val_resul) {
    alert("DENTRO DE LA FUNCION mostrarFrame :)!!!");
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

function mostrarIncurrido(url, empresa, departamento, area, mes, anio, val_resul) {
    //alert("DENTRO DE LA FUNCION mostrarIncurrido :)!!!");
    var elemento = document.getElementById(val_resul);
    var empresaDepende = document.getElementById(empresa);
    var empresaValue = empresaDepende.value; //alert("empresaValue: " +  empresaValue);
    var departamentoDepende = document.getElementById(departamento);
    var departamentoValue = departamentoDepende.value; //alert("departamentoValue: " +  departamentoValue);
    var areaDepende = document.getElementById(area);
    var areaValue = areaDepende.value; //alert("areaValue: " +  areaValue);
    var mesDepende = document.getElementById(mes);
    var mesValue = mesDepende.value; //alert("mesValue: " +  mesValue);
    var anioDepende = document.getElementById(anio);
    var anioValue = anioDepende.value; //alert("anioValue: " +  anioValue);
    var fragment_url = url + "?unidadNegocio=" + empresaValue + "&identificaDepartamento=" + departamentoValue + "&identificaArea=" + areaValue + "&mes=" + mesValue + "&anio=" + anioValue;
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


function actualizarIncurrido(url, idIncurrido, anio, enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre, val_resul) {
    alert("DENTRO DE LA FUNCION actualizarIncurrido archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    var eneroDepende = document.getElementById(enero);
    var eneroValue = eneroDepende.value; alert("enero " + enero);
    var febreroDepende = document.getElementById(febrero);
    var febreroValue = febreroDepende.value; alert("febrero " + febrero);
    var marzoDepende = document.getElementById(marzo);
    var marzoValue = marzoDepende.value; alert("marzo " + marzo);
    var abrilDepende = document.getElementById(abril);
    var abrilValue = abrilDepende.value; alert("abril " + abril);
    var mayoDepende = document.getElementById(mayo);
    var mayoValue = mayoDepende.value; alert("mayo " + mayo);
    var junioDepende = document.getElementById(junio);
    var junioValue = junioDepende.value; alert("junio " + junio);
    var julioDepende = document.getElementById(julio);
    var julioValue = julioDepende.value; alert("julio " + julio);
    var agostoDepende = document.getElementById(agosto);
    var agostoValue = agostoDepende.value; alert("agosto " + agosto);
    var septiembreDepende = document.getElementById(septiembre);
    var septiembreValue = septiembreDepende.value; alert("septiembre " + septiembre);
    var octubreDepende = document.getElementById(octubre);
    var octubreValue = octubreDepende.value; alert("octubre " + octubre);
    var noviembreDepende = document.getElementById(noviembre);
    var noviembreValue = noviembreDepende.value; alert("noviembre " + noviembre);
    var diciembreDepende = document.getElementById(diciembre);
    var diciembreValue = diciembreDepende.value; alert("diciembre " + diciembre);
    var fragment_url = url + "&idIncurrido=" + idIncurrido + "&anio=" + anio + "&enero=" + eneroValue + "&febrero=" + febreroValue + "&marzo=" + marzoValue + "&abril=" + abrilValue + "&mayo=" + mayoValue + "&junio=" + junioValue + "&julio=" + julioValue + "&agosto=" + agostoValue + "&septiembre=" + septiembreValue + "&octubre=" + octubreValue + "&noviembre=" + noviembreValue + "&diciembre=" + diciembreValue;
    alert(fragment_url);
    //ejecutamos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
    //}
}

function actualizarIncurridoEnero(url, idIncurrido, anio, enero, val_resul) {
//    alert("DENTRO DE LA FUNCION actualizarIncurridoEnero archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    var eneroDepende = document.getElementById(enero);
    var eneroValue = eneroDepende.value; //alert("enero " + eneroValue);
    var fragment_url = url + "&idIncurrido=" + idIncurrido + "&anio=" + anio + "&Enero=" + eneroValue;
    //alert(fragment_url);
    //ejecutamos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
    //}
}

//actualizarIncurridoEneroAcumulado('actualizarIncurridosCap.jsp?accion=2&usuario=Sistemas&unidadNegocio=<%=unidadNegocio%>&identificaIndicador=<%=identificaIndicador%>', '<% out.print(Idincurrido);%>', '<% out.print(Anio);%>', 'enero<%=Idincurrido%>', 'eneroAcumulado<%=Idincurrido%>', 'actulizaIncurrido');
function actualizarIncurridoEneroAcumulado(url, idIncurrido, anio, enero, eneroAcumulado, val_resul) {
    //alert("DENTRO DE LA FUNCION actualizarIncurridoEnero archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    var eneroDepende = document.getElementById(enero);
    var eneroValue = eneroDepende.value; //alert("enero " + eneroValue);
    var eneroAcumuladoDepende = document.getElementById(eneroAcumulado);
    var eneroAcumuladoValue = eneroAcumuladoDepende.value; //alert("eneroAcumulado " + eneroAcumuladoValue);
    var fragment_url = url + "&idIncurrido=" + idIncurrido + "&anio=" + anio + "&Enero=" + eneroValue + "&EneroAcumulado=" + eneroAcumuladoValue;
    //alert(fragment_url);
    //ejecutamos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
    //}
}

function actualizarIncurridoCualquierMes(url, idIncurrido, anio, mes, valor, val_resul) {
    //alert("DENTRO DE LA FUNCION actualizarIncurridoCualquierMes archivo AJAX:)!!!");
    //alert("idIncurrido " + idIncurrido); alert("anio " + anio); alert("Mes " + mes); alert("Valor " + valor);
    var elemento = document.getElementById(val_resul);
    var valorDepende = document.getElementById(valor);
    var valorValue = valorDepende.value; //alert("valor " + valorValue);
    var fragment_url = url + "&idIncurrido=" + idIncurrido + "&anio=" + anio + "&" + mes + "=" + valorValue;
    //alert(fragment_url);
    //ejecutamos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
    //}
}
function actualizarIncurridoCapCualquierMes(url, idIncurrido, anio, mes, valor, valorAcumulado, val_resul) {
    //alert("DENTRO DE LA FUNCION actualizarIncurridoCapCualquierMes archivo AJAX:)!!!");
    //alert("idIncurrido " + idIncurrido); alert("anio " + anio); alert("Mes " + mes); alert("Valor " + valor);
    var elemento = document.getElementById(val_resul);
    var valorDepende = document.getElementById(valor);
    var valorValue = valorDepende.value; //alert("valor " + valorValue);
    var valorAcumuladoDepende = document.getElementById(valorAcumulado);
    var valorAcumuladoValue = valorAcumuladoDepende.value; //alert("valorAcumulado " + valorAcumuladoValue);
    var fragment_url = url + "&idIncurrido=" + idIncurrido + "&anio=" + anio + "&" + mes + "=" + valorValue + "&Acumulado=" + valorAcumuladoValue;
    //alert(fragment_url);
    //ejecutamos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
    //}
}

function mostrarFrame2(url, mes, unidadNegocio, departamento, concepto, conceptoPresupuesto, departamentoDescripcion, val_resul) {
    //alert("DENTRO DE LA FUNCION mostrarFrame2 :)!!!");
    var elemento = document.getElementById(val_resul);
    var mesDepende = document.getElementById(mes);
    var mesValue = mesDepende.value;
    var fragment_url = url + "?mesBusqueda=" + mesValue + "&unidadNegocio=" + unidadNegocio + "&departamento=" + departamento + "&concepto=" + concepto + "&conceptoPresupuesto=" +conceptoPresupuesto + "&departamentoDescripcion=" + departamentoDescripcion;
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

function mostrarFrameFandI(url, mes, unidadNegocio, departamento, concepto, conceptoPresupuesto, val_resul) {
    //alert("DENTRO DE LA FUNCION mostrarFrameFandI :)!!!");
    var elemento = document.getElementById(val_resul);
    var mesDepende = document.getElementById(mes);
    var mesValue = mesDepende.value;
    var fragment_url = url + "&mesBusqueda=" + mesValue + "&unidadNegocio=" + unidadNegocio + "&departamento=" + departamento + "&concepto=" + concepto + "&conceptoPresupuesto=" +conceptoPresupuesto;
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

function mostrarFrameUnidades(url, mes, clasificacion, unidadNegocio ,val_resul) {
    //alert("DENTRO DE LA FUNCION mostrarFrame2 :)!!!");
    var elemento = document.getElementById(val_resul);
    var mesDepende = document.getElementById(mes);
    var mesValue = mesDepende.value;
    var fragment_url = url + "?mesBusqueda=" + mesValue + "&clasificacion=" + clasificacion + "&unidadNegocio=" + unidadNegocio;
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


function cambiarTablaResumen(url, mes, departamento, concepto, unidadNegocio, conceptoPresupuesto, departamentoDescripcion, unidadNegocioPresupuestos, val_resul) {
    alert("DENTRO DE LA FUNCION cambiarTablaResumen:)!!!");
    var elemento = document.getElementById(val_resul);
    var mesDepende = document.getElementById(mes);
    var mesValue = mesDepende.value;
    var fragment_url = url + "?mesBusqueda=" + mesValue + "&departamento=" + departamento + "&concepto=" + concepto + "&unidadNegocio=" + unidadNegocio + "&conceptoPresupuesto=" + conceptoPresupuesto + "&departamentoDescripcion=" + departamentoDescripcion + "&unidadNegocioPresupuestos=" + unidadNegocioPresupuestos;
    alert(fragment_url);
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
            //escribimos la respuesta
            elemento.innerHTML = peticion.responseText;
        }
    }
    peticion.send(null);
}
