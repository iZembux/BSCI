<%-- 
    Document   : IndicadorContinental
    Created on : 29/01/2018, 12:26:25 PM
    Author     : Auxiliar 

--%>

<%@page import="modelo.indicador, modelo.incurridos, modelo.parametros, modelo.procesosFecha, java.text.DecimalFormat, java.util.ArrayList;"%>
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
        int anioLista = 2015;
        try {
            empresaVarGlobal = request.getParameter("empresaVarGlobal");
        } catch (Exception e) {
        }
%>--%>

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
        <title>Grupo Continental - Indicadores</title>

        <%---------------------------------------------------------------------------------------------------------------------------%>
        <link rel="stylesheet" type="text/css" href="stylesheets/demo_table_jui.css" />
        <script type="text/javascript" src="js/datatable/jquery.min.js"></script> 
        <script type="text/javascript" src="js/datatable/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="iso-8859-1">
            $(document).ready(function () {
                $('#listaFacturas').dataTable({
                    "sScrollX": 300,
                    "sScrollY": 380,
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                });
            });
        </script>        
        <%---------------------------------------------------------------------------------------------------------------------------%>
        <script type="text/javascript" src="js/Ajax/ajaxBalance.js"></script>
        <%---------------------------------------------------------------------------------------------------------------------------%>
        <style>
            .puesto {color: black; font: bold 100% small-caption; padding: 3px 5px 3px 5px; box-sizing:border-box; text-align: left;}
            .puestoTitle {color: black; font: bold 120% small-caption; padding: 3px 5px 3px 5px; box-sizing:border-box; text-align: left;}

        </style>
    </head>
 
<%
    String unidadNegocio = "Continental";
    DecimalFormat objDecimal = new DecimalFormat("###,###.##");
    /*
     try{
     unidadNegocio = request.getParameter("unidadNegocio");
     }catch(Exception e){}
     */

    int accion = 0;
    String empresa = "";
    String cadena = "";
    try {
        accion = Integer.parseInt(request.getParameter("accion"));
    } catch (Exception e) {
        accion = 3;
    }
    try {
        empresa = request.getParameter("empresa");
        System.out.println("empresa.- " + empresa);
    } catch (Exception e) {
        System.out.println("No se pudo leer empresa del indicador");
    }

    indicador objIndicador = new indicador();
    incurridos objIncurridos = new incurridos();
    parametros objParametros = new parametros();
    //ACCION = 0  -> ELIMINAR INDICADOR 
    //ACCION = 1  -> INSERTA INDICADOR 
    //ACCION = 2  -> ACTUALIZAR INDICADOR 
    //ACCION = 3  -> PARA QUE NO MARQUE ERROR
    String identificaIndicador = "";
    String identificador = "";
    //String empresa = "";
    String identificaDepartamento = "";
    String identificaArea = "";
    String balindicador = "";
    Double objGlobal = 0.0;
    Double balenero = 0.0;
    Double balfebrero = 0.0;
    Double balmarzo = 0.0;
    Double balabril = 0.0;
    Double balmayo = 0.0;
    Double baljunio = 0.0;
    Double baljulio = 0.0;
    Double balagosto = 0.0;
    Double balseptiembre = 0.0;
    Double baloctubre = 0.0;
    Double balnoviembre = 0.0;
    Double baldiciembre = 0.0;
    Double balPOptimos = 0.0;
    int balredondeo = 0;
    int baleditable = 0;
    String baloperacion = "";
    String balmedida = "";
    String baloperaAcumulado = "";
    int balactivo = 0;
    int anio = 0;
    int ok = 1;
    if (accion > 0 && accion < 3) {

        try {
            identificaIndicador = request.getParameter("identificaIndicador");
            System.out.println("identificaIndicador.- " + identificaIndicador);
        } catch (Exception e) {
            System.out.println("No se pudo leer identifica indicador");
        }

        try {
            identificador = request.getParameter("identificador");
        } catch (Exception e) {
            System.out.println("No se pudo leer identificador");
        }

        try {
            empresa = request.getParameter("empresa");
        } catch (Exception e) {
            System.out.println("No se pudo leer empresa");
        }

        try {
            identificaDepartamento = request.getParameter("identificaDepartamento");
        } catch (Exception e) {
            System.out.println("No se pudo leer identificaDepartamento");
        }
        
        try {
            identificaArea = request.getParameter("identificaArea");
        } catch (Exception e) {
            System.out.println("No se pudo leer identificaArea");
        }
        
        try {
            balindicador = request.getParameter("balindicador");
        } catch (Exception e) {
            System.out.println("No se pudo leer balindicador");
        }
        
        try {
            objGlobal = Double.parseDouble(request.getParameter("objGlobal"));
        } catch (Exception e) {
            System.out.println("No se pudo leer objGlobal");
        }
        
        try {
            balenero = Double.parseDouble(request.getParameter("balenero"));
        } catch (Exception e) {
            System.out.println("No se pudo leer  balenero");
        }
        
        try {
            balfebrero = Double.parseDouble(request.getParameter("balfebrero"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balfebrero");
        }
        
        try {
            balmarzo = Double.parseDouble(request.getParameter("balmarzo"));
        } catch (Exception e) {
            System.out.println("No se pudo leer  balmarzo");
        }
        
        try {
            balabril = Double.parseDouble(request.getParameter("balabril"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balabril");
        }
        

        try {
            balmayo = Double.parseDouble(request.getParameter("balmayo"));
        } catch (Exception e) {
            System.out.println("No se pudo leer  balmayo");
        }
        

        try {
            baljunio = Double.parseDouble(request.getParameter("baljunio"));
        } catch (Exception e) {
            System.out.println("No se pudo leer baljunio");
        }
        
        try {
            baljulio = Double.parseDouble(request.getParameter("baljulio"));
        } catch (Exception e) {
            System.out.println("No se pudo leer baljulio");
        }
        
        try {
            balagosto = Double.parseDouble(request.getParameter("balagosto"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balagosto");
        }
        

        try {
            balseptiembre = Double.parseDouble(request.getParameter("balseptiembre"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balseptiembre");
        }
        
        try {
            baloctubre = Double.parseDouble(request.getParameter("baloctubre"));
        } catch (Exception e) {
            System.out.println("No se pudo leer baloctubre");
        }
        
        try {
            balnoviembre = Double.parseDouble(request.getParameter("balnoviembre"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balnoviembre");
        }
        
        try {
            baldiciembre = Double.parseDouble(request.getParameter("baldiciembre"));
        } catch (Exception e) {
            System.out.println("No se pudo leer baldiciembre");
        }
        
        try {
            balPOptimos = Double.parseDouble(request.getParameter("balPOptimos"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balPOptimos");
        }
        
        try {
            balPOptimos = Double.parseDouble(request.getParameter("balPOptimos"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balPOptimos");
        }
        
        try {
            baloperacion = request.getParameter("baloperacion");
        } catch (Exception e) {
            System.out.println("No se pudo leer baloperacion");
        }
        
        try {
            balmedida = request.getParameter("balmedida");
        } catch (Exception e) {
            System.out.println("No se pudo leer balmedida");
        }

        try {
            balredondeo = Integer.parseInt(request.getParameter("balredondeo"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balredondeo");
        }
        
        try {
            baleditable = Integer.parseInt(request.getParameter("baleditable"));
        } catch (Exception e) {
            System.out.println("No se pudo leer baleditable");
        }

        try {
            baloperaAcumulado = request.getParameter("baloperaAcumulado");
        } catch (Exception e) {
            System.out.println("No se pudo leerbal operaAcumulado");
        }
        
        try {
            balactivo = Integer.parseInt(request.getParameter("balactivo"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balactivo");
        }
        try {
            anio = Integer.parseInt(request.getParameter("balanio"));
        } catch (Exception e) {
            System.out.println("No se pudo leer balanio");
        }
    }
    
    /*  try {
     anio = Integer.parseInt(request.getParameter("anio"));
     } catch (Exception e) {
     System.out.println("No se pudo leer anio");
     }*/
    ok = 1;
    switch (accion) {
        case 0:
            //PARA ELIMINAR EL INDICADOR
            break;
        case 1:
            //PARA INSERTAR EL INDICADOR
            int consecutivo = 0;
            cadena = "";
            identificaIndicador = "BAL_ID";
            consecutivo = (int) objParametros.consultarConsecutivoIndicador();
            cadena = consecutivo+"";
            for(int i=cadena.length(); i < 3; i++){
                identificaIndicador += "0";
            }
            identificaIndicador += cadena;
            ok = objIndicador.insertarIndicador(identificaIndicador, empresa, identificaDepartamento, identificaArea, balindicador, objGlobal, balenero, balfebrero, balmarzo, balabril, balmayo, baljunio, baljulio, balagosto, balseptiembre, baloctubre, balnoviembre, baldiciembre, balPOptimos, baloperacion, balmedida, baloperaAcumulado, balredondeo, baleditable, anio);
            if(ok == 0){
                ok = 1;
                ok = objIncurridos.insertarIncurrido(identificaIndicador, empresa, balindicador, anio);
                if (ok == 0) {
                    ok = 1;
                    ok = objParametros.actualizarConsecutivoIndicador();
                    if (ok == 0) {
                        out.print("<center><img onload=\"mensaje('Insercion correcta de INDICADOR');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
                    } else {
                        out.print("<center><img onload=\"mensaje('Ocurrio un ERROR al actualizar consecutivo de IINDICADOR');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
                    }
                } else {
                    out.print("<center><img onload=\"mensaje('Ocurrio un ERROR al insertar INCURRIDO');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
                }
            } else {
                out.print("<center><img onload=\"mensaje('Ocurrio un ERROR al insertar INDICADOR');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
            }
            break;
        case 2:
            ok = 1;
            ok = objIndicador.actualizarIncurrido(identificaIndicador, empresa, identificaDepartamento, identificaArea, balindicador, objGlobal, balenero, balfebrero, balmarzo, balabril, balmayo, baljunio, baljulio, balagosto, balseptiembre, baloctubre, balnoviembre, baldiciembre, balPOptimos, balredondeo, baleditable, baloperacion, balmedida, baloperaAcumulado, balactivo, anio);
            //----------------------------------------PARA ACTUALIZAR EL INDICADOR
            if (ok == 0) {
                out.print("<center><img onload=\"mensaje('Actualizacion correcta de INDICADOR');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
            } else {
                out.print("<center><img onload=\"mensaje('Ocurrio un ERROR al actualizar INCURRIDO');\" src='images/ok.ico' id='icoOk' width='1px' height='1px'></center>");
            }
            break;
        case 3:
            //PARA ACTUALIZAR EL INDICADOR
            //System.out.println("No se recibio parametro accion de vists indicador ");
    }

%>
    <body>
        <jsp:include page="Estructura.jsp" />
        <%-- HEADER    ================================================== --%>	
        
        <jsp:include page="bannerEmpresa.jsp">
            <jsp:param name="unidadNegocio" value="<%=empresa%>"/>
        </jsp:include>

        <%--    <jsp:include page="user.jsp">
                <jsp:param name="usuarioValidado" value="<%=usuarioValidado%>"/>
            </jsp:include>%>
        <%-- ---------------------------------------------------------------------------------- --%>
        <%-- ---------------------------------------------------------------------------------- --%>	
        <p><br/></p>
        <div class="row">
            <%                
                indicador objetoIndicador = new indicador();
                ArrayList<indicador> consulta = new ArrayList();
                consulta = objetoIndicador.consultarIndicador(empresa);
                int tabindex = 0;
            %>
            <div id="mainTableAreaEmployees">
                <table cellpadding="0" cellspacing="0" border="0" class="display" id="listaFacturas" style="font-size:14px; text-align:center">
                    <thead>
                        <tr>
                            <td width="50px" height="30px" class="puestoTitle">Accion</td>
                            <td width="150px" height="30px" class="puestoTitle">Departamento</td>
                            <td width="150px" height="30px" class="puestoTitle">Area</td>
                            <td width="250px" height="30px" class="puestoTitle">Indicador</td>
                            <td width="100px" height="30px" class="puestoTitle">ObjGlobal</td>
    <%--
                            <td width="100px" height="30px" class="puestoTitle">Enero</td>
                            <td width="100px" height="30px" class="puestoTitle">Febrero</td>
                            <td width="100px" height="30px" class="puestoTitle">Marzo</td>
                            <td width="100px" height="30px" class="puestoTitle">Abril</td>
                            <td width="100px" height="30px" class="puestoTitle">Mayo</td>
                            <td width="100px" height="30px" class="puestoTitle">Junio</td>
                            <td width="100px" height="30px" class="puestoTitle">Julio</td>
                            <td width="100px" height="30px" class="puestoTitle">Agosto</td>
                            <td width="100px" height="30px" class="puestoTitle">Septiembre</td>
                            <td width="100px" height="30px" class="puestoTitle">Octubre</td>
                            <td width="100px" height="30px" class="puestoTitle">Noviembre</td>
                            <td width="100px" height="30px" class="puestoTitle">Diciembre</td>
    --%>
                            <td width="100px" height="30px" class="puestoTitle">PuntosOptimos</td>
                            <td width="100px" height="30px" class="puestoTitle">Operacion</td>
                            <td width="100px" height="30px" class="puestoTitle">Medida</td>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (consulta.size() > 0) {
                                for (int i = 0; i < consulta.size(); i++) {

                                    int Idindicador = consulta.get(i).getBal_idIndicador();
                                    String departamento = consulta.get(i).getBal_departamento();
                                    String area = consulta.get(i).getBal_area();
                                    int Iddepartamento = consulta.get(i).getBal_idDepartamento();
                                    int IdArea = consulta.get(i).getBal_idArea();
                                    String Indicador = consulta.get(i).getBal_indicador();
                                    Double ObjGlobal = consulta.get(i).getBal_objGlobal();
                                    Double Enero = consulta.get(i).getBal_enero();
                                    Double Febrero = consulta.get(i).getBal_febrero();
                                    Double Marzo = consulta.get(i).getBal_marzo();
                                    Double Abril = consulta.get(i).getBal_abril();
                                    Double Mayo = consulta.get(i).getBal_mayo();
                                    Double Junio = consulta.get(i).getBal_junio();
                                    Double Julio = consulta.get(i).getBal_julio();
                                    Double Agosto = consulta.get(i).getBal_agosto();
                                    Double Septiembre = consulta.get(i).getBal_septiembre();
                                    Double Octubre = consulta.get(i).getBal_octubre();
                                    Double Noviembre = consulta.get(i).getBal_noviembre();
                                    Double Diciembre = consulta.get(i).getBal_diciembre();
                                    Double PuntosOptimo = consulta.get(i).getBal_puntosOptimos();
                                    String Operacion = consulta.get(i).getBal_operacion();
                                    String Medida = consulta.get(i).getBal_medida();
                                    int Activo = consulta.get(i).getBal_activo();
                                    try {

                                    } catch (Exception e) {
                                    }
                        %>
                        <tr>
                            <%--<td width="200px" height="20px" class="puesto"><% out.print(Idindicador);%></td>--%>
                            <%--Llenando la tabla....
                            --%>
                            <td width="50px" height="20px" class="puesto"><a href="formulario.jsp?accion=2&idIndicador=<%=Idindicador%>&empresa=<%=empresa%>"><img src="images/editar.png" width="30px" height="30px"></a></td>
                            <td width="150px" height="20px" class="puesto"><% out.print(departamento);%></td>
                            <td width="150px" height="20px" class="puesto"><% out.print(area);%></td>
                            <td width="250px" height="20px" class="puesto"><% out.print(Indicador);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(objDecimal.format(ObjGlobal));%></td>
        <%--
                            <td width="100px" height="20px" class="puesto"><% out.print(Enero);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Febrero);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Marzo);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Abril);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Mayo);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Junio);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Julio);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Agosto);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Septiembre);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Octubre);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Noviembre);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Diciembre);%></td>
--%>
                            <td width="100px" height="20px" class="puesto"><% out.print(PuntosOptimo);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Operacion);%></td>
                            <td width="100px" height="20px" class="puesto"><% out.print(Medida);%></td>
                        </tr>
                        <%
                                }

                            }
                        %>
                    </tbody>    
                </table>
            </div>
            <form action="formulario.jsp">
                <input type="hidden" name="accion" id="accion" value="1" />
                <input name="send" id="send" type="submit" class="submit" value="Nuevo" />
            </form>
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
