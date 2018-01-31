<%-- 
    Document   : Areas
    Created on : 6/02/2015, 10:45:53 AM
    Author     : REDES
--%>
<%@page import="java.util.ArrayList"%>
<%@page import ="modelo.departamentos;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DEPARTAMENTOS</title>
    </head>
    <body>

        <%
            System.out.println("entrando");
            departamentos vista = new departamentos();
            departamentos objetoDepartamentos = new departamentos();
            ArrayList<departamentos> consulta = new ArrayList<departamentos>();
            consulta = vista.consultarDepartamentos();

            out.print("<table border ='1' style='border: 1px #0000FF'cellspacing='1'>");

            out.print("<tr>");
            out.print("<td>idDepartamento</td>");
            out.print("<td>Departamento</td>");
            out.print("<td>Activo</td>");
         //out.print("<td>LimiteInferior</td>");

            for (int i = 0; i < consulta.size(); i++) {
                out.print("<tr>");
                out.print("<td>" + consulta.get(i).getBal_iddepartamento() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_departamento() + "</td>");
                out.print("<td>" + consulta.get(i).getBal_activo() + "</td>");

                out.print("</tr>");
            }
            out.print("</table>");

        %>
    </body>
</html>

