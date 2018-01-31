<%-- 
    Document   : actualizarIncurridos
    Created on : 29/01/2018, 02:31:13 PM
    Author     : Guadalupe
--%>

<%@page import="modelo.incurridos, logica.procesosFecha, java.util.ArrayList;"%>

<%
    int accion = 0;
    String usuario = "";
    int idIncurrido = 0;
    String identificaIndicador = "";
    int anio = 0;
    String unidadNegocio = "";
    String mes = "";
    double valorMes = 0.0;
    double enero = 0.0;
    double febrero = 0.0;
    double marzo = 0.0;
    double abril = 0.0;
    double mayo = 0.0;
    double junio = 0.0;
    double julio = 0.0;
    double agosto = 0.0;
    double septiembre = 0.0;
    double octubre = 0.0;
    double noviembre = 0.0;
    double diciembre = 0.0;
    try {
        accion = Integer.parseInt(request.getParameter("accion"));
        System.out.println("Accion: " + accion);
    } catch (Exception e) {
    }
    try {
        usuario = request.getParameter("usuario");
        System.out.println("usuario: " + usuario);
    } catch (Exception e) {
    }
    try {
        identificaIndicador = request.getParameter("identificaIndicador");
        System.out.println("identificaIndicador: " + identificaIndicador);
    } catch (Exception e) {
    }
    try {
        idIncurrido = Integer.parseInt(request.getParameter("idIncurrido"));
        System.out.println("idIncurrido: " + idIncurrido);
    } catch (Exception e) {
    }
    try {
        anio = Integer.parseInt(request.getParameter("anio"));
        System.out.println("anio: " + anio);
    } catch (Exception e) {
    }
    try {
        unidadNegocio = request.getParameter("unidadNegocio");
        System.out.println("unidadNegocio: " + unidadNegocio);
    } catch (Exception e) {
    }
    try {
        enero = Double.parseDouble(request.getParameter("Enero"));
        System.out.println("Enero: " + enero);
        valorMes = Double.parseDouble(request.getParameter("Enero"));
        mes = "Enero";
    } catch (Exception e) {
    }
    try {
        febrero = Double.parseDouble(request.getParameter("Febrero"));
        System.out.println("Febrero: " + febrero);
        valorMes = Double.parseDouble(request.getParameter("Febrero"));
        mes = "Febrero";
    } catch (Exception e) {
    }
    try {
        marzo = Double.parseDouble(request.getParameter("Marzo"));
        System.out.println("Marzo: " + marzo);
        valorMes = Double.parseDouble(request.getParameter("Marzo"));
        mes = "Marzo";
    } catch (Exception e) {
    }
    try {
        abril = Double.parseDouble(request.getParameter("Abril"));
        System.out.println("Abril: " + abril);
        valorMes = Double.parseDouble(request.getParameter("Abril"));
        mes = "Abril";
    } catch (Exception e) {
    }
    try {
        mayo = Double.parseDouble(request.getParameter("Mayo"));
        System.out.println("Mayo: " + mayo);
        valorMes = Double.parseDouble(request.getParameter("Mayo"));
        mes = "Mayo";
    } catch (Exception e) {
    }
    try {
        junio = Double.parseDouble(request.getParameter("Junio"));
        System.out.println("Junio: " + junio);
        valorMes = Double.parseDouble(request.getParameter("Junio"));
        mes = "Junio";
    } catch (Exception e) {
    }
    try {
        julio = Double.parseDouble(request.getParameter("Julio"));
        System.out.println("Julio: " + julio);
        valorMes = Double.parseDouble(request.getParameter("Julio"));
        mes = "Julio";
    } catch (Exception e) {
    }
    try {
        agosto = Double.parseDouble(request.getParameter("Agosto"));
        System.out.println("agosto: " + agosto);
        valorMes = Double.parseDouble(request.getParameter("Agosto"));
        mes = "Agosto";
    } catch (Exception e) {
    }
    try {
        septiembre = Double.parseDouble(request.getParameter("Septiembre"));
        System.out.println("Septiembre: " + septiembre);
        valorMes = Double.parseDouble(request.getParameter("Septiembre"));
        mes = "Septiembre";
    } catch (Exception e) {
    }
    try {
        octubre = Double.parseDouble(request.getParameter("Octubre"));
        System.out.println("Octubre: " + octubre);
        valorMes = Double.parseDouble(request.getParameter("Octubre"));
        mes = "Octubre";
    } catch (Exception e) {
    }
    try {
        noviembre = Double.parseDouble(request.getParameter("Noviembre"));
        System.out.println("Noviembre: " + noviembre);
        valorMes = Double.parseDouble(request.getParameter("Noviembre"));
        mes = "Noviembre";
    } catch (Exception e) {
    }
    try {
        diciembre = Double.parseDouble(request.getParameter("Diciembre"));
        System.out.println("Diciembre: " + diciembre);
        valorMes = Double.parseDouble(request.getParameter("Diciembre"));
        mes = "Diciembre";
    } catch (Exception e) {
    }
    incurridos objIncurridos = new incurridos();
    procesosFecha objFechas = new procesosFecha();
    String fechaActual = "";
    String mesActual = "";
    String anioActual = "";
    String[] fechaGenera = null;
    fechaActual = objFechas.getFecha("yyyy-MM-dd");
    fechaGenera = fechaActual.split("-");
    if (fechaGenera != null) {
        mesActual = fechaGenera[1];
        anioActual = fechaGenera[0];
        System.out.println("Mes Actual: " + mesActual);
        System.out.println("Anio Actual: " + anioActual);
    }
    int ok = 0;
    switch (accion) {
        case 1:
            break;
        case 2:
            //---------------------------------------------------------------------------------------------------------------
            // Procesos para la actualizacion de precios en la tabla de unidades
            //----------------------------------------------------------------------------------------------------------------    
            //ok = objIncurridos.actualizarIncurrido(idIncurrido, anio, unidadNegocio, enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre, usuario, fechaActual);
            ok = objIncurridos.actualizarIncurridoXMes(identificaIndicador, anio, unidadNegocio, mes, valorMes, usuario, fechaActual);
            System.out.println("Variable OK: " + ok);
            if (ok == 0) {
                out.print("<center><img onload=\"mensaje('Actualizacion correcta de INCURRIDO');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
                //out.print("<center><img onload=\"mensajeRetorno('Actualizacion correcta de valores', 'formCapturarVersion.jsp', 'automatico');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
            } else {
                out.print("<center><img onload=\"mensaje('Ocurrio un ERROR al actulizar INCURRIDO');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
            }
            break;
        case 4:
            break;
        default:
            out.print("<center><img onload=\"mensaje('Favor de comunicarse con el administrador, accion incorrecta para INCURRIDOS');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
            break;
    }
%>