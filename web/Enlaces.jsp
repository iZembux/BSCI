<%-- 
    Document   : Enlaces
    Created on : 29/01/2018, 12:09:12 PM
    Author     : Guadalupe
--%>

<%@page import="modelo.indicador, modelo.incurridos, modelo.parametros, modelo.procesosFecha, java.text.DecimalFormat, java.util.ArrayList;"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>

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
        <link href="css/style.css" rel="stylesheet">
        <link href="css/icons.css" rel="stylesheet">
        <link href="css/generics.css" rel="stylesheet">
    </head>
    
    
   
        
        <ul class="list-unstyled side-menu">
                    <li class="active">
                        <a href=""><i class="fa fa-folder-open-o fa-2x"></i>

                            <span  class="menu-item">Reportes</span>
                        </a>
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
                            <li><a href="IndicadorC.jsp?empresa=Mitsuautos">Mitsuautos</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Automodena">Automodena</a></li>
                            <li><a href="IndicadorC.jsp?empresa=KoreanMotors">Korean Motors</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Autopolanco">Autopolanco</a></li>
                            <li><a href="IndicadorC.jsp?empresa=AutopolancoFiat">Autopolanco Fiat</a></li>
                            <li><a href="IndicadorC.jsp?empresa=AutopolancoChrysler">Autopolanco Chrysler</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Nihon">Nihon</a></li>
                            <li><a href="IndicadorC.jsp?empresa=HyundaiPatriotismo">Hyundai Patriotismo</a></li>
                            <li><a href="IndicadorC.jsp?empresa=PuertaSantaFe">Puerta Santa Fe</a></li>
                            <li><a href="IndicadorC.jsp?empresa=AlfaRomeo">Alfa Romeo</a></li>
                            <li><a href="IndicadorC.jsp?empresa=Mitsubishi">Mitsubishi</a></li>
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
                 </ul>
            
        
    
        
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
