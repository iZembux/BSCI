<%-- 
    Document   : VistaDepartamentos
    Created on : 29/01/2018, 02:02:55 PM
    Author     : Guadalupe
--%>

<%@page import="modelo.departamentos, modelo.procesosFecha, java.util.ArrayList;"%>
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
        
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/form.css" rel="stylesheet">
        <link href="css/calendar.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/icons.css" rel="stylesheet">
        <link href="css/generics.css" rel="stylesheet">
        
        
        
    </head>
    <body id="skin-blur-blue">

        <header id="header" class="media">
            <a href="" id="menu-toggle"></a> 
            <a class="logo pull-left" href="index.html">BSCI</a>
            
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
        
        <section id="main" class="p-relative" role="main">
            
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
                        <div id="sidebar-calendar"></div>
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
                            <li><a href="IndicadorC.jsp?empresa=AlfaRomeo">Alfa-Mitsu</a></li>
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

            </aside>
        
            <!-- Content -->
            <section id="content" class="container">
                 <p style="text-align: center;"><FONT SIZE=8>GRUPO CONTINENTAL AUTOMOTRIZ</FONT>
                 </p>
                 <img src="img/Continental.PNG" class="img-responsive center-block">
                    <br/>
                 <p style="text-align: center;"><FONT SIZE=6>Departamentos</FONT>
                 </p>
                
                  <!-- DATOS-->
               
                </div>

                <!-- Responsive Table -->
                <div class="block-area" id="responsiveTable">
                    <h3 class="block-title">Registros</h3>
                    <%
                String BD = "Automodena";
                try {
                    if (request.getParameter("BD") != null) {
                        BD = request.getParameter("BD");
                    }
                } catch (Exception e) {
                }
                System.out.println("Conectando a: " + BD);
                departamentos vista = new departamentos();
                departamentos objetoDepartamentos = new departamentos();
                ArrayList<departamentos> consulta = new ArrayList<departamentos>();
                consulta = vista.consultarDepartamentos();
               
            %>
           
            
            <div class="table-responsive overflow">
             
                <table class="table tile col-md-10">
                            <thead>
                                <tr>
                                    <th class=" col-md-3" style="text-align: center">Id Depatamento</th>
                                    <th class=" col-md-3" style="text-align: center">Departamento</th>
                                    <th class=" col-md-3" style="text-align: center">Activo</th>
                                </tr>
                            </thead>
                            <tbody>
                                 <%
                            if (consulta.size() > 0) {
                                for (int i = 0; i < consulta.size(); i++) {

                                    int Iddepartamento = consulta.get(i).getBal_iddepartamento();
                                    String Departamento = consulta.get(i).getBal_departamento();
                                    int Activo = consulta.get(i).getBal_activo();
                                    try {

                                    } catch (Exception e) {
                                    }
                        %>
                                 <tr>
                                     <td class=" col-md-3" style=" text-align: center"><% out.print(Iddepartamento);%></td>
                                    <td class=" col-md-3"><% out.print(Departamento);%></td>
                                    <td class=" col-md-3" style=" text-align: center"><% out.print(Activo);%></td>
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
        </section>
       
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
        <script src="js/calendar.min.js"></script> <!-- Calendar -->
        <script src="js/feeds.min.js"></script> <!-- News Feeds -->
        
        
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
        
    </body>
</html>
