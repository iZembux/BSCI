<%-- 
    Document   : balanceExcel
    Created on : 29/01/2018, 02:05:25 PM
    Author     : Guadalupe
--%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import ="modelo.departamentos, modelo.procesosFecha, modelo.utilMath, modelo.generarReporte, modelo.balance;"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            
                System.out.println("entrando");
                utilMath objMath = new utilMath();
                procesosFecha objFecha = new procesosFecha();
                generarReporte generarReporte = new generarReporte();
                ArrayList<balance> arrayBalance = new ArrayList<balance>();

                int mesReporte = 1;
                String mesCuatrimestre = "1er";
                int anioReporte = 2016;
                String mesEspanol = "Enero";
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
                if(mesReporte == 1 && mesReporte == 5 && mesReporte == 9){
                    mesCuatrimestre = "1er";
                }
                if(mesReporte == 2 && mesReporte == 6 && mesReporte == 10){
                    mesCuatrimestre = "2do";
                }
                if(mesReporte == 3 && mesReporte == 7 && mesReporte == 11){
                    mesCuatrimestre = "3er";
                }
                if(mesReporte == 4 && mesReporte == 8 && mesReporte == 12){
                    mesCuatrimestre = "4to";
                }
                mesEspanol = objFecha.obtenerMesEspanol(mesReporte);
                departamentos vista = new departamentos();
                departamentos objetoDepartamentos = new departamentos();
                ArrayList<departamentos> arrayDepartamentos = new ArrayList<departamentos>();
                arrayDepartamentos = vista.consultarDepartamentos();
        %>
        <table border ="1" width="900px">
            <tr>
                <td colspan ="11" style="font-size:16px; text-align:center; background-color: black; color: white"> CONTINENTAL AUTOMOTRIZ S.A. DE C.V <label style="font-size:16px; text-align:right; color: white"></label></td>
            </tr>
            <tr>
                <td colspan ="11" style="font-size:16px; text-align:center; background-color: black; color: white"> INDICADORES AL CIERRE DEL MES <% out.println("" + mesEspanol.toUpperCase()); %> DE DE <% out.println(""+anioReporte); %></td>
            </tr>
            <!--
            <tr>
                <td colspan = "2" style="text-align:center;">&Aacute;REAS</td>
                      <---
                for (x = 0; x < num_areasPuntos; x++) {
                    tituloArea = mysql_result(query_puntos, x, 2);
                    if (tituloArea == "ADMINISTRACION, FINANZAS Y CONTRALORIA")
                        tituloArea = "ADMIN & FIN";
                    if (tituloArea == "HOJALATERIA Y PINTURA")
                        tituloArea = "H y P";
                    out.println "<td  style='text-align:center;'>tituloArea</td>";
                }
                %>
                <td colspan = "2">TOTALES</td>
            </tr>
            <tr>
                <td colspan = "2">PUNTUACI&Oacute;N M&Aacute;XIMA</td>
                <?php
                for ($x = 0; $x < $num_areasPuntos; $x++) {
                    $sumPuntosOptimos = mysql_result($query_puntos, $x, 1);
                    echo "<td>$sumPuntosOptimos</td>";
                    $totalesOptimos += $sumPuntosOptimos;
                }
                ?>
                <td colspan = "2"><?php echo$totalesOptimos ?></td>
            </tr>
            <tr>
                <td colspan = "2">RESULTADO OBTENIDO</td>
                <?php
                for ($x = 0; $x < $num_areasPuntos; $x++) {
                    $sumPuntosObtenidos = mysql_result($query_puntos, $x, 0);
                    echo "<td>$sumPuntosObtenidos</td>";
                    $totalesObtenidos += $sumPuntosObtenidos;
                }
                $color = obtenerColor(($totalesObtenidos / $totalesOptimos) * 100);
                ?>
                <td colspan = "2" style="background-color: <php echo $color >; font-weight:bold; "><?php echo$totalesObtenidos ?></td>
            </tr>
            <tr>
                <td colspan = "2">PORCENTAJE DE &Eacute;XITO</td>
                <?php
                for ($x = 0; $x < $num_areasPuntos; $x++) {
                    $PuntosObtenidos = mysql_result($query_puntos, $x, 0);
                    $PuntosOptimos = mysql_result($query_puntos, $x, 1);
                    if ($PuntosOptimos != 0)
                        $Porcentaje = ($PuntosObtenidos / $PuntosOptimos) * 100;
                    else
                        $Porcentaje = 0;
        
                    $color = obtenerColor($Porcentaje);
                    $Porcentaje=round($Porcentaje);
                    echo "<td style='background-color: $color; color: $letraColor; font-weight:bold;'>$Porcentaje&#37;</td>";
        //            $totalesObtenidos += $sumPuntosObtenidos;
                }
                if ($totalesOptimos != 0)
                    $PorcentajeTotal = ($totalesObtenidos / $totalesOptimos) * 100;
                else
                    $PorcentajeTotal = 0;
                $color = obtenerColor($PorcentajeTotal);
                ?>
                <td colspan = "2" style="background-color: <php echo $color >; font-weight:bold; "> <?php echo $PorcentajeTotal ?>&#37;</td>
            </tr>
            -->

            <%
                if (arrayDepartamentos.size() > 0) {
                    for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                        arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getIddepartamento());

            %>            
            <tr>
                <td colspan ="11">&nbsp;</td>
            </tr>
            <tr>
                <td colspan ="11" style="font-size:16px; text-align:center; background-color: #A4A4A4;"> <%=arrayDepartamentos.get(tabla).getDepartamento()%></td>
            </tr>
            <tr>
                <td style="text-align:center; background-color: black; color: white">&Aacute;rea</td>
                <td width="330px" style="text-align:center; background-color: black; color: white">Indicador</td>
                <td width="130px" style="background-color: black; color: white">Objetivo Global <br/>Anual</td>
                <td width="103px" style="background-color: black; color: white">Objetivo del <br/><%=mesCuatrimestre%> mes del <br/>Cuatrimestre</td>
                <td width="103px" style="background-color: black; color: white">Incurrido del <br/><%=mesCuatrimestre%> mes del <br/>Cuatrimestre</td>
                <td width="103px" style="background-color: black; color: white">&#37; de <br/>Cumplimiento <br/>del <%=mesCuatrimestre%> mes del <br/>Cuatrimestre</td>
                <td width="103px" style="background-color: black; color: white">Objetivo <br/>Acumulado del <br/>Cuatrimestre</td>
                <td width="103px" style="background-color: black; color: white">Incurrido <br/>Acumulado del <br/>Cuatrimestre</td>
                <td width="103px" style="background-color: black; color: white">&#37; de <br/>Cumplimiento <br/>Acumulado del <br/>Cuatrimestre</td>
                <td width="103px" style="background-color: black; color: white">Puntuaci&oacute;n <br/>Obtenida</td>
                <td width="103px" style="background-color: black; color: white">Puntuaci&oacute;n <br/>&Oacute;ptima <br/>Propuesta <br/><%=anioReporte%></td>
            </tr>
            <%
                        int totalesObtenidos = 0;
                        int totalesOptimos = 0;
                        //$query_reporte = $obj_balance->obtenerReporte_x_departamento($mes, $anio, mysql_result($query_departmentos, $tabla, 0));
                        //$num_indicadores = mysql_num_rows($query_reporte);
                        for (int i = 0; i < arrayBalance.size(); i++) {
                            //                $id = mysql_result($quey_reporte, $i, 0);
                            String area = arrayBalance.get(i).getArea();
                            String indicador = arrayBalance.get(i).getIndicador();
                            double objAnual = modelo.generarReporte.redondear(arrayBalance.get(i).getObjAnual(), 2);
                            //out.print("<td>" + objMath.redondear(Inspeccion2, 2) + "</td>");
                            double objetivoCuatrimestre = arrayBalance.get(i).getObjCuatrimestre();
                            double incurridoCuatrimestre = arrayBalance.get(i).getIncCuatrimestre();
                            double cumplientoCuatrimestre = arrayBalance.get(i).getCumCuatrimestre();
                            double objetivoAcumulado = arrayBalance.get(i).getObjAcumulado();
                            double incurridoAcumulado = arrayBalance.get(i).getIncAcumulado();
                            double cumplimientoAcumulado = arrayBalance.get(i).getCumAcumulado();
                            double puntosObtenidos = arrayBalance.get(i).getPuntosObtenidos();
                            double puntosOptimos = arrayBalance.get(i).getPuntosOptimos();
                            String medida = arrayBalance.get(i).getMedida();

                            //color = obtenerColor($cumplimiento_acumulado);
                            totalesObtenidos += puntosObtenidos;
                            totalesOptimos += puntosOptimos;
                            out.print("<tr width='auto'> <td>" + area + "</td><td width='auto' style='font-size:75%'>" + indicador + "</td>");
                            medida = medida.replace(" ", "");
                            if (medida.equals("%")) {
                                //                    $obj_anual*=100;
                                //                    $objetivo_cuatrimestre*=100;
                                //                    $incurrido_cuatrimestre*=100;
                                //                    $objetivo_acumulado*=100;
                                //                    $incurrido_acumulado*=100;
                               //bien out.print("<td style='text-align:right;'>" + objAnual + " " + medida + "</td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(objAnual, 0) + medida + "</td>");
                               //bien out.print("<td style='text-align:right;'>" + objetivoCuatrimestre + " " + medida + "</td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(objetivoCuatrimestre, 0) + medida + "</td>");
                               //bien out.print("<td style='text-align:right;'>" + incurridoCuatrimestre + " " + medida + "</td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(incurridoCuatrimestre, 0) + medida +"</td>");
                                //bien out.print("<td style='text-align:right;'>" + cumplientoCuatrimestre + " </td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(cumplientoCuatrimestre, 0) +"%</td>");
                               //bien out.print("<td style='text-align:right;'>" + objetivoAcumulado + " " + medida + "</td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(objetivoAcumulado, 0) + medida + "</td>");
                               //bien out.print("<td style='text-align:right;'>" + incurridoAcumulado + " " + medida + "</td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(incurridoAcumulado, 0) + medida +"</td>");
                               //bien out.print("<td style='text-align:right;'>" + cumplimientoAcumulado + " </td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(cumplimientoAcumulado, 0) + "%</td>");
                            } else {
                                out.print("<td style='text-align:right;'>" + medida + " " + (int) objAnual + "</td>");
                                out.print("<td style='text-align:right;'>" + medida + " " + (int) objetivoCuatrimestre + "</td>");
                                //bien out.print("<td style='text-align:right;'>" + medida + " " + incurridoCuatrimestre + "</td>");
                                out.print("<td style='text-align:right;'>" +medida+ " " + (int) objMath.redondear(incurridoCuatrimestre , 0) + "</td>");
                                //bien out.print("<td style='text-align:right;'>" + cumplientoCuatrimestre + "</td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(cumplientoCuatrimestre, 0) + "%</td>");
                                //bien out.print("<td style='text-align:right;'>" + medida + " " + objetivoAcumulado + "</td>");
                                out.print("<td style='text-align:right;'>"+ medida + " " + (int) objMath.redondear(objetivoAcumulado, 0) + "</td>");
                                //bien out.print("<td style='text-align:right;'>" + medida + " " + incurridoAcumulado + "</td>");
                                out.print("<td style='text-align:right;'>"+medida+ " " + (int) objMath.redondear(incurridoAcumulado, 0) +"</td>");
                               //bien out.print("<td style='text-align:right;'>" + cumplimientoAcumulado + " %</td>");
                                out.print("<td style='text-align:right;'>" + (int) objMath.redondear(cumplimientoAcumulado, 0) + "%</td>");
                            }
                            //bien  out.print("<td style='background-color: $color;  color: green; font-weight:bold;'>" + puntosObtenidos + "</td>");
                            out.print("<td style='background-color: $color;  color: green; font-weight:bold;'>"  + (int) objMath.redondear(puntosObtenidos, 0) + "</td>");
                            out.print("<td>" + (int) objMath.redondear(puntosOptimos, 0) + "</td>");
                            out.print("</tr>");
                        }
                        out.print("<tr>");
                        out.print("<td colspan='8'></td>");
                        out.print("<td style='background-color: #FFFD64'>TOTALES</td>");
                        out.print("<td style='background-color: #FFFD64'>" + (int) totalesObtenidos + "</td>");
                        out.print("<td style='background-color: #FFFD64'>" + (int) totalesOptimos + "</td>");
                        out.print("</tr>");

                    }
                }
            %>

        </table>

    </body>
</html>
