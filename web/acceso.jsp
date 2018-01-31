<%-- 
    Document   : acceso
    Created on : 29/01/2018, 02:30:22 PM
    Author     : Guadalupe
--%>

<%
    HttpSession sesion = request.getSession();
    String mensaje = (String) sesion.getAttribute("mensaje");
    if (mensaje != null && !mensaje.equals("")) {
        out.print("<script>alert('" + mensaje + "')</script>");
        sesion.removeAttribute("mensaje");
    }
%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Acceso Listas de Precios</title><%-- Set the viewport width to device width for mobile --%>
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
        <%-- SUBHEADER ================================================== --%>
        <p></p>
        <jsp:include page="subHeader.jsp" />
        <%-- ANIMATED COLUMNS ================================================== --%>
        <%-- CONTENT          ================================================== --%>
        <div class="row">
            <div class="twelve columns">
                <div class="centersectiontitle">
                    <h4>Acceso</h4>
                </div>
            </div>
            <div class="four columns">
                <h5></h5>
                <p><img src="images/agencias/BusinessIntelligence.jpg" alt="image01" class="responsiveslideInicio"></p>
            </div>
            <div class="four columns">
                <h5></h5>
                <form name="frmdo" method="POST" action="acceso" id="frmdo" target="_self">
                    <table border="2">
                        <tr><td colspan="2" height="30px">Datos de usuario</td>
                        </tr>
                        <tr>
                            <td width="200px" height="30px" style="text-align: right">Usuario:&nbsp;</td>
                            <td width="200px"><input tabindex="1" type="text" maxlength="50"  name="usuarioIngresado" id="usuarioIngresado" class="text" value="" required/></td>
                        </tr>
                        <tr>
                            <td width="200px" height="30px" style="text-align: right">Contrase&ntilde;a:&nbsp;</td>
                            <td width="200px"><input tabindex="2" type="password" name="passwordIngresado" id="passwordIngresado" class="text" value="" required/></td>
                        </tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
                        <tr>
                            <td width="100px" colspan="1" style="text-align:center"><input tabindex="4" type="reset" name="" id="" value="Cancelar" class="buttonAcceso"/></td>
                            <td width="100px" colspan="1" style="text-align:center;"><input tabindex="5" type="submit" name="send" id="send" value="Aceptar" class="buttonAcceso"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="hr">
        </div>
        <%-- CLIENTS          ================================================== --%>
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
