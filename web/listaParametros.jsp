<%-- 
    Document   : listaParametros
    Created on : 29/01/2018, 04:12:11 PM
    Author     : Guadalupe
--%>


<%@page import="modelo.lista, modelo.parametros, modelo.unidades, logica.procesosFecha, java.util.ArrayList;"%>
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
        String unidadNegocio = (String) sesion.getAttribute("unidadNegocio");
        System.out.println("TIPO USUARIO: " + tipoUsuario);
        procesosFecha objFechas = new procesosFecha();
        String empresaVarGlobal = "Continental";
%>
--%>
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
        <title>Lista de Precios</title>

        <%---------------------------------------------------------------------------------------------------------------------------%>
        <link rel="stylesheet" type="text/css" href="stylesheets/demo_table_jui.css" />
        <script type="text/javascript" src="js/datatable/jquery.min.js"></script> 
        <script type="text/javascript" src="js/datatable/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="iso-8859-1">
            $(document).ready(function() {
                $('#listaPrecios').dataTable({
                    "sScrollX": 300,
                    "sScrollY": 380,
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                });
            });
        </script>        
        <%---------------------------------------------------------------------------------------------------------------------------%>
        <script type="text/javascript" src="js/Ajax/ajaxGeneral.js"></script>
        <script type="text/javascript" src="js/Ajax/ajaxPrecios.js"></script>
        <%---------------------------------------------------------------------------------------------------------------------------%>
<style>
    .puesto {color: black; font: bold 100% small-caption; padding: 3px 0px 3px 10px; box-sizing:border-box;}
    .puestoTitle {color: black; font: bold 120% small-caption; padding: 3px 50px 3px 50px;}

</style>
    </head>
    <body>
        <jsp:include page="encabezadoIntranet.jsp" />
        <%-- HEADER    ================================================== --%>	
        <jsp:include page="user.jsp">
            <jsp:param name="usuarioValidado" value="Sistemas"/>
        </jsp:include>
        <%-- ---------------------------------------------------------------------------------- --%>
        <div class="row">
            <jsp:include page="menu.jsp"/>
        </div>
        <%-- ---------------------------------------------------------------------------------- --%>	
        <div class="row">
            <%
                int[] mesAnioVigentes = new int[2];
                String mesEspanol = "";
                mesAnioVigentes[0] = 0;
                mesAnioVigentes[1] = 0;
                unidades objLista = new unidades();
                parametros objParametros = new parametros();
                procesosFecha objFechas = new procesosFecha();
                ArrayList<unidades> arrayLista = new ArrayList<unidades>();
                ArrayList<parametros> arrayParametros = new ArrayList<parametros>();
                String marcas = "";
                String empresaVarGlobal = "Continental";
                if(empresaVarGlobal.equals("Continental")){
                    marcas = "'MAR01', 'MAR02', 'MAR04', 'MAR06'";
                }
                if(empresaVarGlobal.equals("Mitsubishi")){
                    marcas = "'MAR05'";
                }
                if(empresaVarGlobal.equals("Fiat")){
                    marcas = "'MAR03'";
                }
                //arrayLista = objLista.mostrarUnidades(marcas, 2015);
                mesAnioVigentes = objLista.obtenerMesAnioPreciosVigentes();
                if(mesAnioVigentes[0] > 0 &&  mesAnioVigentes[1] > 0){
                    mesEspanol = objFechas.obtenerMesEspanol(mesAnioVigentes[0]);
                }
                arrayParametros= objParametros.consultarParametros();
            %>
            <h>Cuotas aplicables para <% out.print(mesEspanol); %> de <% out.print(mesAnioVigentes[1]); %></h5>
            <table cellpadding="0" cellspacing="0" border="0" class="display" id="listaPrecios" style="font-size:14px; text-align:center">
                <thead>
                    <tr>
                        <td width="100px" height="30px" class="puestoTitle">Identificador</td>
                        <td width="300px" height="30px" class="puestoTitle">Descripcion 1</td>
                        <td width="200px" height="30px" class="puestoTitle">Descripcion 2</td>
                        <td width="200px" height="30px" class="puestoTitle">Valor 1</td>
                        <td width="200px" height="30px" class="puestoTitle">Valor 2</td>
                        <td width="200px" height="30px" class="puestoTitle"></td>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (arrayParametros.size() > 0) {
                            for (int i = 0; i < arrayParametros.size(); i++) {
                                int Par_IdParametro = arrayParametros.get(i).getPar_IdParametro();
                                String Par_IdentificaParametro = arrayParametros.get(i).getPar_IdentificaParametro();
                                String Par_Descipcion1 = arrayParametros.get(i).getPar_Descripcion1();
                                String Par_Descipcion2 = arrayParametros.get(i).getPar_Descripcion2();
                                double Par_Valor1 = arrayParametros.get(i).getPar_Valor1();
                                double Par_Valor2 = arrayParametros.get(i).getPar_Valor2();
                                int Par_Status= arrayParametros.get(i).getPar_Status();
                    %>
                    <tr>
                        <td width="100px" height="20px"><% out.print(Par_IdentificaParametro);%></td>
                        <td width="300px" height="20px"><input style="width:100px;" type="text" id="decripcion1<%=Par_IdParametro%>" name="decripcion1<%=Par_IdParametro%>" value="<% out.print(Par_Descipcion1);%>" required/></td>
                        <td width="200px" height="20px"><input style="width:100px;" type="text" id="decripcion2<%=Par_IdParametro%>" name="decripcion2<%=Par_IdParametro%>" value="<% out.print(Par_Descipcion2);%>" required/></td>
                        <td width="200px" height="20px"><input style="width:100px;" type="number" id="valor1<%=Par_IdParametro%>" name="valor1<%=Par_IdParametro%>" min="0.00" max="99999999.99" step=".01" value="<% out.print(Par_Valor1);%>" required/></td>
                        <td width="200px" height="20px"><input style="width:100px;" type="number" id="valor2<%=Par_IdParametro%>" name="valor2<%=Par_IdParametro%>" min="0.00" max="99999999.99" step=".01" value="<% out.print(Par_Valor2);%>" required/></td>
                        <td width="200px" height="20px"><input type="button" name="actualizar" id="actualizar" value="Actualizar" onclick="actualizarPrecio('actualizarParametros.jsp?accion=2&usuario=Sistemas', '<% out.print(Par_IdParametro);%>', 'decripcion1<%=Par_IdParametro%>', 'decripcion2<%=Par_IdParametro%>', 'valor1<%=Par_IdParametro%>', 'valor2<%=Par_IdParametro%>', 'actulizaParametro');"/></td>
                    </tr>
                    <% 
                            }
                        }
                    %>
                </tbody>
            </table>
            <div id="actulizaParametro"></div>
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
<%--
<%
    }
%>
--%>