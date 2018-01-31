<%-- 
    Document   : generar
    Created on : 9/01/2015, 09:08:46 AM
    Author     : REDES
--%>

<%@page import="modelo.lista, modelo.unidades, logica.procesosFecha, java.util.ArrayList;"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<%
    //HttpSession sesion = request.getSession();
        //String usuarioValidado = (String) sesion.getAttribute("usuarioIngresado");
        //System.out.println("USUARIO: " + usuarioValidado);
        //if (usuarioValidado == null) {
        //  response.sendRedirect("acceso.jsp");
        // } else {
        //   String idPersonaUsuario = (String) sesion.getAttribute("idPersonaUsuario");
        // String tipoUsuario = (String) sesion.getAttribute("tipoUsuarioIngresado");
        //String unidadNegocio = (String) sesion.getAttribute("unidadNegocio");
        //System.out.println("TIPO USUARIO: " + tipoUsuario);
        // procesosFecha objFechas = new procesosFecha();
        // String empresaVarGlobal = "Continental";
        //int anioLista = 2015;
        //try {
        //   empresaVarGlobal = request.getParameter("empresaVarGlobal");
        //} catch (Exception e) {
    }
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
        <title>Balance Score Card</title>

        <%---------------------------------------------------------------------------------------------------------------------------%>
        <link rel="stylesheet" type="text/css" href="stylesheets/demo_table_jui.css" />
        <script type="text/javascript" src="js/datatable/jquery.min.js"></script> 
        <script type="text/javascript" src="js/datatable/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="iso-8859-1">
            $(document).ready(function () {
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
        <jsp:include page="control/conexion.jsp" />
        <jsp:include page="modelo/indicadores.jsp"/>
        <jsp:include page="modelo/areas.jsp" />
        <jsp:include page="modelo/departamentos.jsp" />
        indicadores objIndicadores = new indicadores();
        <style>
            .puesto {color: black; font: bold 100% small-caption; padding: 3px 0px 3px 10px; box-sizing:border-box;}
            .puestoTitle {color: black; font: bold 120% small-caption; padding: 3px 50px 3px 50px;}

        </style>
    </head>
    <body>
        <jsp:include page="encabezadoIntranet.jsp" />
        <%-- HEADER    ================================================== --%>	
        <jsp:include page="user.jsp">


            <fieldset width='300'>
                <legend><img src='images/10-Computer-Blue-Sky.ico' width='20' height='20'/> CONSULTA DE INDICADORES </legend><br/>
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="indicadores" style="font-size:17px; text-align:center">
                    <thead style="font-size:12px">
                        <tr>
                            <th>ID</th>
                            <th>DEPARTAMENTO</th>
                            <th>AREA</th>
                            <th>INDICADOR</th>
                            <th>GLOBAL</th>
                            <!--                                <th>ENERO</th>
                                                            <th>FEBRERO</th>
                                                            <th>MARZO</th>
                                                            <th>ABRIL</th>
                                                            <th>MAYO</th>
                                                            <th>JUNIO</th>
                                                            <th>JULIO</th>
                                                            <th>AGOSTO</th>
                                                            <th>SEPTIEMBRE</th>
                                                            <th>OCTUBRE</th>
                                                            <th>NOVIEMBRE</th>
                                                            <th>DICIEMBRE</th>-->
                            <th>PUNTOS OPTIMOS</th>
                            <?php // if ($tipo_usuario_verificado == 'ADMINISTRADOR'): ?>
                            <th>ACCI&Oacute;N</th>
                            <?php // endif; ?>
                        </tr>
                    </thead>
                    <tfoot style="font-size:12px">
                        <tr>
                            <th>ID</th>
                            <th>DEPARTAMENTO</th>
                            <th>AREA</th>
                            <th>INDICADOR</th>
                            <th>GLOBAL</th>
                            <!--                                <th>ENERO</th>
                                                            <th>FEBRERO</th>
                                                            <th>MARZO</th>
                                                            <th>ABRIL</th>
                                                            <th>MAYO</th>
                                                            <th>JUNIO</th>
                                                            <th>JULIO</th>
                                                            <th>AGOSTO</th>
                                                            <th>SEPTIEMBRE</th>
                                                            <th>OCTUBRE</th>
                                                            <th>NOVIEMBRE</th>
                                                            <th>DICIEMBRE</th>-->
                            <th>PUNTOS OPTIMOS</th>
                            <!--<?php // if ($tipo_usuario_verificado == 'ADMINISTRADOR'): ?>-->
                            <th>ACCI&Oacute;N</th>
                            <!--<?php // endif; ?>-->
                        </tr>
                    </tfoot>


                    <!--                                            <td>$enero</td>
                                                                <td>$febrero</td>
                                                                <td>$marzo</td>
                                                                <td>$abril</td>
                                                                <td>$mayo</td>
                                                                <td>$junio</td>
                                                                <td>$julio</td>
                                                                <td>$agosto</td>
                                                                <td>$septiembre</td>
                                                                <td>$octubre</td>
                                                                <td>$noviembre</td>
                                                                <td>$diciembre</td>-->
                    <tbody>
                        <%
//                            $query = $obj_indicadores->consulta_indicadores_area_departamentos();
                            query  = objindicadores -> consulta_indicadores_area_departamentos();
                            $filas  = mysql_num_rows($query);
                            if ($filas

                                
                                > 0) {
                            for ($i = 0; $i < $filas; $i++) {
                                    $id_indicador = mysql_result($query, $i, 0);
                                    $id_departamento = mysql_result($query, $i, 3);
                                    $id_area = mysql_result($query, $i, 2);
                                    $indicador = mysql_result($query, $i, 1);
                                    $global = mysql_result($query, $i, 4);
//                                    $enero = mysql_result($query, $i, 5);
//                                    $febrero = mysql_result($query, $i, 6);
//                                    $marzo = mysql_result($query, $i, 7);
//                                    $abril = mysql_result($query, $i, 8);
//                                    $mayo = mysql_result($query, $i, 9);
//                                    $junio = mysql_result($query, $i, 10);
//                                    $julio = mysql_result($query, $i, 11);
//                                    $agosto = mysql_result($query, $i, 12);
//                                    $septiembre = mysql_result($query, $i, 13);
//                                    $octubre = mysql_result($query, $i, 14);
//                                    $noviembre = mysql_result($query, $i, 15);
//                                    $diciembre = mysql_result($query, $i, 16);
                                    $puntos_optimos = mysql_result($query, $i, 5);
                                    echo"<tr style=\"font-size:13px\">
                                        <td > $id_indicador <  / td
                                            > <td>$id_departamento</td
                                            > <td>$id_area</td
                                            > <td>$indicador</td
                                            > <td>$global</td
                                            > <td>$puntos_optimos</td >";
//                                    if ($tipo_usuario_verificado == 'ADMINISTRADOR') {
                                echo" 
                                        <td
                                            > <a 
                                    href ='editar_indicador.php?tipo_accion_indicador=2&id_indicador=$id_indicador'
                                    ><IMG SRC ='images/editar.png'
                                    WIDTH = 18 HEIGHT = 18 ALIGN = middle ALT ='editar'></a >
                                            & raquo;
                                    <a  href ='editar_indicador.php?tipo_accion_indicador=0&id_indicador=$id_indicador'
                                    ><IMG SRC ='images/eliminar2.png'
                                    WIDTH = 18 HEIGHT = 18 ALIGN = middle ALT ='eliminar'></a
                                            > < / td >";
//                                    }
                                echo 
                                

                            "</tr>";
                            }
                        } else {
                            echo "<tr>
                                    <td > & nbsp;< / td
                                        > <td 
                                colspan ='17'><h1 > <font 
                                color =\"#F00\">NO SE ENCONTRARON INDICADORES</font></h1></td>
                                    <td > & nbsp;< / td
                                        > < / tr >
                                
                        ";
                        }
                        %>           
                    </tbody>
                </table> 
                <br/>            
            </fieldset>
            <?php // if ($tipo_usuario_verificado == 'ADMINISTRADOR'): ?>
            <form action='editar_indicador.php' method='post'>
                <table align='right'>
                    <tr>
                        <td align='center' style="background: #FFF;">
                            <input type='hidden' name='tipo_accion_indicador' id='tipo_accion_indicador' value=1/>
                            <input type='image' width="130px" height="50px" src="images/cotizar.jpg"  value='NUEVO INDICADOR' Class='submit'></td>
                    </tr>
                </table>
            </form>
            <!-- <?php // endif; ?>-->
        </div>
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