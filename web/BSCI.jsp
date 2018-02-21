<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.utilMath"%>
<%@page import="modelo.departamentos"%>
<%@page import="modelo.balance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.generarReporte"%>
<%@page import="modelo.procesosFecha"%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta charset="UTF-8">


    <title></title>
</head>
<body>
    <!-- Tablas -->
    <br>
    <%  System.out.println("==========================Bienvenidos Balance 1==============================");
        utilMath objMath = new utilMath();
        DecimalFormat df = new DecimalFormat("0.00");
        int anioReporte = 0;
        int mesReporte = 0;
        Calendar fecha_hoy = Calendar.getInstance();
        String añohoy = String.valueOf(fecha_hoy.get(Calendar.YEAR));
        String meshoy = String.valueOf(fecha_hoy.get(Calendar.MONTH) + 1);
        int mesH = Integer.parseInt(meshoy);

        String diahoy = String.valueOf(fecha_hoy.get(Calendar.DAY_OF_MONTH));
        try {
            anioReporte = Integer.parseInt(request.getParameter("anioReporte"));
        } catch (Exception e) {
        }
        try {
            mesReporte = Integer.parseInt(request.getParameter("mesReporte"));
        } catch (Exception e) {
        }

        procesosFecha objFecha = new procesosFecha();
        generarReporte generarReporte = new generarReporte();
        ArrayList<balance> arrayBalance = new ArrayList<balance>();
        mesReporte = 1;
        String unidadNegocio = "Continental";
        String mesCuatrimestre = "1er";
        anioReporte = 2015;
        String mesEspanol2 = "Enero";
        try {
            unidadNegocio = request.getParameter("unidadNegocio");
            System.out.println("-----------Unidad negocio :" + unidadNegocio + "--------------");
        } catch (Exception ex) {
        }
        try {
            mesReporte = Integer.parseInt(request.getParameter("mesReporte"));
        } catch (Exception ex) {
            mesReporte = Integer.parseInt(objFecha.getFecha("MM"));
        }
        try {
            anioReporte = Integer.parseInt(request.getParameter("anioReporte"));
        } catch (Exception ex) {
            anioReporte = Integer.parseInt(objFecha.getFecha("yyyy"));
        }
        if (mesReporte == 1 || mesReporte == 5 || mesReporte == 9) {
            mesCuatrimestre = "1er";
        }
        if (mesReporte == 2 || mesReporte == 6 || mesReporte == 10) {
            mesCuatrimestre = "2do";
        }
        if (mesReporte == 3 || mesReporte == 7 || mesReporte == 11) {
            mesCuatrimestre = "3er";
        }
        if (mesReporte == 4 || mesReporte == 8 || mesReporte == 12) {
            mesCuatrimestre = "4to";
        }

        mesEspanol2 = objFecha.obtenerMesEspanol2(mesReporte);
        departamentos vista = new departamentos();
        ArrayList<departamentos> arrayDepartamentos = new ArrayList<departamentos>();
        arrayDepartamentos = vista.consultarDepartamentos();
        String Servicio = arrayDepartamentos.get(0).getBal_departamento();
        String Hojalateria = arrayDepartamentos.get(1).getBal_departamento();
        String VentasNuevos = arrayDepartamentos.get(2).getBal_departamento();
        String VentasSemi = arrayDepartamentos.get(3).getBal_departamento();
        String VentasFlotilla = arrayDepartamentos.get(4).getBal_departamento();
        if (unidadNegocio.equals("Nihon") ){
            VentasFlotilla= "FUERZA DE VENTAS MÓVILES";
        }else { 
          if (unidadNegocio.equals("PuertaSantaFe"))  {
              VentasFlotilla = "FUERZA DE VENTAS MÓVILES";
        }
        }
        String FI = arrayDepartamentos.get(5).getBal_departamento();
        String Refacciones = arrayDepartamentos.get(6).getBal_departamento();
        String AdmonFinanza = arrayDepartamentos.get(7).getBal_departamento();
        String razonSocial = "CONTINENTAL AUTOMOTRIZ S.A. DE C.V.";
        if (unidadNegocio.equals("Mitsuautos")) {
            razonSocial = "MITSUBISHI CONTINENTAL";
        }
        if (unidadNegocio.equals("Automodena")) {
            razonSocial = "FIAT CONTINENTAL";
        }
        if (unidadNegocio.equals("Autopolanco")) {
            razonSocial = "SAN RAFAEL CDFJR";
        }
        if (unidadNegocio.equals("KoreanMotors")) {
            razonSocial = "HYUNDAI METEPEC";

        }
        if (unidadNegocio.equals("HyundaiSantaFe")) {
            razonSocial = "HYUNDAI SANTA FE";
        }
        if (unidadNegocio.equals("AutopolancoFiat")) {
            razonSocial = "AUTOPOLANCO FIAT";
        }
        if (unidadNegocio.equals("AutopolancoChrysler")) {
            razonSocial = "AUTOPOLANCO CDFJR";
        }
        if (unidadNegocio.equals("Lerma")) {
            razonSocial = "LERMA";
        }
        if (unidadNegocio.equals("Tenancingo")) {
            razonSocial = "TENANCINGO";
        }
        if (unidadNegocio.equals("Atlacomulco")) {
            razonSocial = "ATLACOMULCO";
        }
        if (unidadNegocio.equals("Nihon")) {
            razonSocial = "TOYOTA SANTA FE";
        }
        if (unidadNegocio.equals("HyundaiPatriotismo")) {
            razonSocial = "HYUNDAI PATRIOTISMO";
        }
        if (unidadNegocio.equals("PuertaSantaFe")) {
            razonSocial = "PUERTA SANTA FE";
        }
        if (unidadNegocio.equals("Alfa-Auto")) {
            razonSocial = "ALFA ROMEO - AUTOPOLANCO";

        }
        if (unidadNegocio.equals("Mitsu-Auto")) {
            razonSocial = "MITSUBISHI - AUTOPOLANCO";

        }
        if (unidadNegocio.equals("Mitsubishi")) {
            razonSocial = "MITSUBISHI";
        }
    %>
    <style type="text/css" media="print">
        .oculto {display:none}
    </style>
    <form> 
        <input style="Position:Absolute; left:96%; top:2%; color: #17202A; background-color: #D7DBDD; width:70px; height: 30px; font-size: 12pt;" type='button' onclick='window.print();' value='Imprimir'  class="oculto"/> 
    </form> 
    <br/>
    <table width="100%" style="border-collapse: collapse;">  
        <tr> 
            <td bgcolor="black" width="1500px" align="CENTER" style="font-weight: bold; font-family: ARIAL"><font color='white' size="5">
                <%=razonSocial%>
                <br>INDICADORES DE GESTION AL CIERRE DEL MES DE <%=mesEspanol2%> DEL <%=anioReporte%>
            </td></font>
        </tr> 
    </table> 
    <br>
    <%
        int columna = 0;
        int cantidadModelos = 8;
        int cantidadIndicadores = 0;
        String[][] puntosResumen = new String[arrayDepartamentos.size()][9];
        if (arrayDepartamentos.size() > 0) {

    %>
    <table width="100%" style="border-collapse: collapse;"> 
        <tr> 
            <td bgcolor="#23350c" width="6%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="1">AREA</font></td>
            <td bgcolor="#23350c" width="6%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=Servicio%></font></td>
            <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=Hojalateria%></font></td>
            <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=VentasNuevos%></font></td>
            <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=VentasSemi%></font> </td>
            <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=VentasFlotilla%></font></td>
            <td bgcolor="#23350c" width="5%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=FI%></font></td>
            <td bgcolor="#23350c" width="6%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=Refacciones%></font></td>
            <td bgcolor="#23350c" width="8%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=AdmonFinanza%></font></td>
            <td bgcolor="#23350c" width="4%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2">TOTALES</font></td>
        </tr>
        <tr>
            <td bgcolor="#23350c" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="1">PUNTUACIÓN MÁXIMA</td></font>
                <%
                    double totalObtenido = 0, totalOptimo = 0, porcentajeExito = 0.0, totalObtenido2 = 0, totalOptimo2 = 0, porcentajeExito2 = 0.0, totalObtenido3 = 0, totalOptimo3 = 0;
                    double porcentajeExito3 = 0.0, totalObtenido4 = 0, totalOptimo4 = 0, porcentajeExito4 = 0.0, totalObtenido5 = 0, totalOptimo5 = 0, porcentajeExito5 = 0.0, totalObtenido6 = 0;
                    double totalOptimo6 = 0, porcentajeExito6 = 0.0, totalObtenido7 = 0, totalOptimo7 = 0, porcentajeExito7 = 0.0, totalObtenido8 = 0, totalOptimo8 = 0, porcentajeExito8 = 0.0;
                    double totalObtenido9 = 0, totalOptimo9 = 0, porcentajeExito9 = 0.0, totalesOP = 0, totalesOB = 0, totalesP = 0.0;
                    for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                        arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                        puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                        for (int i = 0; i < arrayBalance.size(); i++) {
                            double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                            arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                            puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                            double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                            String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                            if (idDepartamento.equals("BAL_DE001")) {
                                totalObtenido += puntosObtenidos;
                                totalOptimo += puntosOptimos;
                                if (totalOptimo > 0) {
                                    porcentajeExito = ((double) totalObtenido / (double) totalOptimo) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE002")) {
                                totalObtenido2 += puntosObtenidos;
                                totalOptimo2 += puntosOptimos;
                                if (totalOptimo2 > 0) {
                                    porcentajeExito2 = ((double) totalObtenido2 / (double) totalOptimo2) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE003")) {
                                totalObtenido3 += puntosObtenidos;
                                totalOptimo3 += puntosOptimos;
                                if (totalOptimo3 > 0) {
                                    porcentajeExito3 = ((double) totalObtenido3 / (double) totalOptimo3) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE004")) {
                                totalObtenido4 += puntosObtenidos;
                                totalOptimo4 += puntosOptimos;
                                if (totalOptimo4 > 0) {
                                    porcentajeExito4 = ((double) totalObtenido4 / (double) totalOptimo4) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE005")) {
                                totalObtenido5 += puntosObtenidos;
                                totalOptimo5 += puntosOptimos;
                                if (totalOptimo5 > 0) {
                                    porcentajeExito5 = ((double) totalObtenido5 / (double) totalOptimo5) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE006")) {
                                totalObtenido6 += puntosObtenidos;
                                totalOptimo6 += puntosOptimos;
                                if (totalOptimo6 > 0) {
                                    porcentajeExito6 = ((double) totalObtenido6 / (double) totalOptimo6) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE007")) {
                                totalObtenido7 += puntosObtenidos;
                                totalOptimo7 += puntosOptimos;
                                if (totalOptimo7 > 0) {
                                    porcentajeExito7 = ((double) totalObtenido7 / (double) totalOptimo7) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE008")) {
                                totalObtenido8 += puntosObtenidos;
                                totalOptimo8 += puntosOptimos;
                                if (totalOptimo8 > 0) {
                                    porcentajeExito8 = ((double) totalObtenido8 / (double) totalOptimo8) * 100;
                                }
                            }
                            if (idDepartamento.equals("BAL_DE009")) {
                                totalObtenido9 += puntosObtenidos;
                                totalOptimo9 += puntosOptimos;
                                if (totalOptimo9 > 0) {
                                    porcentajeExito9 = ((double) totalObtenido9 / (double) totalOptimo9) * 100;
                                }
                            }
                        }
                        totalesOP = totalOptimo + totalOptimo2 + totalOptimo3 + totalOptimo4 + totalOptimo5 + totalOptimo6 + totalOptimo7 + totalOptimo8 + totalOptimo9;
                        totalesOB = totalObtenido + totalObtenido2 + totalObtenido3 + totalObtenido4 + totalObtenido5 + totalObtenido6 + totalObtenido7 + totalObtenido8 + totalObtenido9;
                        if (totalesOP > 0) {
                            totalesP = ((double) totalesOB / (double) totalesOP) * 100;
                        }
                    }
                %>  
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo2%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo3%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo4%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo5%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo6%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo7%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalOptimo8%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalesOP%></td></font>
        </tr>
        <tr>
            <td bgcolor="#23350c" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="1">RESULTADO OBTENIDO</td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido2%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido3%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido4%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido5%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido6%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido7%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalObtenido8%></td></font>
            <td align="CENTER" style="border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) totalesOB%></td></font>
        </tr>
        <tr>
            <td bgcolor="#23350c" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="1">PORCENTAJE DE EXITO</td></font>
                <%if (porcentajeExito >= 100.0) {%>                    
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito, 2)%>%</td></font>
                <%}
                            if (porcentajeExito < 100.0 && porcentajeExito >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito, 2)%>%</td></font>   
                <%}
                            if (porcentajeExito < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito, 2)%>%</td></font></a>
                    <%}
                            if (porcentajeExito2 >= 100.0) {%>  
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito2, 2)%>%</td></font>
                <% }
                            if (porcentajeExito2 < 100.0 && porcentajeExito2 >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito2, 2)%>%</td></font>   
                <% }
                            if (porcentajeExito2 < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito2, 2)%>%</td></font></a>
                    <%}
                            if (porcentajeExito3 >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito3, 2)%>%</td></font>
                <%}
                            if (porcentajeExito3 < 100.0 && porcentajeExito3 >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito3, 2)%>%</td></font>   
                <% }
                            if (porcentajeExito3 < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito3, 2)%>%</td></font></a>
                    <%}
                            if (porcentajeExito4 >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito4, 2)%>%</td></font>
                <% }
                            if (porcentajeExito4 < 100.0 && porcentajeExito4 >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito4, 2)%>%</td></font>   
                <% }
                            if (porcentajeExito4 < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito4, 2)%>%</td></font></a>
                    <%}
                            if (porcentajeExito5 >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito5, 2)%>%</td></font>
                <% }
                            if (porcentajeExito5 < 100.0 && porcentajeExito5 >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito5, 2)%>%</td></font>   
                <% }
                            if (porcentajeExito5 < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito5, 2)%>%</td></font></a>
                    <%}
                            if (porcentajeExito6 >= 100.0) {%> 
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito6, 2)%>%</td></font>
                <% }
                            if (porcentajeExito6 < 100.0 && porcentajeExito6 >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito6, 2)%>%</td></font>   
                <%}
                            if (porcentajeExito6 < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito6, 2)%>%</td></font></a>
                    <%}
                            if (porcentajeExito7 >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito7, 2)%>%</td></font>
                <% }
                            if (porcentajeExito7 < 100.0 && porcentajeExito7 >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito7, 2)%>%</td></font>   
                <%}
                            if (porcentajeExito7 < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito7, 2)%>%</td></font></a>
                    <%}
                            if (porcentajeExito8 >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito8, 2)%>%</td></font>
                <% }
                            if (porcentajeExito8 < 100.0 && porcentajeExito8 >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(porcentajeExito8, 2)%>%</td></font>   
                <% }
                            if (porcentajeExito8 < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(porcentajeExito8, 2)%>%</td></font></a>
                    <%}
                            if (totalesP >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="white" size="2"><%=(int) objMath.redondear(totalesP, 2)%>%</td></font>
                <% }
                            if (totalesP < 100.0 && totalesP >= 85.0) {%>       
            <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><font color="black" size="2"><%=(int) objMath.redondear(totalesP, 2)%>%</td></font>   
                <% }
                            if (totalesP < 85) {%>     
            <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri"><a href="Detalle.jsp" style="text-decoration:none"><font color="white" size="2"><%=(int) objMath.redondear(totalesP, 2)%>%</td></font></a>
                    <%} %>
        </tr>
    </table>
    <% }%>
    <br>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid"><font size="3"><%=Servicio%></td></font>
        </tr>
    </table>

    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;  border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido = 0, totalOptimo = 0, porcentajeExito = 0.0, totalPorcentaje = 0.0;
            int puntuacionMaxima = 0, resultadoObtenido = 0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE001")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido += puntosObtenidos;
                        totalOptimo += puntosOptimos;
                        resultadoObtenido += resultadoObtenido;
                        puntuacionMaxima += puntuacionMaxima;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>


            <%if (Indicador.equals("SSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>  
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}%>
            <%} else if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0.00) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0.0 || cumplimientoAcumulado == 0.00) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%>


            <%} else if (medida.equals("%") && Indicador.equals("CSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%> 


            <% } else if (medida.equals("%")) {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <% }
                            if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(objCuatrimestre) + "")%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(incurridoCuatrimestre) + "")%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(ObjAcumulado) + "")%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <% }
                            if (medida.equals("")) {
                                if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <% }
                            } %>       
                <% if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></font></a></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>   
        </tr>
        <%}
                        }
                    }%> 
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalObtenido%></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalOptimo%></td>
        </tr>
    </table><BR/>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid">
                <font size="3"><%=Hojalateria%></td></font>
        </tr>
    </table>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido2 = 0, totalOptimo2 = 0, porcentajeExito2 = 0.0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE002")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido2 += puntosObtenidos;
                        totalOptimo2 += puntosOptimos;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>
            <%if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0.00) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0.0 || cumplimientoAcumulado == 0.00) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%>
            <% } else if (Indicador.equals("SSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>  
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}%> 
            <%} else if (medida.equals("%")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :CalibrI; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <% }
                            if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(objCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(incurridoCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(ObjAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format(incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <% }
                            if (medida.equals("")) {
                                if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else if (Indicador.equals("Certificacion CESVI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <% }
                        } else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%}
                            }%>
                <% if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></font></a></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>
        </tr>
        <%  }
                        }
                    }%>
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalObtenido2%></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalOptimo2%></td>
        </tr>
    </table><BR/>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid">
                <font size="3"><%=VentasNuevos%></td></font>
        </tr>
    </table>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido3 = 0, totalOptimo3 = 0, porcentajeExito3 = 0.0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE003")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido3 += puntosObtenidos;
                        totalOptimo3 += puntosOptimos;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>
            <%if (Indicador.equals("CSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td> 
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <% }
                        } else if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%>
            <%   } else if (Indicador.equals("SSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0;%>  
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}%> 
            <%} else if (medida.equals("%")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <%  }
                            if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (ObjAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <% }
                            if (medida.equals("")) {
                                if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else if (Indicador.equals("dias Inventario Autos Nuevos sin considerar flotillas") || Indicador.equals("Dias Inventario Autos Nuevos sin considerar flotillas")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td> 
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}
                        } else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%}
                            }%>
                <% if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <%  }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <%  }
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></font></a></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>   
        </tr>
        <% }
                        }
                    }%>
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid"><%=(int) totalObtenido3%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid"><%=(int) totalOptimo3%></td>
        </tr>
    </table><BR/>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid">
                <font size="3"><%=VentasSemi%></td></font>
        </tr>
    </table>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido4 = 0, totalOptimo4 = 0, porcentajeExito4 = 0.0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE004")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido4 += puntosObtenidos;
                        totalOptimo4 += puntosOptimos;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>
            <%if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0.00) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0.0 || cumplimientoAcumulado == 0.00) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%>
            <% } else if (Indicador.equals("SSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>  
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}%>
            <%} else if (medida.equals("%")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <%  }
                            if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (ObjAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <% }
                            if (medida.equals("")) {
                                if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else if (Indicador.equals("Dias Inventario unidades seminuevas") || Indicador.equals("dias Inventario unidades seminuevas") || Indicador.equals("dias Inventario Autos Nuevos sin considerar flotillas") || Indicador.equals("Dias Inventario Autos Nuevos sin considerar flotillas")) {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre) + medida%></td> 
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}
                        } else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%}
                            }%>
                <% if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></font></a></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>
        </tr>
        <% }
                        }
                    }%>
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid"><%=(int) totalObtenido4%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid"><%=(int) totalOptimo4%></td>
        </tr>
    </table><BR/>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid">
                <font size="3"><%=VentasFlotilla%></td></font>
        </tr>
    </table>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido5 = 0, totalOptimo5 = 0, porcentajeExito5 = 0.0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE005")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido5 += puntosObtenidos;
                        totalOptimo5 += puntosOptimos;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>
            <%if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0.00) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0.0 || cumplimientoAcumulado == 0.00) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%> 
            <%} else if (Indicador.equals("SSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>  
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}%>     
            <%} else if (medida.equals("%")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <%  }
                            if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (ObjAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <%  }
                            if (medida.equals("")) {
                                if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%}
                            }%>
                <%  if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <%  }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <%}
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></a></font></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>
        </tr>
        <%  }
                        }
                    }%>
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid"><%=(int) totalObtenido5%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; font-weight: bold; border: black 1px solid"><%=(int) totalOptimo5%></td>
        </tr>
    </table><BR/>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid">
                <font size="3"><%=FI%></td></font>
        </tr>
    </table>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;  border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido6 = 0, totalOptimo6 = 0, porcentajeExito6 = 0.0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE006")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido6 += puntosObtenidos;
                        totalOptimo6 += puntosOptimos;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>
            <%if (Indicador.equals("Penetracion VACH") || Indicador.equals("Penetracion VACH Alfa") || Indicador.equals("Penetracion en Venta de Contratos de Servicio") || Indicador.equals("Penetracion en Venta de Contratos de Servicio Alfa")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td> 
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <% }
                        } else if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0.00) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0.0 || cumplimientoAcumulado == 0.00) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%>
            <%} else if (Indicador.equals("SSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>  
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}%> 
            <%} else if (medida.equals("%")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <%   }
                            if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (ObjAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <%  }
                            if (medida.equals("")) {
                                if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%}
                            }%>
                <%  if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></font></a></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>
        </tr>
        <% }
                        }
                    }%>
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalObtenido6%></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalOptimo6%></td>
        </tr>
    </table><BR/>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid">
                <font size="3"><%=Refacciones%></td></font>
        </tr>
    </table>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido7 = 0, totalOptimo7 = 0, porcentajeExito7 = 0.0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE007")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido7 += puntosObtenidos;
                        totalOptimo7 += puntosOptimos;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>
            <%if (Indicador.equals("ComPosicion del inventario (Obsoleto)") || Indicador.equals("Composicion del inventario (Obsoleto)") || Indicador.equals("Penetracion VACH") || Indicador.equals("Penetracion VACH Mitsu") || Indicador.equals("Penetracion en Venta de Contratos de Servicio") || Indicador.equals("Penetracion en Venta de Contratos de Servicio Mitsu") || Indicador.equals("Composicion del inventario") || Indicador.equals("ComPosicion del inventario")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre * 100) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td> 
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado * 100) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}
                       } else if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0.00) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0.0 || cumplimientoAcumulado == 0.00) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%>
            <%} else if (Indicador.equals("SSI")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>  
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td> 
            <%} else {%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}%>

            <% } else if (medida.equals("%")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <%  }
                           if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (ObjAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <% }
                           if (medida.equals("")) {
                               if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%}
                            }%>
                <% if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <%  }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <% }
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></a></font></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>   
        </tr>
        <%   }
                        }
                    }%>
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalObtenido7%></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalOptimo7%></td>
        </tr>
    </table><BR/>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="silver" width="100%" align="CENTER" style="font-family: Calibri; font-weight: bold; border: black 1px solid">
                <font size="3"><%=AdmonFinanza%></td></font>
        </tr>
    </table>
    <table width="100%" style="border-collapse: collapse;">
        <tr>
            <td bgcolor="black" width="2%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">AREA</td></FONT>
            <td bgcolor="black" width="18%" align="CENTER"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">INDICADOR</td></FONT>
            <td bgcolor="#154360" width="5%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ GLOBAL ANUAL</td></FONT>
            <td bgcolor="#154360" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="9%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#154360" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP <%=mesCuatrimestre%> MES CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">OBJ ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="8%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">INCURRIDO ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="#512E5F" width="7%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small;">%CUMP ACUM CUATRIMESTRE</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OBTENIDA</td></FONT>
            <td bgcolor="black" width="4%" align="CENTER" style="border: black 1px solid; border-width: 0 1px 0 1px;"><FONT COLOR="white" style="font-family :Calibri; font-weight: bold; font-size: xx-small; border: black 1px solid">PUNT OPTIMA</td></FONT>
        </tr>
        <%
            double totalObtenido8 = 0, totalOptimo8 = 0, porcentajeExito8 = 0.0;
            for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), unidadNegocio);
                puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                for (int i = 0; i < arrayBalance.size(); i++) {
                    String idDepartamento = arrayBalance.get(i).getBal_identificaDepartamento();
                    if (idDepartamento.equals("BAL_DE008")) {
                        String Area = arrayBalance.get(i).getBal_Area();
                        String Indicador = arrayBalance.get(i).getBal_Indicador();
                        double objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        double objCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplimientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double ObjAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        totalObtenido8 += puntosObtenidos;
                        totalOptimo8 += puntosOptimos;
        %> 
        <tr>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=Area%></td>
            <td align="left" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=Indicador%></td>
            <% if (Indicador.equals("Indice de Rotacion de Empleados") || Indicador.equals("Índice de Rotación de Empleados")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual * 100) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre * 100) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre * 100) + medida%></td>
            <% }
                            if (cumplimientoCuatrimestre == 0 || cumplimientoCuatrimestre == 0.0 || cumplimientoCuatrimestre == 0.00) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=cumplimientoCuatrimestre + "%"%></td> 
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td>   
            <%}%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado * 100) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado * 100) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0 || cumplimientoAcumulado == 0.0 || cumplimientoAcumulado == 0.00) {
                                cumplimientoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>  
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td> 
            <%}%>
            <% } else if (medida.equals("%")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objAnual * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (objCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoCuatrimestre * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (ObjAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.formatoMiles("" + (int) (incurridoAcumulado * 100)) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%></td>
            <% }
                            if (medida.equals("$")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objAnual))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (objCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoCuatrimestre))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoCuatrimestre, 2) + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (ObjAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=medida + " " + objMath.formatoMiles(df.format (incurridoAcumulado))%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(cumplimientoAcumulado, 2) + "%"%>
                <%  }
                            if (medida.equals("")) {
                                if (Indicador.equalsIgnoreCase("Productividad del taller")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%} else if (Indicador.equals("Dias Cartera Refacciones") || Indicador.equals("Dias Cartera Servicio") || Indicador.equals("Dias Cartera Hojalateria y Pintura") || Indicador.equals("Dias Cartera Autos Nuevos (sin Gobierno)") || Indicador.equals("Dias Cartera Incentivos CM") || Indicador.equals("Dias Cartera SPDC")
                                || Indicador.equals("Dias Cartera Incentivos Toyota Financial") || Indicador.equals("Dias Cartera Autos Nuevos") || Indicador.equals("Dias Cartera Incentivos Financiera")) {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objAnual) + medida%></td>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(objCuatrimestre) + medida%></td>
            <%if (incurridoCuatrimestre == 0) {
                                incurridoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoCuatrimestre) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoCuatrimestre) + medida%></td>
            <%}
                            if (cumplimientoCuatrimestre == 0) {
                                cumplimientoCuatrimestre = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoCuatrimestre) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoCuatrimestre) + "%"%></td> 
            <%}%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(ObjAcumulado) + medida%></td>
            <%if (incurridoAcumulado == 0) {
                                incurridoAcumulado = 0.0;%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(incurridoAcumulado) + medida%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(incurridoAcumulado) + medida%></td>
            <%}
                            if (cumplimientoAcumulado == 0) {
                                cumplimientoAcumulado = 0.0;%> 
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(cumplimientoAcumulado) + "%"%></td>
            <%} else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=df.format(cumplimientoAcumulado) + "%"%></td>
            <%}
                        } else {%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objAnual, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(objCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoCuatrimestre, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoCuatrimestre + "%"%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(ObjAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) objMath.redondear(incurridoAcumulado, 2)%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) cumplimientoAcumulado + "%"%>
                <%}
                            }%>
                <% if (cumplimientoAcumulado >= 100.0) {%>
            <td bgcolor="green" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><%=(int) puntosObtenidos%></font></td>
                <%  }
                            if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {%>
            <td bgcolor="yellow" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font size="2"><%=(int) puntosObtenidos%></font></td>
                <%   }
                            if (cumplimientoAcumulado < 85.0) {%>
            <td bgcolor="red" align="CENTER" style="font-family: Calibri; border: black 1px solid;"><font color="white" size="2"><a href="Detalle.jsp" style="text-decoration:none; color: white;"><%=(int) puntosObtenidos%></font></a></td>
                <% }%>
            <td align="CENTER" style="font-family :Calibri; font-size: small; border: black 1px solid"><%=(int) (puntosOptimos)%></td>
        </tr>
        <% }
                        }
                    }%>
        <tr>
            <td align="CENTER" colspan="8"><font size="1"></font></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid">TOTALES</td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalObtenido8%></td>
            <td align="CENTER" style="font-family :Calibri; font-weight: bold; font-size: small; border: black 1px solid"><%=(int) totalOptimo8%></td>
        </tr>
    </table><BR/>         
    <BR/>
    <%System.out.println("=======================Finaliza BSCI =====================");%>
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
        $(document).ready(function () {
            /* Tag Select */
            (function () {
                /* Limited */
                $(".tag-select-limited").chosen({
                    max_selected_options: 5
                });

                /* Overflow */
                $('.overflow').niceScroll();
            })();

            /* Input Masking - you can include your own way */
            (function () {
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
            (function () {
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
