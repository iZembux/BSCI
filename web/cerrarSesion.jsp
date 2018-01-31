<%-- 
    Document   : cerrarSesion
    Created on : 29/01/2018, 03:36:30 PM
    Author     : Guadalupe
--%>


<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<%
    response.setContentType("text/html");
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expire", 0);
    response.setHeader("Pragma", "no-cache");
    
    request.getSession().removeAttribute("usuarioIngresado");
    session.invalidate();
    response.sendRedirect("login.html");
%>