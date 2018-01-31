<%-- 
    Document   : Incurridos
    Created on : 29/01/2018, 12:16:22 PM
    Author     : Guadalupe
--%>
<%@page import="java.util.ArrayList"%>
<%@page import ="modelo.incurridos;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INCURRIDOS</title>
    </head>
    <body>

        <%
            String unidadNegocio = "";
            try{
                unidadNegocio = request.getParameter("unidadNegocio");
            }catch (Exception ex) {
                unidadNegocio = "Continental";
            }
            System.out.println("entrando");
            incurridos vista = new incurridos();
            incurridos objetoIncurridos = new incurridos();
            ArrayList<incurridos> consulta = new ArrayList();
            consulta = vista.consultarIncurridos(unidadNegocio);


            out.print("<table border ='1' class='display' id='listaincurridos' style='border: 1px #0000FF'cellspacing='1'>");

            out.print("<tr>");
            out.print("<td>idIncurrido</td>");
            out.print("<td>Incurrido</td>");
            out.print("<td>Anio</td>");
            out.print("<td>Enero</td>");
            out.print("<td>Febrero</td>");
            out.print("<td>Marzo</td>");
            out.print("<td>Abril</td>");
            out.print("<td>Mayo</td>");
            out.print("<td>Junio</td>");
            out.print("<td>Julio</td>");
            out.print("<td>Agosto</td>");
            out.print("<td>Septiembre</td>");
            out.print("<td>Octubre</td>");
            out.print("<td>Noviembre</td>");
            out.print("<td>Diciembre</td>");
            out.print("<td>Activo</td>");
            //out.print("<td>LimiteInferior</td>");

            for (int i = 0; i < consulta.size(); i++) {
                out.print("<tr>");
                out.print("<td>" + consulta.get(i).getBal_idincurrido() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_incurrido() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_anio() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_enero() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_febrero() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_marzo() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_abril() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_mayo() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_junio() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_julio() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_agosto() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_septiembre() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_octubre() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_noviembre() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_diciembre() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_activo() + "</td>");

                out.print("</tr>");
            }
            out.print("</table>");

        %>
    </body>
</html>
