<%@page import="modelo.indicador, modelo.incurridos, modelo.parametros, modelo.procesosFecha, java.text.DecimalFormat, java.util.ArrayList;"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<%
  HttpSession sesion = request.getSession();
    String nombre = (String) sesion.getAttribute("usuarioIngresado"); 
     String pass = (String) sesion.getAttribute("passwordIngresado"); 
     String NombreUsuario = (String) sesion.getAttribute("NombreUsuario"); 
      String Puesto = (String) sesion.getAttribute("Puesto"); 
%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="format-detection" content="telephone=no">
        <meta charset="UTF-8">
        <meta name="description" content="Violate Responsive Admin Template">
        <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

        <title>Super Admin Responsive Template</title>
             <%---------------------------------------------------------------------------------------------------------------------------%>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/icons.css" rel="stylesheet">
        <link href="css/generics.css" rel="stylesheet">
        <link href="css/calendar.css" rel="stylesheet">
        
        
        <link rel="stylesheet" href="stylesheet/responsive.css">
        <link rel="stylesheet" href="stylesheet/style.css">
    
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
    
    <body id="skin-blur-blue">

        <header id="header" class="media">
            <a href="" id="menu-toggle"></a> 
            <a class="logo pull-left" href="">BSCI</a>
            
            <div class="media-body">
                <div class="media" id="top-menu">
                    <div id="time" class="pull-right">
                        <span id="hours"></span>
                        :
                        <span id="min"></span>
                        :
                        <span id="sec"></span>
                    </div>
                </div>
            </div>
        </header>
        
        <div class="clearfix"></div>
        
       
            
            <!-- Sidebar -->
            <aside id="sidebar">
                
                <!-- Sidbar Widgets -->
                <div class="side-widgets overflow">
                    <!-- Profile Menu -->
                    <div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
                        <a href="" data-toggle="dropdown">
                            <img class="profile-pic animated" src="images/avatar/<%=nombre%>.jpg" alt="">
                        </a>
                        <ul class="dropdown-menu profile-menu">
                           <li><a href="cerrarSesion.jsp">Salir</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                        </ul>
                        <h4 class="m-0"><%=NombreUsuario%></h4>
                        <%=Puesto%>  
                    </div>
                      <!-- Calendar -->
                    <div class="s-widget m-b-25">
                        <div id="sidebar-calendar">
                            
                        </div>
                  
                    </div>
                    
                    <!-- Parte del menu -->
                    <div class="s-widget m-b-25">
                        <div class="s-widget-body">
                            <div class="side-border">
                            </div>
                            <div class="side-border">
                            </div>
                            <div class="side-border">
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Side Menu -->
                 <ul class="list-unstyled side-menu">
                    <li class="active">
                        <a href=""><i class="fa fa-folder-open-o fa-2x"></i>
                            <span  class="menu-item">BSCI</span>
                        </a>
                        <ul class="list-unstyled menu-item">
                            <li><a href="ReportesG.jsp">Reportes</a></li>
                             <li><a href="ReportesG_Anual.jsp">BSCI Anual</a></li> 
                            <li><a href="GenerarResultadoBSC.jsp">Resultados BSCI</a></li>
                            <li><a href="GenerarResultadoBSC_Anual.jsp">Resultados BSCI Anual</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                         <a href=""><i class="fa fa-file-text-o fa-2x"></i>
                             <span class="menu-item">Indicadores</span>
                         </a>
                        <ul class="list-unstyled menu-item">
                            <li><a href="IndicadorC.jsp?empresa=Continental">Continental</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Lerma">Lerma</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Tenancingo">Tenancingo</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Atlacomulco">Atlacomulco</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Mitsuautos">Mitsubishi</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Automodena">Fiat Metepec</a></li>
                            <li><a href="IndicadorC.jsp?empresa=KoreanMotors">Hyundai Metepec</a></li>
                            <li><a href="IndicadorC.jsp?empresa=HyundaiPatriotismo">Hyundai Patriotismo</a></li>
                            <li><a href="IndicadorC.jsp?empresa=HyundaiSantaFe">Hyundai Santa Fe</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Autopolanco">San Rafael</a></li>
                            <li><a href="IndicadorC.jsp?empresa=AutopolancoFiat">Autopolanco Fiat</a></li>
                            <li><a href="IndicadorC.jsp?empresa=AutopolancoChrysler">Autopolanco CDFJR</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Nihon">Toyota Santa Fe</a></li>
                            <li><a href="IndicadorC.jsp?empresa=PuertaSantaFe">Puerta Santa Fe</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Alfa-Auto">Alfa-Auto</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Mitsu-Auto">Mitsu-Auto</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="VistaAreas.jsp"><i class="fa fa-list-alt fa-2x"></i>
                            <span class="menu-item">Areas</span>
                        </a>
                    </li>
                     <li>
                        <a href="VistaDepartamentos.jsp"><i class="fa fa-building-o fa-2x"></i>
                            <span class="menu-item">Departamentos</span>
                        </a>
                    </li>
                     <li class="dropdown">
                        <a href=""><i class="fa fa-table fa-2x"></i>
                            <span class="menu-item">Incurridos</span>
                        </a>
                        <ul class="list-unstyled menu-item">
                            <li><a href="VistaIncurridosNormal.jsp">Normales</a></li>
                            <li><a href="VistaIncurridosAcumulados.jsp">Con acumulados capturados</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="sa-side-chart" href="http://grupocontinentalautomotriz.com.mx/BI6R_V3/acceso.jsp"> 
                            <span class="menu-item">BIV3</span>
                        </a>
                    </li>
                 </ul>
            </aside>
        
            <!-- Content -->
            <section id="content" class="container">
                
                <!-- Notification Drawer -->
                 <p style="text-align: center;"><FONT SIZE=8>GRUPO CONTINENTAL AUTOMOTRIZ</FONT>
                 </p>

                 <br/><br/>

                 <p style="text-align: center;"><FONT SIZE=6>Indicadores</FONT>
                 </p>
                <!-- DATOS-->
                <div class="block-area" id="custom-select">

                
                    <img src="img/agencias/<%=empresa%>.png" width="170" height="55" class=" center-block">
                    <br/>
                 
                    </div>
        
                    
                <!--  Table -->
                <div class="block-area select" id="tableStriped">
                    <h3 class="block-title">Registros</h3>
                    <%                
                indicador objetoIndicador = new indicador();
                ArrayList<indicador> consulta = new ArrayList();
                consulta = objetoIndicador.consultarIndicador(empresa);
                int tabindex = 0;
                
            %> 
            
            <div class="table-responsive">
               
                <table class="tile table table-bordered table-striped" id="listaFacturas" style=" width: 67%;">
                            <thead>
                                <tr>
                                    <th style=" width: 5%; text-align: center;">Acción</th>
                                    <th style=" width: 13%; text-align: center;">Departamento</th>
                                    <th style=" width: 10%; text-align: center;">Area</th>
                                    <th style=" width: 37%; text-align: center;">Indicador</th>
                                    <th style=" width: 11%; text-align: center;">Objetivo Global</th>
                                    <th style=" width: 11%; text-align: center;">Puntos Optimos</th>
                                    <th style=" width: 8%; text-align: center;">Operacion</th>
                                    <th style=" width: 8%; text-align: center;">Medida</th>
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
                            <td style=" width: 5.3%;"></td>
                            <td style=" width: 13%;"><% out.print(departamento);%></td>
                            <td style=" width: 9%;"><% out.print(area);%></td>
                            <td style=" width: 32%;"><% out.print(Indicador);%></td>
                            <td><% out.print(objDecimal.format(ObjGlobal));%></td>
                            <td><% out.print(PuntosOptimo);%></td>
                            <td><% out.print(Operacion);%></td>
                            <td><% out.print(Medida);%></td>
                        </tr>
                        <%
                                    }
                            }
                        %>
                            </tbody>
                        </table>
                    </div>
                   
                </div> 
                 
        </section>
                            <script>
                            var emp=<% out.print(empresa);%>;
                            </script>
        <!-- Javascript Libraries -->
        <!-- jQuery -->
<!-- Javascript Libraries -->
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script> <!-- jQuery Library -->
        <script src="js/jquery-ui.min.js"></script> <!-- jQuery UI -->
        
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        
        <!--  Form Related -->
        <script src="js/validation/validate.min.js"></script> <!-- jQuery Form Validation Library -->
        <script src="js/validation/validationEngine.min.js"></script> <!-- jQuery Form Validation Library - requirred with above js -->
        <script src="js/select.min.js"></script> <!-- Custom Select -->
        <script src="js/chosen.min.js"></script> <!-- Custom Multi Select -->
        <script src="js/datetimepicker.min.js"></script> <!-- Date & Time Picker -->
        <script src="js/colorpicker.min.js"></script> <!-- Color Picker -->
        <script src="js/icheck.js"></script> <!-- Custom Checkbox + Radio -->
        <script src="js/autosize.min.js"></script> <!-- Textare autosize -->
        <script src="js/toggler.min.js"></script> <!-- Toggler -->
        <script src="js/input-mask.min.js"></script> <!-- Input Mask -->
        <script src="js/spinner.min.js"></script> <!-- Spinner -->
        <script src="js/slider.min.js"></script> <!-- Input Slider -->
        <script src="js/fileupload.min.js"></script> <!-- File Upload -->
        
        <!-- Text Editor -->
        <script src="js/editor.min.js"></script> <!-- WYSIWYG Editor -->
        <script src="js/markdown.min.js"></script> <!-- Markdown Editor -->
        
        <!-- UX -->
        <script src="js/scroll.min.js"></script> <!-- Custom Scrollbar -->
        
        <!-- Other -->
        <script src="js/feeds.min.js"></script> <!-- News Feeds -->
           <script src="js/calendar.min.js"></script> <!-- -->
        
        <!-- All JS functions -->
        <script src="js/functions.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function(){
                /* Tag Select */
                (function(){
                    /* Limited */
                    $(".tag-select-limited").chosen({
                        max_selected_options: 5
                    });
                    
                    /* Overflow */
                    $('.overflow').niceScroll();
                })();
                
                /* Input Masking - you can include your own way */
                (function(){
                    $('.mask-date').mask('00/00/0000');
                    $('.mask-time').mask('00:00:00');
                    $('.mask-date_time').mask('00/00/0000 00:00:00');
                    $('.mask-cep').mask('00000-000');
                    $('.mask-phone').mask('0000-0000');
                    $('.mask-phone_with_ddd').mask('(00) 0000-0000');
                    $('.mask-phone_us').mask('(000) 000-0000');
                    $('.mask-mixed').mask('AAA 000-S0S');
                    $('.mask-cpf').mask('000.000.000-00', {reverse: true});
                    $('.mask-money').mask('000.000.000.000.000,00', {reverse: true});
                    $('.mask-money2').mask("#.##0,00", {reverse: true, maxlength: false});
                    $('.mask-ip_address').mask('0ZZ.0ZZ.0ZZ.0ZZ', {translation: {'Z': {pattern: /[0-9]/, optional: true}}});
                    $('.mask-ip_address').mask('099.099.099.099');
                    $('.mask-percent').mask('##0,00%', {reverse: true});
                    $('.mask-credit_card').mask('0000 0000 0000 0000');
                })();
                
                /* Spinners */
                (function(){
                    //Basic
                    $('.spinner-1').spinedit();
                    
                    //Set Value
                    $('.spinner-2').spinedit('setValue', 100);
                    
                    //Set Minimum                    
                    $('.spinner-3').spinedit('setMinimum', -10);
                    
                    //Set Maximum                    
                    $('.spinner-4').spinedit('setMaxmum', 100);
                    
                    //Set Step
                    $('.spinner-5').spinedit('setStep', 10);
                    
                    //Set Number Of Decimals
                    $('.spinner-6').spinedit('setNumberOfDecimals', 2);
                })();
            });
        </script>
               <%---------------------------------------------------------------------------------------------------------------------------%>
       
        <script type="text/javascript" src="js/datatable/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="iso-8859-1">
            $(document).ready(function () {
                $('#listaFacturas').dataTable({
                    "sScrollX": 1200,
                    "sScrollY": 200,
                    "bJQueryUI": true,
                    "sPaginationType": "full_numbers"
                    
                });
            });
        </script>        
        <%---------------------------------------------------------------------------------------------------------------------------%>
        <script type="text/javascript" src="js/Ajax/ajaxBalance.js"></script>
        <%---------------------------------------------------------------------------------------------------------------------------%>
        
        
    </body>
</html>
