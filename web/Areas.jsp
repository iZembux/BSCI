<%-- 
    Document   : Areas
    Created on : 6/02/2015, 10:45:53 AM
    Author     : REDES
--%>
<%@page import="java.util.ArrayList"%>
<%@page import ="modelo.areas;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AREAS</title>
    </head>
    <body>

        <%
            System.out.println("entrando");
            areas vista = new areas();
            areas objetoAreas = new areas();
            ArrayList<areas> consulta = new ArrayList();
            consulta = vista.consultarAreas();

            out.print("<table border ='1' class='display' id='listaAreas' style='border: 1px #0000FF'cellspacing='1'>");

            out.print("<tr>");
            out.print("<td>idArea</td>");
            out.print("<td>Area</td>");
            out.print("<td>Activo</td>");

            for (int i = 0; i < consulta.size(); i++) {
                out.print("<tr>");
                out.print("<td>" + consulta.get(i).getBal_idarea() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_area() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_activo() + "</td>");

                out.print("</tr>");
            }
            out.print("</table>");

        %>
    </body>
</html>

