<%-- 
    Document   : Reportes
    Created on : 29/01/2018, 01:19:12 PM
    Author     : Guadalupe
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1" import=" modelo.Privilegios,modelo.procesosFecha"%>

<%
    
    HttpSession sesion = request.getSession();
    String usuarioValidado = "";
    usuarioValidado = request.getParameter("usuarioValidado");
    
    if (usuarioValidado == null  || usuarioValidado ==""  || usuarioValidado==" ") {
        response.sendRedirect("../BI6R_TEST/acceso.jsp");
    } else {
      
        String unidadNegocio = "";
        unidadNegocio = "Continental";
      

        String retorno = "";
        ArrayList<Privilegios> listaEmp = new ArrayList<Privilegios>();
        Privilegios privUsuario = new Privilegios();
        
        listaEmp=privUsuario.obtenerEmpresas(usuarioValidado);
        System.out.println("Lista :"+ listaEmp.size());
  

    
        

%>       
<!DOCTYPE html>
<html>
    <head>

        <title>Reportes</title><%-- Set the viewport width to device width for mobile --%>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width"/>
        <%-- CSS Files--%>
        <link rel="stylesheet" href="stylesheets/style.css">
        <link rel="stylesheet" href="stylesheets/homepage.css"><%-- homepage stylesheet --%>
        <link rel="stylesheet" href="stylesheets/skins/blue.css"><%-- skin color --%>
        <link rel="stylesheet" href="stylesheets/responsive.css">
        <%-- IE Fix for HTML5 Tags --%>
        <%--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
          <![endif]--%>    
    </head>
    <body>
        <jsp:include page="encabezadoIntranet.jsp" />

        <%-- HEADER    ================================================== --%>
        <div class="twelve slider-menu">
            <div class="row">
                <jsp:include page="menu.jsp"/>
            </div>
        </div>

        <%-- <form action="balanceExcel.jsp" target="_blank" method="post"> --%>
        <form action="createLista" target="_blank" method="post"> 
            <table class="row">
                <tr> 
                    <td width="420" colspan="2">
                <big>Generar Reporte</big> 
                <hr  style=" background-color: #5882FA; height: 2px; margin-left: 0%; width: 100%;">
                </head>
                </td>
                <td>

                </td>
                </tr>
                <tr>
                    <td><big>Empresa</big>
                <select name="unidadNegocio">
                   <%
                        for(int i=0;i<listaEmp.size();i++){
                            listaEmp.get(i).getUnidadNegocio();
                    %>
                    <option value ="<%=listaEmp.get(i).getUnidadNegocio()%>"><%out.print(listaEmp.get(i).getUnidadNegocio());%></option>
                    <%}%>
                </select>
                </td>
                <td>
                <big>Anio</big>
                <select name="anioReporte" id="anioReporte">
                    <%                        procesosFecha objFecha = new procesosFecha();
                        int anioActual = 2016;
                        //
                        try {
                            anioActual = Integer.parseInt(objFecha.getFecha("yyyy"));
                        } catch (Exception e) {
                        }
                        for (int i = 2016; i <= anioActual; i++) {
                    %>
                    <option value="<%=i%>"><%=i%></option>
                    <% }%>
                </select>
                </td>
                <td>
                <big>Mes</big>
                <select name="mesReporte" id="mesReporte">
                    <option value ="1">Enero</option>
                    <option value ="2">Febrero</option>
                    <option value ="3">Marzo</option>
                    <option value ="4">Abril</option>
                    <option value ="5">Mayo</option>
                    <option value ="6">Junio</option>
                    <option value ="7">Julio</option>
                    <option value ="8">Agosto</option>
                    <option value ="9">Septiembre</option>
                    <option value ="10">Octubre</option>
                    <option value ="11">Noviembre</option>
                    <option value ="12">Diciembre</option>
                </select>
                </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Generar">
                        <input type="reset" value="Cancelar">
                    </td>
                    <td></td>
                </tr>   
            </table>
        </form>
        <jsp:include page="marcasInferior.jsp" />
        <%-- TESTIMONIALS     ================================================== --%>
        <%-- <jsp:include page="testimonials.jsp" />--%>
        <%-- TWITTER          ================================================== --%>
        <%-- <jsp:include page="twiter.jsp" /> --%>
        <%-- FOOOTER          ================================================== --%>
        <jsp:include page="piePagina.jsp" />
        <%-- JAVASCRIPTS      ================================================== --%>
        <%-- Javascript files placed here for faster loading --%>
        <script src="javascripts/jquery.easing.1.3.js"></script>
        <script src="javascripts/elasticslideshow.js"></script>
        <script src="javascripts/jquery.carouFredSel-6.0.5-packed.js"></script>
        <script src="javascripts/jquery.cycle.js"></script>
        <script src="javascripts/app.js"></script>
        <script src="javascripts/modernizr.foundation.js"></script>
        <script src="javascripts/slidepanel.js"></script>
        <script src="javascripts/scrolltotop.js"></script>
        <script src="javascripts/hoverIntent.js"></script>
        <script src="javascripts/superfish.js"></script>
        <script src="javascripts/responsivemenu.js"></script>
    </body>
</html>

<%
    }
%>