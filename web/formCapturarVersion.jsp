<%-- 
    Document   : formCapturarVersion
    Created on : 29/01/2018, 03:46:03 PM
    Author     : Guadalupe
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1" import="modelo.marcas, modelo.modelos, java.util.ArrayList;" %>
<!DOCTYPE html>
<%

    String usuarioValidado = request.getParameter("usuarioIngresado");
    int tabindex = 0;

    marcas objMarcas = new marcas();
    ArrayList<marcas> arrayMarcas = new ArrayList<marcas>();
    arrayMarcas = objMarcas.mostrarMarcas();
%>

<div style="background: #FFF; background-image:url('images/GuliettaLogo.png');background-repeat:no-repeat; background-position:center; background-attachment:inherit; ">
    <form name="sampleform">
        <table cellpadding="10" cellspacing="5" border="1">
            <tr>
                <td colspan="3">Datos del Veh&iacute;culo</td>
                <td><input type="hidden" name="usuario" id="usuario" value="<%=usuarioValidado%>"/></td>
            </tr>
        </table>
        <table>
            <tr>
                <td width="150px" height="40px" style="text-align: right">Marca:&nbsp;</td>
                <td colspan="2">
                    <select tabindex="<%=tabindex++%>" class="sucursal" name="marca" id="marca" value="" onchange="javascript: mostrarModelos('comboModelo.jsp', 'marca', 'divModelo')">
                        <option value="null">Selecciona alguna marca</option>
                        <%
                            if (arrayMarcas.size() > 0) {
                                for (int i = 0; i < arrayMarcas.size(); i++) {
                                    int idMarca = arrayMarcas.get(i).getIdMarca();
                                    String identificaMarca = arrayMarcas.get(i).getIdentificaMarca();
                                    String marca = arrayMarcas.get(i).getMarca();
                                    out.print("<option value='" + identificaMarca + "'>" + marca + "</option>");
                                }
                            } else {
                                out.println("<option value='null'>No se encontro marca</option>");
                            }
                        %>
                    </select>
                </td>
                <td></td>
            </tr>
        </table>
        <div id="divModelo">
            <table>
                <tr>
                    <td width="150px" height="40px" style="text-align: right">Modelo:&nbsp;</td>
                    <td colspan="2"><select tabindex="<%=tabindex++%>" class="sucursal" name="modelo" id="modelo" value="">
                            <option value="null">Selecciona alguna marca</option>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td width="150px" height="40px" style="text-align: right">Versi&oacute;n:&nbsp;</td>
                    <td colspan="2"><input type="text" tabindex="<%=tabindex++%>" class="sucursal" name="version" id="version" value="Selecciona alguna marca" disabled/></td>
                    <td></td>
                </tr>
                <tr>            
                    <td width="150px" height="40px" style="text-align: right">A&ntilde;o:&nbsp;</td>
                    <td colspan="2"><input type="text" tabindex="<%=tabindex++%>" class="sucursal" name="anio" id="anio" value="Selecciona alguna marca" disabled/></td>
                    <td></td>
                </tr>
                <tr>            
                    <td width="150px" height="40px" style="text-align: right">Cat&aacute;logo:&nbsp;</td>
                    <td colspan="2"><input type="text" tabindex="<%=tabindex++%>" class="sucursal" name="cpos" id="cpos" value="Selecciona alguna marca" disabled/></td>
                    <td></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td width="150px" height="40px" style="text-align: right;">Precio:&nbsp;</td>
                    <td width="150px">$ <input tabindex="<%=tabindex++%>" type="number" style="width: 80%;" name="precio" id="precio" class="sucursal" min="0.00" max="999999.99" step=".01" value="" required disabled/></td>
                    <td width="150px" height="40px" style="text-align: right;">Bonificacion:&nbsp;</td>
                    <td width="150px">$ <input tabindex="<%=tabindex++%>" type="number" style="width: 80%;" name="bonificacion" id="bonificacion" class="sucursal" min="0.00" max="999999.99" step=".01" value="" required disabled/></td>
                </tr>
                <tr>
                    <td width="150px" height="40px" style="text-align: right">Cuota SPDC:&nbsp;</td>
                    <td width="100px">$ <input tabindex="<%=tabindex++%>" type="number" style="width: 80%;" name="spdc" id="spdc" class="sucursal" min="0.00" max="999999.99" step=".01" value="" required disabled/></td>

                    <td width="100px" height="40px" style="text-align: right">Cuota Tracomex 1:&nbsp;</td>
                    <td width="100px"><input tabindex="<%=tabindex++%>" type="number" style="width: 80%;" name="tracomex1" id="tracomex1" class="text" min="0.00" max="999999.99" step=".01" value="" required disabled/></td>
                </tr>
                <tr>
                    <td width="150px" height="40px" style="text-align: right">Cuota Tracomex 2::&nbsp;</td>
                    <td width="100px"><input tabindex="<%=tabindex++%>" type="number" style="width: 80%;" name="tracomex2" id="tracomex2" class="text" min="0.00" max="999999.99" step=".01" value="" required disabled/></td>
                    <td style="text-align:center"><input  tabindex="<%=tabindex++%>" type="reset" name="" id="" value="Nuevo" class="button" onclick="mostrarFrame('limpio.php', 'capturaUnidad');"/></td>
                    <td style="text-align:center"><input  tabindex="<%=tabindex++%>" type="button" name="" id="" value="Guardar" class="button" onclick="guardarUnidad('actualizarPrecios.jsp?accion=1', 'usuario', 'marca', 'modelos', 'versiones', 'anio', 'cpos', 'precio', 'bonificacion', 'spdc', 'tracomex1', 'tracomex2', 'capturaUnidad');"/></td>
                </tr>
            </table>
        </div>
    </form>
</div>
<div id="capturaUnidad"></div>
