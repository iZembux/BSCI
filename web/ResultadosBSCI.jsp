<%-- 
    Document   : ResultadosBSCI
    Created on : 29/01/2018, 01:56:32 PM
    Author     : Guadalupe
--%>

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
        <% 
        utilMath objMath = new utilMath();
        int anioReporte = 0;
        int mesReporte = 0;
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
        String mesCuatrimestre = "1er";
        anioReporte = 2015;
        String mesEspanol2 = "Enero";
        try {
           // unidadNegocio = request.getParameter("unidadNegocio");
           // System.out.println("-----------Unidad negocio :"+unidadNegocio+"--------------");
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
        String [] razonSocial = {"CONTINENTAL AUTOMOTRIZ S.A. DE C.V.", "MITSUBISHI CONTINENTAL", "FIAT CONTINENTAL", "TENANCINGO", "LERMA", "ATLACOMULCO", "SAN RAFAEL CDFJR","AUTOPOLANCO CDFJR","ALFA ROMEO - MITSUBISHI","TOYOTA SANTA FE","PUERTA SANTA FE","HYUNDAI METEPEC","HYUNDAI PATRIOTISMO", "HYUNDAI SANTA FE"};
        String [] unidadNegocio= {"Continental", "Mitsuautos", "Automodena", "Tenancingo", "Lerma", "Atlacomulco","Autopolanco", "AutopolancoChrysler", "Alfa-mitsu", "Nihon", "PuertaSantaFe", "KoreanMotors", "HyundaiPatriotismo", "HyundaiSantaFe"};
       
        String Servicio = arrayDepartamentos.get(0).getBal_departamento();
        String Hojalateria = arrayDepartamentos.get(1).getBal_departamento(); 
        String VentasNuevos = arrayDepartamentos.get(2).getBal_departamento(); 
        String VentasSemi = arrayDepartamentos.get(3).getBal_departamento(); 
        String VentasFlotilla = arrayDepartamentos.get(4).getBal_departamento(); 
        String FI = arrayDepartamentos.get(5).getBal_departamento();
        String Refacciones = arrayDepartamentos.get(6).getBal_departamento(); 
        String AdmonFinanza = arrayDepartamentos.get(7).getBal_departamento();
            
          for(int w=0; w<14; w++){ 
        %>
        <style type="text/css" media="print">
        .oculto {display:none}
        </style>
        <form> 
        <input style="Position:Absolute; left:96%; top:2%; color: #17202A; background-color: #D7DBDD; width:70px; height: 30px; font-size: 12pt;" type='button' onclick='window.print();' value='Imprimir'  class="oculto"/> 
        </form> 
        <br/><br/>
        <table width="100%" style="border-collapse: collapse;">  
  			<tr> 
       			 <td bgcolor="black" width="1500px" align="CENTER" style="font-weight: bold; font-family: ARIAL"><font color='white' size="6">
                             <%=razonSocial[w]%>
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
                    if (arrayDepartamentos.size() > 0){
                
                             %>
                <table width="100%" style="border-collapse: collapse;"> 
                    <tr>
                        <td bgcolor="#23350c" width="6%" align="CENTER" 
                            style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4">AREA</font></td>
                        <%if (unidadNegocio[w].equals("Alfa-mitsu")) { 
                        System.out.println("----: "+ unidadNegocio[8]);    
                        
        Servicio = "SERVICIO";
                Hojalateria = "HOJALATERIA Y PINTURA"; 
                VentasNuevos = "VENTAS NUEVOS ALFA"; 
                VentasSemi = "VENTAS NUEVOS MITSU"; 
                VentasFlotilla = "VENTAS FLOTILLA"; 
                FI = "F&I ALFA";
                Refacciones = "F&I MITSU"; 
                AdmonFinanza = "ADMINISTRACION Y FINANZAS"; 
           
                        %>
                        <td bgcolor="#23350c" width="6%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=Servicio%></font></td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=Hojalateria%></font></td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=VentasNuevos%></font></td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=VentasSemi%></font> </td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=VentasFlotilla%></font></td> 
                        <td bgcolor="#23350c" width="5%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=FI%></font></td>
                        <td bgcolor="#23350c" width="6%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=Refacciones%></font></td>
                        <td bgcolor="#23350c" width="8%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=AdmonFinanza%></font></td>
                        <%}else{%>
                         <td bgcolor="#23350c" width="6%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(0).getBal_departamento()%></font></td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(1).getBal_departamento()%></font></td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(2).getBal_departamento()%></font></td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(3).getBal_departamento()%></font> </td>
                        <td bgcolor="#23350c" width="7%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(4).getBal_departamento()%></font></td> 
                        <td bgcolor="#23350c" width="5%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(5).getBal_departamento()%></font></td>
                        <td bgcolor="#23350c" width="6%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(6).getBal_departamento()%></font></td>
                        <td bgcolor="#23350c" width="8%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4"><%=arrayDepartamentos.get(7).getBal_departamento()%></font></td>
                        <%}%>  
                        <td bgcolor="#23350c" width="4%" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                             <font color="white" size="4">TOTALES</font></td>
                    </tr>
                    <tr>
                        <td bgcolor="#23350c" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3">PUNTUACIÓN MÁXIMA</td></font>
                         <%
        double totalObtenido = 0;
        double totalOptimo = 0;
        double porcentajeExito=0.0;
        
        double totalObtenido2 = 0;
        double totalOptimo2 = 0;
        double porcentajeExito2=0.0;
        
        double totalObtenido3 = 0;
        double totalOptimo3 = 0;
        double porcentajeExito3=0.0;
        
        double totalObtenido4 = 0;
        double totalOptimo4 = 0;
        double porcentajeExito4=0.0;
        
        double totalObtenido5 = 0;
        double totalOptimo5 = 0;
        double porcentajeExito5=0.0;
        
        double totalObtenido6 = 0;
        double totalOptimo6 = 0;
        double porcentajeExito6=0.0;
        
        double totalObtenido7 = 0;
        double totalOptimo7 = 0;
        double porcentajeExito7=0.0;
        
        double totalObtenido8 = 0;
        double totalOptimo8 = 0;
        double porcentajeExito8=0.0;
        
        double totalObtenido9 = 0;
        double totalOptimo9 = 0;
        double porcentajeExito9=0.0;
        
        double totalesOP=0;
        double totalesOB=0;
        double totalesP=0.0;
                 for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                    arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), 
                    unidadNegocio[w]);
                    puntosResumen[tabla][0]=arrayDepartamentos.get(tabla).getBal_departamento();
                    
                        for (int i = 0; i < arrayBalance.size(); i++) { 
                             double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), 
                    unidadNegocio[w]);
                    puntosResumen[tabla][0]=arrayDepartamentos.get(tabla).getBal_departamento();
                             double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                             String idDepartamento= arrayBalance.get(i).getBal_identificaDepartamento();  
                            
                             if (idDepartamento.equals("BAL_DE001")){
                                 totalObtenido += puntosObtenidos;
                                 totalOptimo += puntosOptimos;
                                 if(totalOptimo > 0){
                                     porcentajeExito=((double) totalObtenido / (double) totalOptimo) * 100;
                                 }
                                 
                             }if(idDepartamento.equals("BAL_DE002")){
                                 totalObtenido2 += puntosObtenidos;
                                 totalOptimo2 += puntosOptimos;
                                 
                                 if(totalOptimo2 > 0){
                                     porcentajeExito2=((double) totalObtenido2 / (double) totalOptimo2) * 100;
                                 }
                             }if (idDepartamento.equals("BAL_DE003")){
                                 totalObtenido3 += puntosObtenidos;
                                 totalOptimo3 += puntosOptimos;
                                 
                                 if(totalOptimo3 > 0){
                                     porcentajeExito3=((double) totalObtenido3 / (double) totalOptimo3) * 100;
                                 }
                                 
                             }if (idDepartamento.equals("BAL_DE004")){
                                 totalObtenido4 += puntosObtenidos;
                                 totalOptimo4 += puntosOptimos;
                                 
                                 if(totalOptimo4 > 0){
                                     porcentajeExito4=((double) totalObtenido4 / (double) totalOptimo4) * 100;
                                 }
                                 
                             }if (idDepartamento.equals("BAL_DE005")){
                                 totalObtenido5 += puntosObtenidos;
                                 totalOptimo5 += puntosOptimos;
                                 
                                 if(totalOptimo5 > 0){
                                     porcentajeExito5=((double) totalObtenido5 / (double) totalOptimo5) * 100;
                                 }
                                 
                             }if (idDepartamento.equals("BAL_DE006")){
                                 totalObtenido6 += puntosObtenidos;
                                 totalOptimo6 += puntosOptimos;
                                 
                                 if(totalOptimo6 > 0){
                                     porcentajeExito6=((double) totalObtenido6 / (double) totalOptimo6) * 100;
                                 }
                                 
                             }if (idDepartamento.equals("BAL_DE007")){
                                 totalObtenido7 += puntosObtenidos;
                                 totalOptimo7 += puntosOptimos;
                                 
                                 if(totalOptimo7 > 0){
                                     porcentajeExito7=((double) totalObtenido7 / (double) totalOptimo7) * 100;
                                 }
                                 
                             }if (idDepartamento.equals("BAL_DE008")){
                                 totalObtenido8 += puntosObtenidos;
                                 totalOptimo8 += puntosOptimos;
                                 
                                 if(totalOptimo8 > 0){
                                     porcentajeExito8=((double) totalObtenido8 / (double) totalOptimo8) * 100;
                                 }
                                 
                             }if (idDepartamento.equals("BAL_DE009")){
                                 totalObtenido9 += puntosObtenidos;
                                 totalOptimo9 += puntosOptimos;
                                 
                                 if(totalOptimo9 > 0){
                                     porcentajeExito9=((double) totalObtenido9 / (double) totalOptimo9) * 100;
                                 }
                                 
                             }
                        }
                        totalesOP=totalOptimo+totalOptimo2+totalOptimo3+totalOptimo4+totalOptimo5+totalOptimo6+totalOptimo7+totalOptimo8+totalOptimo9;
                        totalesOB=totalObtenido+totalObtenido2+totalObtenido3+totalObtenido4+totalObtenido5+totalObtenido6+totalObtenido7+totalObtenido8+totalObtenido9;
                        if(totalesOP>0){
                            totalesP= ((double) totalesOB / (double) totalesOP)*100;
                        }
                 }
        %>  
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo2%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo3%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo4%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo5%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo6%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo7%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalOptimo8%></td></font>
                        
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalesOP%></td></font>
                    </tr>
                    <tr>
                        <td bgcolor="#23350c" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3">RESULTADO OBTENIDO</td></font>
                       
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido2%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido3%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido4%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido5%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido6%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido7%></td></font>
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalObtenido8%></td></font>
                       
                        <td align="CENTER" style="border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) totalesOB%></td></font>
                    </tr>
                    <tr>
                        <td bgcolor="#23350c" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3">PORCENTAJE DE EXITO</td></font>
    <%
                    if(porcentajeExito>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito < 100.0 && porcentajeExito >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito, 2)%>%</td></font></a>
               
                
                <%}
                %>
                       
                  <%
                    if(porcentajeExito2>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito2, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito2 < 100.0 && porcentajeExito2 >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito2, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito2 < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito2, 2)%>%</td></font></a>
                <%}
                %>
                
                  <%
                    if(porcentajeExito3>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito3, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito3 < 100.0 && porcentajeExito3 >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito3, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito3 < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito3, 2)%>%</td></font></a>
                <%}
                %>
                
                  <%
                    if(porcentajeExito4>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito4, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito4 < 100.0 && porcentajeExito4 >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito4, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito4 < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito4, 2)%>%</td></font></a>
                <%}
                %>
                
                  <%
                    if(porcentajeExito5>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito5, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito5 < 100.0 && porcentajeExito5 >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito5, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito5 < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito5, 2)%>%</td></font></a>
                <%}
                %>
                
                  <%
                    if(porcentajeExito6>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito6, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito6 < 100.0 && porcentajeExito6 >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito6, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito6 < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito6, 2)%>%</td></font></a>
                <%}
                %>
                
                  <%
                    if(porcentajeExito7>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito7, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito7 < 100.0 && porcentajeExito7 >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito7, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito7 < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito7, 2)%>%</td></font></a>
                <%}
                %>
                
                  <%
                    if(porcentajeExito8>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito8, 2)%>%</td></font>
                 <%
                 }if(porcentajeExito8 < 100.0 && porcentajeExito8 >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(porcentajeExito8, 2)%>%</td></font>   
                        
                <%
                }if(porcentajeExito8 < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(porcentajeExito8, 2)%>%</td></font></a>
                <%}
                %>
                
                 
                
                  <%
                    if(totalesP>=100.0){
    %>                    
                        <td bgcolor="green" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="white" size="3"><%=(int) objMath.redondear(totalesP, 2)%>%</td></font>
                 <%
                 }if(totalesP < 100.0 && totalesP >= 85.0){
                 %>       
                     <td bgcolor="yellow" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                            <font color="black" size="3"><%=(int) objMath.redondear(totalesP, 2)%>%</td></font>   
                        
                <%
                }if(totalesP < 85){
                %>     
                <td bgcolor="red" align="CENTER" style="font-weight: bold;  border: black 1px solid; font-family: Calibri">
                    <a href="Detalle.jsp" style="text-decoration:none">
                        <font color="white" size="3"><%=(int) objMath.redondear(totalesP, 2)%>%</td></font></a>
                <%}
                %>
                    </tr>
                </table>
                        
            <%        
                    }
                 %>
		<br>
            </table><BR/>
            
            
            <BR/>
            <%}%>
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
