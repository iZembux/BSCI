/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
//guardarUnidad('actualizarPrecios.jsp?accion=1', 'marca', 'modelo', 'version', 'anio', 'precio', 'bonificacion', 'spdc', 'tracomex1', 'tracomex2', 'capturaUnidad');
function guardarUnidad(url, usuario, marca, modelo, version, anio, cpos, precio, bonificacion, spdc, tracomex1, tracomex2, val_resul) {
    //alert("DENTRO DE LA FUNCION guardarUnidad archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    var usuarioDepende = document.getElementById(usuario);
    var usuarioValue = usuarioDepende.value;
    //alert("usuario " + usuarioValue);
    var marcaDepende = document.getElementById(marca);
    var marcaValue = marcaDepende.value;
    //alert("marca " + marcaValue);
    var modeloDepende = document.getElementById(modelo);
    var modeloValue = modeloDepende.value;
    //alert("modelo " + modeloValue);
    var versionDepende = document.getElementById(version);
    var versionValue = versionDepende.value;
    //alert("version " + versionValue);
    var anioDepende = document.getElementById(anio);
    var anioValue = anioDepende.value;
    //alert("anio " + anioValue);
    var cposDepende = document.getElementById(cpos);
    var cposValue = cposDepende.value;
    //alert("cpos " + cposValue);
    var precioDepende = document.getElementById(precio);
    var precioValue = precioDepende.value;
    //alert("precio " + precioValue);
    var bonificacionDepende = document.getElementById(bonificacion);
    var bonificacionValue = bonificacionDepende.value;
    //alert("bonificacion " + bonificacionValue);
    var spdcDepende = document.getElementById(spdc);
    var spdcValue = spdcDepende.value;
    //alert("spdc " + spdcValue);
    var tracomex1Depende = document.getElementById(tracomex1);
    var tracomex1Value = tracomex1Depende.value;
    //alert("tracomex1 " + bonificacionValue);
    var tracomex2Depende = document.getElementById(tracomex2);
    var tracomex2Value = tracomex2Depende.value;
    var fragment_url = url + "&usuario=" + usuarioValue + "&identificaMarca=" + marcaValue + "&identificaModelo=" + modeloValue + "&version=" + versionValue + "&anio=" + anioValue + "&cpos=" + cposValue + "&precio=" + precioValue + "&bonificacion=" + bonificacionValue + "&spdc=" + spdcValue + "&tracomex1=" + tracomex1Value + "&tracomex2=" + tracomex2Value;
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
}

function actualizarPrecio(url, idUnidad, precio, bonificacion, spdc, tracomex1, tracomex2, val_resul) {
    //alert("DENTRO DE LA FUNCION actualizarEmpleado archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    //var idUnidadDepende = document.getElementById(idUnidad);
    //var idUnidadValue = idUnidadDepende.value;
    //alert("idUnidad " + idUnidad);
    var precioDepende = document.getElementById(precio);
    var precioValue = precioDepende.value;
    //alert("precio " + precioValue);
    var bonificacionDepende = document.getElementById(bonificacion);
    var bonificacionValue = bonificacionDepende.value;
    //alert("bonificacion " + bonificacionValue);
    var spdcDepende = document.getElementById(spdc);
    var spdcValue = spdcDepende.value;
    //alert("spdc " + spdcValue);
    var tracomex1Depende = document.getElementById(tracomex1);
    var tracomex1Value = tracomex1Depende.value;
    //alert("tracomex1 " + bonificacionValue);
    var tracomex2Depende = document.getElementById(tracomex2);
    var tracomex2Value = tracomex2Depende.value;
    //alert("tracomex2 " + tracomex2Value);
    //var msq = "Esta seguro de terminar el contrato del empleado con clave " + claveEmpleadoValue + "?";
    //if (confirm(msq)) {
    /*     
     var empresaDepende = document.getElementById(empresa);
     var empresaValue = empresaDepende.value; //alert("claveEmpleado " + claveEmpleadoValue);
     var diaDepende = document.getElementById(dia);
     var diaValue = diaDepende.value; //alert("dia " + diaValue);
     var mesDepende = document.getElementById(mes);
     var mesValue = mesDepende.value; //alert("mes " + mesValue);
     var anioDepende = document.getElementById(anio);
     var anioValue = anioDepende.value; //alert("anio " + anioValue);
     */
    var fragment_url = url + "&idUnidad=" + idUnidad + "&precio=" + precioValue + "&bonificacion=" + bonificacionValue + "&spdc=" + spdcValue + "&tracomex1=" + tracomex1Value + "&tracomex2=" + tracomex2Value;
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

function actualizarIncurrido(url, idIncurrido, anio, enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre, val_resul) {
    //alert("DENTRO DE LA FUNCION actualizarEmpleado archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    var eneroDepende = document.getElementById(enero);
    var eneroValue = eneroDepende.value;
    //alert("enero " + enero);
    var febreroDepende = document.getElementById(febrero);
    var febreroValue = febreroDepende.value;
    //alert("febrero " + febrero);
    var marzoDepende = document.getElementById(marzo);
    var marzoValue = marzoDepende.value;
    //alert("marzo " + marzo);
    var abrilDepende = document.getElementById(abril);
    var abrilValue = abrilDepende.value;
    //alert("abril " + abril);
    var mayoDepende = document.getElementById(mayo);
    var mayoValue = mayoDepende.value;
    //alert("mayo " + mayo);
    var junioDepende = document.getElementById(junio);
    var junioValue = junioDepende.value;
    //alert("junio " + junio);
    var julioDepende = document.getElementById(julio);
    var julioValue = julioDepende.value;
    //alert("julio " + julio);
    var agostoDepende = document.getElementById(agosto);
    var agostoValue = agostoDepende.value;
    //alert("agosto " + agosto);
    var septiembreDepende = document.getElementById(septiembre);
    var septiembreValue = septiembreDepende.value;
    //alert("septiembre " + septiembre);
    var octubreDepende = document.getElementById(octubre);
    var octubreValue = octubreDepende.value;
    //alert("octubre " + octubre);
    var noviembreDepende = document.getElementById(noviembre);
    var noviembreValue = noviembreDepende.value;
    //alert("noviembre " + noviembre);
    var diciembreDepende = document.getElementById(diciembre);
    var diciembreValue = diciembreDepende.value;
    //alert("diciembre " + diciembre);
    var fragment_url = url + "&idIncurrido=" + idIncurrido + "&anio=" + anio + "&enero=" + eneroValue + "&febrero=" + febreroValue + "&marzo=" + marzoValue + "&abril=" + abrilValue + "&mayo=" + mayoValue + "&junio=" + junioValue + "&julio=" + julioValue + "&agosto=" + agostoValue + "&septiembre=" + septiembreValue + "&octubre=" + octubreValue + "&noviembre=" + noviembreValue + "&diciembre=" + diciembreValue;
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

function actualizarParametro(url, idParametro, descripcion1, descripcion2, valor1, valor2, val_resul) {
    //alert("DENTRO DE LA FUNCION actualizarEmpleado archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    //var idUnidadDepende = document.getElementById(idUnidad);
    //var idUnidadValue = idUnidadDepende.value;
    //alert("idUnidad " + idUnidad);
    var precioDepende = document.getElementById(precio);
    var precioValue = precioDepende.value;
    //alert("precio " + precioValue);
    var bonificacionDepende = document.getElementById(bonificacion);
    var bonificacionValue = bonificacionDepende.value;
    //alert("bonificacion " + bonificacionValue);
    var spdcDepende = document.getElementById(spdc);
    var spdcValue = spdcDepende.value;
    //alert("spdc " + spdcValue);
    var tracomex1Depende = document.getElementById(tracomex1);
    var tracomex1Value = tracomex1Depende.value;
    //alert("tracomex1 " + bonificacionValue);
    var tracomex2Depende = document.getElementById(tracomex2);
    var tracomex2Value = tracomex2Depende.value;
    //alert("tracomex2 " + tracomex2Value);
    var fragment_url = url + "&idUnidad=" + idUnidad + "&precio=" + precioValue + "&bonificacion=" + bonificacionValue + "&spdc=" + spdcValue + "&tracomex1=" + tracomex1Value + "&tracomex2=" + tracomex2Value;
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
}

function generarHistorialPrecio(url, val_resul) {
    //alert("DENTRO DE LA FUNCION generarHistorialPrecio archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    var msq = "Esta seguro de generar el historico de esta unidades?";
    if (confirm(msq)) {
        var fragment_url = url;
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
    }
}

function actualizarEmpleado(url, idPersona, claveEmpleado, empresa, nomina, dia, mes, anio, usuarioValidado, tipoUsuario, val_resul) {
    //alert("DENTRO DE LA FUNCION actualizarEmpleado archivo AJAX:)!!!");
    var elemento = document.getElementById(val_resul);
    //var idPersonaDepende = document.getElementById(idPersona);
    //var idPersonaValue = idPersonaDepende.value;
    //alert("idPersona " + idPersona);
    var claveEmpleadoDepende = document.getElementById(claveEmpleado);
    var claveEmpleadoValue = claveEmpleadoDepende.value; //alert("claveEmpleado " + claveEmpleadoValue);
    var empresaDepende = document.getElementById(empresa);
    var empresaValue = empresaDepende.value; //alert("claveEmpleado " + claveEmpleadoValue);
    var nominaDepende = document.getElementById(nomina);
    var nominaValue = nominaDepende.value; //alert("tipoNomina " + nominaValue);
    var diaDepende = document.getElementById(dia);
    var diaValue = diaDepende.value; //alert("dia " + diaValue);
    var mesDepende = document.getElementById(mes);
    var mesValue = mesDepende.value; //alert("mes " + mesValue);
    var anioDepende = document.getElementById(anio);
    var anioValue = anioDepende.value; //alert("anio " + anioValue);
    var fragment_url = url + "&idPersona=" + idPersona + "&claveEmpleado=" + claveEmpleadoValue + "&empresa=" + empresaValue + "&nomina=" + nominaValue + "&dia=" + diaValue + "&mes=" + mesValue + "&anio=" + anioValue + "&usuarioValidado=" + usuarioValidado + "&tipoUsuario=" + tipoUsuario;
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
}