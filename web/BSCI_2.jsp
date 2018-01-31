<%-- 
    Document   : BSCI_2
    Created on : 29/01/2018, 11:55:43 AM
    Author     : Guadalupe
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.utilMath"%>
<%@page import="modelo.departamentos"%>
<%@page import="modelo.balance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.generarReporte"%>
<%@page import="modelo.procesosFecha"%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="UTF-8">
     
       
        <title></title>
    </head>
    <body>
        <!-- Tablas -->
        <br>
        <% 
        RequestDispatcher dispatcher;
        String NombreReporte = "";
        utilMath objMath = new utilMath();
        DecimalFormat df = new DecimalFormat("#.0"); 
        int anioReporte = 0;
        int mesReporte = 0;
        Calendar fecha_hoy = Calendar.getInstance(); 
        String añohoy = String.valueOf(fecha_hoy.get(Calendar.YEAR));
        String meshoy = String.valueOf(fecha_hoy.get(Calendar.MONTH) + 1);
       // System.out.println("Mes hoy es:."+meshoy); 
        int mesH=Integer.parseInt(meshoy);  
        int anio=Integer.parseInt(añohoy); 
       System.out.println("el Año hoy es: "+anio);  
        String diahoy = String.valueOf(fecha_hoy.get(Calendar.DAY_OF_MONTH));  
        try { 
            anioReporte = Integer.parseInt(request.getParameter("anioReporte"));
            System.out.println("Anio Reporte: " +anioReporte); 
        } catch (Exception e) {
        }
        try {
            mesReporte = Integer.parseInt(request.getParameter("mesReporte"));
        } catch (Exception e) {
        }
        if(anioReporte == anio && mesReporte==mesH){
          System.out.println(" año y mes Iguales");
            NombreReporte="/BSCI_3.jsp";
       }else if(anioReporte==anio && mesReporte == (mesH-1)){
             System.out.println("año igual y un mes antes");
            NombreReporte="/BSCI.jsp"; 
        }else if(anioReporte != anio && mesReporte != mesH){
            NombreReporte="/BSCI.jsp";    
            System.out.println("Año y mes diferentes"); 
        }else if(anioReporte==anio && mesReporte > mesH){
            NombreReporte="/BSCI_3.jsp"; 
            System.out.println("Año igual y mes reporte mayor a mes actual");
        }else if(anioReporte != anio && mesReporte == mesH){
            NombreReporte="/BSCI.jsp";    
        }
        dispatcher = getServletContext().getRequestDispatcher(NombreReporte);
        dispatcher.forward(request, response);
        %>
        
       
    </body>
</html>
