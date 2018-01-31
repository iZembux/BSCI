<%-- 
    Document   : user
    Created on : 29/01/2018, 04:18:36 PM
    Author     : Guadalupe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuarioValidado = request.getParameter("usuarioValidado");
%>

<%-- <li><a href="#">Cambiar Password</a></li> --%>
<a href="#" id="welcome" class="panelTrigger">Bienvenido <% out.print(usuarioValidado);%></a>
<div id="welcome-menu" class="panelContainer">
    <ul>
        <li><a href="cerrarSesion.jsp">Cerrar Sesi&oacute;n</a></li>
        <%--<li><a href="changePassword.jsp">Cambiar Contrase&ntilde;a</a></li>--%>
    </ul>
</div>