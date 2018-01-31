<%-- 
    Document   : repor
    Created on : 29/01/2018, 04:17:25 PM
    Author     : Guadalupe
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1" import=" modelo.Privilegios,modelo.procesosFecha"%>


<%       HttpSession sesion = request.getSession();
    String usuarioValidado = "";
    usuarioValidado = request.getParameter("usuarioValidado");
    
    if (usuarioValidado == null  || usuarioValidado ==""  || usuarioValidado==" ") {
        response.sendRedirect("../acceso.jsp");
    } else {
      
        String unidadNegocio = "";
        unidadNegocio = "Continental";
      

        String retorno = "";
        ArrayList<Privilegios> listaEmp = new ArrayList<Privilegios>();
        Privilegios privUsuario = new Privilegios();
        
        listaEmp=privUsuario.obtenerEmpresas(usuarioValidado);
        System.out.println("Lista :"+ listaEmp.size());
%>       
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="format-detection" content="telephone=no">
        <meta charset="UTF-8">

        <meta name="description" content="Violate Responsive Admin Template">
        <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

        <title>BSCI</title>
            
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
                            <img class="profile-pic animated" src="img/profile-pic.jpg" alt="">
                        </a>
                        <ul class="dropdown-menu profile-menu">
                           
                            <li><a href="">Sign Out</a> <i class="icon left">&#61903;</i><i class="icon right">&#61815;</i></li>
                        </ul>
                        <h4 class="m-0">Elizabeth Alcalá</h4>
                        @Elizabeth-A
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
                        <a href="index.html"><i class="fa fa-folder-open-o fa-2x"></i>

                            <span  class="menu-item">Reportes</span>
                        </a>
                    </li>
                    <li class="dropdown">
                         <a href=""><i class="fa fa-file-text-o fa-2x"></i>
                            <span class="menu-item">Indicadores</span>
                        </a>
                        <ul class="list-unstyled menu-item">
                            <li><a href="Continental.html">Continental</a></li>
                            <li><a href="Lerma.html">Lerma</a></li>
                            <li><a href="Tenancingo.html">Tenancingo</a></li>
                            <li><a href="Atlacomulco.html">Atlacomulco</a></li>
                            <li><a href="Mitsuautos.html">Mitsuautos</a></li>
                            <li><a href="Automodena.html">Automodena</a></li>
                            <li><a href="KoreanMotors.html">Korean Motors</a></li>
                            <li><a href="Autopolanco.html">Autopolanco</a></li>
                            <li><a href="AutopolancoFiat.html">Autopolanco Fiat</a></li>
                            <li><a href="AutopolancoChrysler.html">Autopolanco Chrysler</a></li>
                            <li><a href="Nihon.html">Nihon</a></li>
                            <li><a href="HyundaiPatriotismo.html">Hyundai Patriotismo</a></li>
                            <li><a href="PuertaSantaFe.html">Puerta Santa Fe</a></li>
                            <li><a href="AlfaRomeo.html">Alfa Romeo</a></li>
                            <li><a href="Mitsubishi.html">Mitsubishi</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="Areas.html"><i class="fa fa-list-alt fa-2x"></i>
                            <span class="menu-item">Areas</span>
                        </a>
                    </li>
                     <li>
                        <a href="Departamento.html"><i class="fa fa-building-o fa-2x"></i>
                            <span class="menu-item">Departamentos</span>
                        </a>
                    </li>
                     <li class="dropdown">
                        <a href=""><i class="fa fa-table fa-2x"></i>
                            <span class="menu-item">Incurridos</span>
                        </a>
                        <ul class="list-unstyled menu-item">
                            <li><a href="IncurridosNormales.html">Normales</a></li>
                            <li><a href="ConAcumulados.html">Con acumulados capturados</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="sa-side-chart" href="Reportes.html">
                            <span class="menu-item">BIV3</span>
                        </a>
                    </li>

            </aside>
        
            <!-- Content -->
            <section id="content" class="container">
                
                <!-- Breadcrumb -->
                 <br/> <br/>
                 <p style="text-align: center;"><FONT SIZE=8>Bienvenido a BSCI</FONT>
                 </p>
                <!-- DATOS-->
                <div class="block-area" id="custom-select">
                    <br/>
                    <img src="img/Continental.PNG" class="img-responsive center-block">
                    <br/><br/><br/>
                     <div class="col-md-1">
                     </div>

              
			 <div class="twelve slider-menu">
            <div class="row">
                <jsp:include page="menu.jsp"/>
            </div>
        </div>

        <%-- <form action="balanceExcel.jsp" target="_blank" method="post"> --%>
        <form action="createLista" target="_blank" method="post"> 
            <table class="row">
                <tr> 
                    <td width="420" colspan="2">
                <big>Generar Reporte</big> 
                <hr  style=" background-color: #5882FA; height: 2px; margin-left: 0%; width: 100%;">
                </head>
                </td>
                <td>

                </td>
                </tr>
                <tr>
                    <td><big>Empresa</big>
                <select name="unidadNegocio">
                   <%
                        for(int i=0;i<listaEmp.size();i++){
                            listaEmp.get(i).getUnidadNegocio();
                    %>
                    <option value ="<%=listaEmp.get(i).getUnidadNegocio()%>"><%out.print(listaEmp.get(i).getUnidadNegocio());%></option>
                    <%}%>
                </select>
                </td>
                <td>
                <big>Anio</big>
                <select name="anioReporte" id="anioReporte">
                    <%                        procesosFecha objFecha = new procesosFecha();
                        int anioActual = 2016;
                        //
                        try {
                            anioActual = Integer.parseInt(objFecha.getFecha("yyyy"));
                        } catch (Exception e) {
                        }
                        for (int i = 2016; i <= anioActual; i++) {
                    %>
                    <option value="<%=i%>"><%=i%></option>
                    <% }%>
                </select>
                </td>
                <td>
                <big>Mes</big>
                <select name="mesReporte" id="mesReporte">
                    <option value ="1">Enero</option>
                    <option value ="2">Febrero</option>
                    <option value ="3">Marzo</option>
                    <option value ="4">Abril</option>
                    <option value ="5">Mayo</option>
                    <option value ="6">Junio</option>
                    <option value ="7">Julio</option>
                    <option value ="8">Agosto</option>
                    <option value ="9">Septiembre</option>
                    <option value ="10">Octubre</option>
                    <option value ="11">Noviembre</option>
                    <option value ="12">Diciembre</option>
                </select>
                </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Generar">
                        <input type="reset" value="Cancelar">
                    </td>
                    <td></td>
                </tr>   
            </table>
        </form>
                
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
<%
    }
%>