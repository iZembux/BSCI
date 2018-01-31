<%-- 
    Document   : VistaIncurridosCap
    Created on : 29/01/2018, 02:04:33 PM
    Author     : Guadalupe
--%>

<%@page import="modelo.incurridos, modelo.procesosFecha, java.text.DecimalFormat, java.util.ArrayList;"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<%--
<%
    HttpSession sesion = request.getSession();
    String usuarioValidado = (String) sesion.getAttribute("usuarioIngresado");
    System.out.println("USUARIO: " + usuarioValidado);
    if (usuarioValidado == null) {
        response.sendRedirect("acceso.jsp");
    } else {
        String idPersonaUsuario = (String) sesion.getAttribute("idPersonaUsuario");
        String tipoUsuario = (String) sesion.getAttribute("tipoUsuarioIngresado");
        System.out.println("TIPO USUARIO: " + tipoUsuario);
        procesosFecha objFechas = new procesosFecha();
        String empresaVarGlobal = "Continental";
        int anioLista = 2015;
        try {
            empresaVarGlobal = request.getParameter("empresaVarGlobal");
        } catch (Exception e) {
        }
%>--%>
<%
    DecimalFormat objDecimal = new DecimalFormat("###,###.##");
    String unidadNegocio = "all";
    String identificaDepartamento = "all";
    String identificaArea = "all";
    int anioMostrar = 2016;
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
        <title>Grupo Continental - Incurridos</title>
        <%---------------------------------------------------------------------------------------------------------------------------%>
        <script type="text/javascript" src="js/Ajax/ajaxBalance.js"></script>
        <%---------------------------------------------------------------------------------------------------------------------------%>
        <style>
            .puesto {color: black; font: bold 100% small-caption; padding: 3px 0px 3px 10px; box-sizing:border-box;}
            .puestoTitle {color: black; font: bold 120% small-caption; padding: 3px 10px 3px 10px;}

        </style>
    </head>
    <body>
        <jsp:include page="encabezadoIntranet.jsp" />
        <%-- HEADER    ================================================== --%>	
        <div class="twelve slider-menu">
            <div class="row">
                <jsp:include page="menu.jsp"/>
            </div>
        </div>
        <%--    <jsp:include page="user.jsp">
                <jsp:param name="usuarioValidado" value="<%=usuarioValidado%>"/>
            </jsp:include>%>
        <%-- ---------------------------------------------------------------------------------- --%>
        <%-- ---------------------------------------------------------------------------------- --%>	
        <p><br/><br/></p>
        <div class="row">
            <%
                incurridos objetoIncurridos = new incurridos();
                ArrayList<incurridos> consulta = new ArrayList();

                int tabindex = 0;
            %>
            <table>
                <tr>
                    <td>
                        Seleccione una Empresa:
                    </td>
                    <td>
                        <select name="selectUnidadNegocio" id="selectUnidadNegocio" onchange="mostrarIncurrido('filtroIncurridosCap.jsp', 'selectUnidadNegocio', 'selectDepartamento', 'selectArea', 'selectMes', 'selectAnio', 'mainTableAreaIncurridos');">
                            <option value="all">Todas</option>
                            <option value="Continental">Continental</option>
                            <option value="Lerma">Lerma</option>
                            <option value="Tenancingo">Tenancingo</option>
                            <option value="Atlacomulco">Atlacomulco</option>
                            <option value="Automodena">Automodena</option>
                            <option value="Mitsuautos">Mitsuautos</option>
                            <option value="KoreanMotors">KoreanMotors</option>
                            <option value="Autopolanco">Autopolanco</option>
                            <option value="AutopolancoFiat">Autopolanco Fiat</option>
                            <option value="AutopolancoChrysler">Autopolanco Chrysler</option>
                            <option value="Nihon">Nihon</option>
                            <option value="HyundaiPatriotismo">Hyundai Patriotismo</option> 
                             <option value="PuertaSantaFe">Puerta Santa Fe</option> 
                             <option value="AlfaRomeo">Alfa Romeo</option> 
                            <option value="Mitsubishi">Mitsubishi</option> 
                        </select>
                    </td>
                    <td>
                        Seleccione un Departamento:
                    </td>
                    <td>
                        <select name="selectDepartamento" id="selectDepartamento" onchange="mostrarIncurrido('filtroIncurridosCap.jsp', 'selectUnidadNegocio', 'selectDepartamento', 'selectArea', 'selectMes', 'selectAnio', 'mainTableAreaIncurridos');">
                            <option value="all">Todos</option>
                            <option value="BAL_DE001">Servicio</option>
                            <option value="BAL_DE002">Hojalateria</option>
                            <option value="BAL_DE003">Ventas Nuevos</option>
                            <option value="BAL_DE004">Ventas Seminuevos</option>
                            <option value="BAL_DE005">Ventas Flotilla</option>
                            <option value="BAL_DE006">F&amp;I</option>
                            <option value="BAL_DE007">Refacciones</option>
                            <option value="BAL_DE008">Admon</option>
                            <option value="BAL_DE009">Dir Adjunta</option>
                        </select>
                    </td>
                    <td>
                        Seleccione una Area:
                    <td>
                        <select name="selectArea" id="selectArea" onchange="mostrarIncurrido('filtroIncurridosCap.jsp', 'selectUnidadNegocio', 'selectDepartamento', 'selectArea', 'selectMes', 'selectAnio', 'mainTableAreaIncurridos');">
                            <option value="all">Todas</option>
                            <option value="BAL_AR001">Comercial</option>
                            <option value="BAL_AR002">Financiero</option>
                            <option value="BAL_AR003">Operacion</option>
                            <option value="BAL_AR004">Desarrollo</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Seleccione un Mes:
                    </td>
                    <td>
                        <select name="selectMes" id="selectMes" onchange="mostrarIncurrido('filtroIncurridosCap.jsp', 'selectUnidadNegocio', 'selectDepartamento', 'selectArea', 'selectMes', 'selectAnio', 'mainTableAreaIncurridos');">
                            <option value="Enero">Enero</option>
                            <option value="Febrero">Febrero</option>
                            <option value="Marzo">Marzo</option>
                            <option value="Abril">Abril</option>
                            <option value="Mayo">Mayo</option>
                            <option value="Junio">Junio</option>
                            <option value="Julio">Julio</option>
                            <option value="Agosto">Agosto</option>
                            <option value="Septiembre">Septiembre</option>
                            <option value="Octubre">Octubre</option>
                            <option value="Noviembre">Noviembre</option>
                            <option value="Diciembre">Diciembre</option>
                        </select>
                    </td>
                    <td>
                        Seleccione un A&ntilde;o:
                    </td>
                    <td>
                        <select name="selectAnio" id="selectAnio" onchange="mostrarIncurrido('filtroIncurridosCap.jsp', 'selectUnidadNegocio', 'selectDepartamento', 'selectArea', 'selectMes', 'selectAnio', 'mainTableAreaIncurridos');">
                            <%
                                for (int i = 2016; i <= 2017; i++) {
                                    out.print("<option value='" + i + "'>" + i + "</option>");
                                }
                            %>
                        </select>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <hr/>
            <div id="mainTableAreaIncurridos">
                <jsp:include page="bannerEmpresa.jsp">
                    <jsp:param name="unidadNegocio" value="<%=unidadNegocio%>" />
                </jsp:include>
                <table cellpadding="0" cellspacing="0" border="0" style="font-size:14px; text-align:center">
                    <thead>
                        <tr>
                            <td width="150px" height="30px" class="puestoTitle">Departamento</td>
                            <td width="150px" height="30px" class="puestoTitle">Area</td>
                            <td width="300px" height="30px" class="puestoTitle">Incurrido</td>
                            <td width="100px" height="30px" class="puestoTitle">A&ntilde;o</td>
                            <td width="200px" height="30px" class="puestoTitle">Enero</td>
                            <td width="200px" height="30px" class="puestoTitle">Acumulado a Enero</td>
                            <td width="50px" height="30px" class="puestoTitle">Actualizar</td>
                        </tr>
                    </thead>
                    <tbody></tbody>    
                </table>
                <div id="areaDetalle">
                    <table cellpadding="0" cellspacing="0" border="0" style="font-size:14px; text-align:center">
                        <thead>
                        </thead>
                        <tbody>
                            <%
                                consulta = objetoIncurridos.consultarIncurridosCapFiltro(unidadNegocio, identificaDepartamento, identificaArea, "" + anioMostrar);
                                if (consulta.size() > 0) {
                                    for (int i = 0; i < consulta.size(); i++) {
                                        int Idincurrido = consulta.get(i).getBal_idincurrido();
                                        String identificaIndicador = consulta.get(i).getBal_identificaIndicador();
                                        String departamento = consulta.get(i).getDepartamento();
                                        String area = consulta.get(i).getArea();
                                        String Incurrido = consulta.get(i).getBal_incurrido();
                                        int Anio = consulta.get(i).getBal_anio();
                                        Double Enero = consulta.get(i).getBal_enero();
                                        Double EneroAcumulado = consulta.get(i).getBal_eneroAcumulado();
                            %>
                            <tr>
                                <td width="150px" height="20px" class="puesto"><% out.print(departamento);%></td>
                                <td width="150px" height="20px" class="puesto"><% out.print(area);%></td>
                                <td width="300px" height="20px" class="puesto"><% out.print(Incurrido);%></td>
                                <td width="100px" height="20px" class="puesto"><% out.print(Anio);%></td>
                                <td width="200px" height="20px"><input type="number" name="enero<%=Idincurrido%>" id="enero<%=Idincurrido%>" value="<% out.print(Enero);%>" class="puesto"></td>
                                <td width="200px" height="20px"><input type="number" name="eneroAcumulado<%=Idincurrido%>" id="eneroAcumulado<%=Idincurrido%>" value="<% out.print(EneroAcumulado);%>" class="puesto"></td>
                                <td width="50px" height="20px">
                                    <a href="#"><img src="images/save.png" width="30px" height="30px" onclick="actualizarIncurridoEneroAcumulado('actualizarIncurridosCap.jsp?accion=2&usuario=Sistemas&unidadNegocio=<%=unidadNegocio%>&identificaIndicador=<%=identificaIndicador%>', '<% out.print(Idincurrido);%>', '<% out.print(Anio);%>', 'enero<%=Idincurrido%>', 'eneroAcumulado<%=Idincurrido%>', 'actulizaIncurrido');"/></a>
                                </td>

                            </tr>
                            <%
                                    }

                                }
                            %>
                        </tbody>    
                    </table>
                </div>
            </div>
            <div id="actulizaIncurrido"></div>
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
