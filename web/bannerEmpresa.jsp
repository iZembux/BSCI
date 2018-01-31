<%-- 
    Document   : bannerEmpresa
    Created on : 29/01/2018, 02:32:59 PM
    Author     : Guadalupe
--%>

<%
    String unidadNegocio = "grupo";
    try{
        unidadNegocio = request.getParameter("unidadNegocio");
    }catch(Exception ex){}
%>
<div class="row">
<div class="twelve columns">
    <ul>
        
            <img src="img/agencias/<%=unidadNegocio%>.png" width="170" height="55" alt="Empresa">
        
    </ul>
</div>
</div>