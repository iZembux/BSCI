<%-- 
    Document   : filtroIncurridosCap
    Created on : 29/01/2018, 03:41:50 PM
    Author     : Guadalupe
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1" import="modelo.incurridos, java.text.DecimalFormat, java.util.ArrayList;"%>
<!DOCTYPE html>
<%

    DecimalFormat objDecimal = new DecimalFormat("###,###.##");
    String unidadNegocio = "";
    String identificaDepartamento = "";
    String identificaArea = "";
    String mesMostrar = "";
    String anioMostrar = "";
    try {
        unidadNegocio = request.getParameter("unidadNegocio");
        System.out.println("Unidad de Negocio: " + unidadNegocio);
    } catch (Exception e) {
    }
    try {
        identificaDepartamento = request.getParameter("identificaDepartamento");
        System.out.println("Identifica Departamento: " + identificaDepartamento);
    } catch (Exception e) {
    }
    try {
        identificaArea = request.getParameter("identificaArea");
        System.out.println("Identifica Area: " + identificaArea);
    } catch (Exception e) {
    }
    try {
        mesMostrar = request.getParameter("mes");
        System.out.println("Mes a Mostrar: " + mesMostrar);
    } catch (Exception e) {
    }
    try {
        anioMostrar = request.getParameter("anio");
        System.out.println("Anio a Mostrar: " + anioMostrar);
    } catch (Exception e) {
    }

    incurridos objIncurridos = new incurridos();
    ArrayList<incurridos> consulta = new ArrayList();
    consulta = objIncurridos.consultarIncurridosCapFiltro(unidadNegocio, identificaDepartamento, identificaArea, anioMostrar);
%>

<jsp:include page="bannerEmpresa.jsp">
    <jsp:param name="unidadNegocio" value="<%=unidadNegocio%>" />
</jsp:include>
<table class="tile table table-bordered table-striped" style=" width: 98%; text-align: center;">
    <thead>
        <tr>
            <td class="col-md-2">Departamento</td>
            <td class="col-md-1">Area</td>
            <td class="col-md-3">Incurrido</td>
            <td class="col-md-1">A&ntilde;o</td>
            <td class="col-md-2"><%=mesMostrar%></td>
            <td class="col-md-2">Acumulado a <%=mesMostrar%></td>
            <td class="col-md-2">Actualizar</td>
        </tr>
    </thead>
    <tbody></tbody>    
</table>
<div id="areaDetalle"  style="width: 1300px; height: 200px; overflow-y: scroll;">
    <table class="tile table table-bordered table-striped"
          style=" text-align: center">
        <thead>
        </thead>
        <tbody>
            <%
                if (consulta.size() > 0) {
                    for (int i = 0; i < consulta.size(); i++) {

                        int Idincurrido = consulta.get(i).getBal_idincurrido();
                        String identificaIndicador = consulta.get(i).getBal_identificaIndicador();
                        String departamento = consulta.get(i).getDepartamento();
                        String area = consulta.get(i).getArea();
                        String Incurrido = consulta.get(i).getBal_incurrido();
                        int Anio = consulta.get(i).getBal_anio();
                        Double Enero = consulta.get(i).getBal_enero();
                        Double EneroAcumulado = consulta.get(i).getBal_eneroAcumulado();
                        Double Febrero = consulta.get(i).getBal_febrero();
                        Double FebreroAcumulado = consulta.get(i).getBal_febreroAcumulado();
                        Double Marzo = consulta.get(i).getBal_marzo();
                        Double MarzoAcumulado = consulta.get(i).getBal_marzoAcumulado();
                        Double Abril = consulta.get(i).getBal_abril();
                        Double AbrilAcumulado = consulta.get(i).getBal_abrilAcumulado();
                        Double Mayo = consulta.get(i).getBal_mayo();
                        Double MayoAcumulado = consulta.get(i).getBal_mayoAcumulado();
                        Double Junio = consulta.get(i).getBal_junio();
                        Double JunioAcumulado = consulta.get(i).getBal_junioAcumulado();
                        Double Julio = consulta.get(i).getBal_julio();
                        Double JulioAcumulado = consulta.get(i).getBal_julioAcumulado();
                        Double Agosto = consulta.get(i).getBal_agosto();
                        Double AgostoAcumulado = consulta.get(i).getBal_agostoAcumulado();
                        Double Septiembre = consulta.get(i).getBal_septiembre();
                        Double SeptiembreAcumulado = consulta.get(i).getBal_septiembreAcumulado();
                        Double Octubre = consulta.get(i).getBal_octubre();
                        Double OctubreAcumulado = consulta.get(i).getBal_octubreAcumulado();
                        Double Noviembre = consulta.get(i).getBal_noviembre();
                        Double NoviembreAcumulado = consulta.get(i).getBal_noviembreAcumulado();
                        Double Diciembre = consulta.get(i).getBal_diciembre();
                        Double DiciembreAcumulado = consulta.get(i).getBal_diciembreAcumulado();
                        int Activo = consulta.get(i).getBal_activo();

                        try {

                        } catch (Exception e) {
                        }
            %>
            <tr>
                <%--<td width="200px" height="20px" class="puesto"><% out.print(Idincurrido);%></td>--%>
                <td class="col-md-2"><input type="hidden" name="identifica" id="identifica"><% out.print(departamento);%></td>
                <td class="col-md-1"><% out.print(area);%></td>
                <td style=" text-align: left" class="col-md-3"><% out.print(Incurrido);%></td>
                <td class="col-md-1"><% out.print(Anio);%></td>
                <% if (mesMostrar.equals("Enero")) {%>
                <td class="col-md-2"><input type="number" name="Enero<%=Idincurrido%>" id="Enero<%=Idincurrido%>" value="<%=Enero%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="EneroAcumulado<%=Idincurrido%>" id="EneroAcumulado<%=Idincurrido%>" 
                                                       value="<%=EneroAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Febrero")) {%>
                <td class="col-md-2"><input type="number" name="Febrero<%=Idincurrido%>" id="Febrero<%=Idincurrido%>" value="<%=Febrero%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="FebreroAcumulado<%=Idincurrido%>" id="FebreroAcumulado<%=Idincurrido%>" 
                                                       value="<%=FebreroAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Marzo")) {%>
                <td class="col-md-2"><input type="number" name="Marzo<%=Idincurrido%>" id="Marzo<%=Idincurrido%>" value="<%=Marzo%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="MarzoAcumulado<%=Idincurrido%>" id="MarzoAcumulado<%=Idincurrido%>"
                                                       value="<%=MarzoAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Abril")) {%>
                <td class="col-md-2"><input type="number" name="Abril<%=Idincurrido%>" id="Abril<%=Idincurrido%>" value="<%=Abril%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="AbrilAcumulado<%=Idincurrido%>" id="AbrilAcumulado<%=Idincurrido%>" 
                                                       value="<%=AbrilAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Mayo")) {%>
                <td class="col-md-2"><input type="number" name="Mayo<%=Idincurrido%>" id="Mayo<%=Idincurrido%>" value="<%=Mayo%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="MayoAcumulado<%=Idincurrido%>" id="MayoAcumulado<%=Idincurrido%>" 
                                                       value="<%=MayoAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Junio")) {%>
                <td class="col-md-2"><input type="number" name="Junio<%=Idincurrido%>" id="Junio<%=Idincurrido%>" value="<%=Junio%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="JunioAcumulado<%=Idincurrido%>" id="JunioAcumulado<%=Idincurrido%>" 
                                                      value="<%=JunioAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Julio")) {%>
                <td class="col-md-2"><input type="number" name="Julio<%=Idincurrido%>" id="Julio<%=Idincurrido%>" value="<%=Julio%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="JulioAcumulado<%=Idincurrido%>" id="JulioAcumulado<%=Idincurrido%>" 
                                                       value="<%=JulioAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Agosto")) {%>
                <td class="col-md-2"><input type="number" name="Agosto<%=Idincurrido%>" id="Agosto<%=Idincurrido%>" value="<%=Agosto%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="AgostoAcumulado<%=Idincurrido%>" id="AgostoAcumulado<%=Idincurrido%>"
                                                       value="<%=AgostoAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Septiembre")) {%>
                <td class="col-md-2"><input type="number" name="Septiembre<%=Idincurrido%>" id="Septiembre<%=Idincurrido%>" value="<%=Septiembre%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="SeptiembreAcumulado<%=Idincurrido%>" id="SeptiembreAcumulado<%=Idincurrido%>" 
                                                       value="<%=SeptiembreAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Octubre")) {%>
                <td class="col-md-2"><input type="number" name="Octubre<%=Idincurrido%>" id="Octubre<%=Idincurrido%>" value="<%=Octubre%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="OctubreAcumulado<%=Idincurrido%>" id="OctubreAcumulado<%=Idincurrido%>" 
                                                       value="<%=OctubreAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Noviembre")) {%>
                <td class="col-md-2"><input type="number" name="Noviembre<%=Idincurrido%>" id="Noviembre<%=Idincurrido%>" value="<%=Noviembre%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="NoviembreAcumulado<%=Idincurrido%>" id="NoviembreAcumulado<%=Idincurrido%>" 
                                                       value="<%=NoviembreAcumulado%>" class="form-control"></td>
                    <% } %>
                    <% if (mesMostrar.equals("Diciembre")) {%>
                <td class="col-md-2"><input type="number" name="Diciembre<%=Idincurrido%>" id="Diciembre<%=Idincurrido%>" value="<%=Diciembre%>" class="form-control"></td>
                <td class="col-md-2"><input type="number" name="DiciembreAcumulado<%=Idincurrido%>" id="DiciembreAcumulado<%=Idincurrido%>" 
                                                       value="<%=DiciembreAcumulado%>" class="form-control"></td>
                    <% }%>
                    <%--<td width="500px" height="20px" class="puesto"><% out.print(Activo);%></td>--%>
                    <%--<td width="100px" height="20px"><input type="button" name="actualizar" id="actualizar" value="Actualizar" onclick="actualizarIncurrido('actualizarIncurridos.jsp?accion=2&usuario=Sistemas&unidadNegocio=<%=unidadNegocio%>', '<% out.print(Idincurrido);%>', '<% out.print(Anio);%>', 'enero<%=Idincurrido%>', 'febrero<%=Idincurrido%>', 'marzo<%=Idincurrido%>', 'abril<%=Idincurrido%>', 'mayo<%=Idincurrido%>', 'junio<%=Idincurrido%>', 'julio<%=Idincurrido%>', 'agosto<%=Idincurrido%>', 'septiembre<%=Idincurrido%>', 'octubre<%=Idincurrido%>', 'noviembre<%=Idincurrido%>', 'diciembre<%=Idincurrido%>', 'actulizaIncurrido');"/></td>--%>
                    <%--onclick="actualizarIncurridoEnero('actualizarIncurridos.jsp?accion=2&usuario=Sistemas&unidadNegocio=<%=unidadNegocio%>', '<% out.print(Idincurrido);%>', '<% out.print(Anio);%>', 'enero<%=Idincurrido%>', 'actulizaIncurrido');"--%>
                <td class="col-md-2">
                    <%--<input type="button" name="actualizar" id="actualizar" value="Actualizar" onclick="actualizarIncurridoCualquierMes('actualizarIncurridos.jsp?accion=2&usuario=Sistemas&unidadNegocio=<%=unidadNegocio%>&identificaIndicador=<%=identificaIndicador%>', '<% out.print(Idincurrido);%>', '<% out.print(Anio);%>', '<%=mesMostrar%>', '<%=mesMostrar%><%=Idincurrido%>', 'actulizaIncurrido');"/>--%>
                    <a href="#"><img src="img/save.png" width="30px" height="30px" onclick="actualizarIncurridoCapCualquierMes('actualizarIncurridosCap.jsp?accion=2&usuario=Sistemas&unidadNegocio=<%=unidadNegocio%>&identificaIndicador=<%=identificaIndicador%>', '<% out.print(Idincurrido);%>', '<% out.print(Anio);%>', '<%=mesMostrar%>', '<%=mesMostrar%><%=Idincurrido%>', '<%=mesMostrar%>Acumulado<%=Idincurrido%>', 'actulizaIncurrido');"/></a>
                </td>
            </tr>
            <%
                    }

                }
            %>
        </tbody>    
    </table>
</div>