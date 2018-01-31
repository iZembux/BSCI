<%-- 
    Document   : generar
    Created on : 29/01/2018, 03:57:38 PM
    Author     : Guadalupe
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1" import="modelo.unidades, java.util.ArrayList;"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    String usuarioValidado = (String) sesion.getAttribute("usuarioIngresado");
    System.out.println("USUARIO: " + usuarioValidado);
    if (usuarioValidado == null) {
        response.sendRedirect("acceso.jsp");
    } else {
        String idPersonaUsuario = (String) sesion.getAttribute("idPersonaUsuario");
        String tipoUsuario = (String) sesion.getAttribute("tipoUsuarioIngresado");
        String unidadNegocio = (String) sesion.getAttribute("unidadNegocio");
        System.out.println("TIPO USUARIO: " + tipoUsuario);
        unidades objUnidades = new unidades();
        ArrayList<unidades> arrayUnidades = new ArrayList<unidades>();
        arrayUnidades = objUnidades.mostrarAniosUnidades();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width"/>
        <%-- CSS Files--%>
        <link rel="stylesheet" href="stylesheets/style.css">
        <link rel="stylesheet" href="stylesheets/homepage.css"><%-- homepage stylesheet --%>
        <link rel="stylesheet" href="stylesheets/skins/blue.css"><%-- skin color --%>
        <link rel="stylesheet" href="stylesheets/responsive.css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="encabezadoIntranet.jsp" />
        <%-- HEADER    ================================================== --%>
        <jsp:include page="user.jsp">
            <jsp:param name="usuarioValidado" value="<%=usuarioValidado%>"/>
        </jsp:include>
        <%-- ---------------------------------------------------------------------------------- --%>
        <div class="row">
            <jsp:include page="menuListasPrecios.jsp"/>
        </div>
        <%-- ---------------------------------------------------------------------------------- --%>
        <div class="four columns">
            <h5></h5>
            <center>
                <div class="row">
                    <form name="frmdo" method="POST" action="excelListasEmpresa" id="frmdo" target="_blank"> <%-- createLista --%>
                        <table border="2">
                            <tr><td colspan="2" height="30px">Generar Lista</td>
                            </tr>
                            <tr>
                                <td width="200px" height="30px" style="text-align: right">Limite de Generaci&oacute;n:&nbsp;</td>
                                <td width="200px"><input tabindex="1" type="text" maxlength="50"  name="limite" id="limite" class="text" value="5.0" required/></td>
                            </tr>
                            <tr>
                                <td width="200px" height="30px" style="text-align: right">Saltos entre Costos N%:&nbsp;</td>
                                <td width="200px"><input tabindex="2" type="text" maxlength="50"  name="saltos" id="saltos" class="text" value="1.0" required/></td>
                            </tr>
                            <tr>
                                <td width="200px" height="30px" style="text-align: right">Unidad:&nbsp;</td>
                                <td width="200px"><select id="empresaVarGlobal" name="empresaVarGlobal" class="sucursal">
                                        <option value="Continental">Continental</option>
                                        <option value="Mitsubishi">Mitsautos</option>
                                        <option value="Fiat">Automodena</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td width="200px" height="30px" style="text-align: right">A&ntilde;o:&nbsp;</td>
                                <td width="200px"><select id="anioLista" name="anioLista" class="sucursal">
                                        <%
                                        if(arrayUnidades.size() > 0){
                                            for(int i = 0; i < arrayUnidades.size(); i++){
                                                out.println("<option value='" + arrayUnidades.get(i).getUni_Anio() + "'>" + arrayUnidades.get(i).getUni_Anio() +"</option>");
                                            }
                                        }else{
                                            out.println("<option value=''>No se encontraron unidades</option>");
                                        }
                                        %>
                                    </select></td>
                            </tr>
                            <tr>
                                <td width="100px" colspan="2" style="text-align:center;"><input tabindex="5" type="submit" name="send" id="send" value="Generar" class="buttonAcceso"/></td>
                            </tr>
                            <tr>
                                <td width="100px" colspan="2" style="text-align:center;"><a href="excelListasEmpresa?tipoLista=1&empresaVarGlobal=Continental&anioLista=2016&saltos=1.0&limite=5.0" target="_blank">Crear Excel</a></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </center>
        </div>
        <jsp:include page="marcasInferior.jsp" />
        <jsp:include page="piePagina.jsp" /> 
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
        <script src="javascripts/user.js"></script>
    </body>
</html>
<%
    }
%>