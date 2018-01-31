<%-- 
    Document   : formulario
    Created on : 29/01/2018, 03:47:49 PM
    Author     : Guadalupe
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1" import="modelo.parametros, modelo.indicador, modelo.departamentos, modelo.areas, java.text.DecimalFormat, java.util.ArrayList, modelo.procesosFecha;"%>
<!DOCTYPE html>
<%
    /*
     HttpSession sesion = request.getSession();
     String mensaje = (String) sesion.getAttribute("mensaje");
     if (mensaje != null && !mensaje.equals("")) {
     out.print("<script>alert('" + mensaje + "')</script>");
     sesion.removeAttribute("mensaje");
     }
     */

    DecimalFormat objDecimal = new DecimalFormat("###,###.##");
    int accion = 3;

    int idIndicador = 0;
    int consecutivoIndicador = 0;
    String identificaIndicador = "BAL_ID";
    String empresa = "";
    String idepartamento = "";
    String departamento = "";
    String identificaDepartamento = "";
    String identificaArea = "";
    String area = "";

    String balindicador = "";
    Double balobjGlobal = 0.0;
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
    int balanio = 0;
    String mensaje = "";
    String cadena = "";
    try {
        accion = Integer.parseInt(request.getParameter("accion"));
    } catch (Exception e) {
    }
    indicador objIndicador = new indicador();
    areas objArea = new areas();
    parametros objParametros = new parametros();
    departamentos objDepartamento = new departamentos();
    ArrayList<areas> arrayArea = new ArrayList<areas>();
    ArrayList<departamentos> arrayDepartamento = new ArrayList<departamentos>();
    ArrayList<indicador> arrayIndicador = new ArrayList<indicador>();
    switch (accion) {
        case 0:
            //PARA ELIMINAR EL INDICADOR
            break;
        case 1:
            //PARA INSERTAR EL INDICADOR}
            mensaje = "Inserci&oacute;n de Indicador";
            arrayArea = objArea.consultarAreas();
            arrayDepartamento = objDepartamento.consultarDepartamentos();
            consecutivoIndicador = (int) objParametros.consultarConsecutivoIndicador();
            cadena = consecutivoIndicador+"";
            /*
            consecutivoIndicador = objIndicador.consultarUltimoIdIndicador();
            consecutivoIndicador++;
            for(int i=cadena.length(); i < 3; i++){
                identificaIndicador += "0";
            }
            identificaIndicador += cadena;
                    */
            break;
        case 2:
            //----------------------------------------PARA ACTUALIZAR EL INDICADOR
            mensaje = "Modificaci&oacute;n de Indicador";
            arrayArea = objArea.consultarAreas();
            arrayDepartamento = objDepartamento.consultarDepartamentos();
            try {
                idIndicador = Integer.parseInt(request.getParameter("idIndicador"));
                arrayIndicador = objIndicador.consultarIndicadorXId(idIndicador);
                if (arrayIndicador.size() > 0) {
                    for (int i = 0; i < arrayIndicador.size(); i++) {
                        idIndicador = arrayIndicador.get(i).getBal_idIndicador();
                        cadena = ""+idIndicador;
                        identificaIndicador = arrayIndicador.get(i).getBal_identificaIndicador();
                        //System.out.println("IDENTIFICA INDICADOR: " + identificaIndicador);
                        empresa = arrayIndicador.get(i).getBal_empresa();
                        identificaDepartamento = arrayIndicador.get(i).getBal_identificaDepartamento();
                        area = arrayIndicador.get(i).getBal_area();
                        departamento = arrayIndicador.get(i).getBal_departamento();
                        identificaArea = arrayIndicador.get(i).getBal_identificaArea();
                        balindicador = arrayIndicador.get(i).getBal_indicador();
                        balobjGlobal = arrayIndicador.get(i).getBal_objGlobal();
                        balenero = arrayIndicador.get(i).getBal_enero();
                        balfebrero = arrayIndicador.get(i).getBal_febrero();
                        balmarzo = arrayIndicador.get(i).getBal_marzo();
                        balabril = arrayIndicador.get(i).getBal_abril();
                        balmayo = arrayIndicador.get(i).getBal_mayo();
                        baljunio = arrayIndicador.get(i).getBal_junio();
                        baljulio = arrayIndicador.get(i).getBal_julio();
                        balagosto = arrayIndicador.get(i).getBal_agosto();
                        balseptiembre = arrayIndicador.get(i).getBal_septiembre();
                        baloctubre = arrayIndicador.get(i).getBal_octubre();
                        balnoviembre = arrayIndicador.get(i).getBal_noviembre();
                        baldiciembre = arrayIndicador.get(i).getBal_diciembre();
                        balPOptimos = arrayIndicador.get(i).getBal_puntosOptimos();
                        baloperacion = arrayIndicador.get(i).getBal_operacion();
                        balmedida = arrayIndicador.get(i).getBal_medida();
                        balactivo = arrayIndicador.get(i).getBal_activo();
                        baloperaAcumulado = arrayIndicador.get(i).getBal_operaAcumulado();
                        balredondeo = arrayIndicador.get(i).getBal_redondeo();
                        baleditable = arrayIndicador.get(i).getBal_editable();
                        balanio = arrayIndicador.get(i).getAnio();
                        System.out.println("BAL ANIOO: " + balanio);
                    }
                }
            } catch (Exception e) {
                System.out.println("No se pudo leer el Indicador");
            }
            break;
        case 3:
            //PARA ACTUALIZAR EL INDICADOR
            System.out.print("No se recibio parametro accionn");
    }
    int tabindex = 0;

%>
<html>
    <head>

        <title>Balance - Indicadores</title><%-- Set the viewport width to device width for mobile --%>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width"/>
        <%-- CSS Files--%>
        <link rel="stylesheet" href="stylesheets/style.css">
        <link rel="stylesheet" href="stylesheets/homepage.css"><%-- homepage stylesheet --%>
        <link rel="stylesheet" href="stylesheets/skins/blue.css"><%-- skin color --%>
        <link rel="stylesheet" href="stylesheets/responsive.css">
        <%-- IE Fix for HTML5 Tags --%>
        <%--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
          <![endif]--%>    
    </head>
    <body>
        <jsp:include page="encabezadoIntranet.jsp" />
        <%-- HEADER    ================================================== --%>
        <div class="twelve slider-menu">
            <div class="row">
                <jsp:include page="menu.jsp"/>
            </div>
        </div>
        <form action="VistaIndicador.jsp" method="post"> 
            <table class="row">
                <tr> 
                    <td width="420" colspan="8"><%=mensaje%><hr style=" background-color: #5882FA; height: 2px; margin-left: 0%; width: 100%;"></head></td>
                </tr>
                <tr>
                    <td width="1" >*</td>
                    <td width="100px" height="25"> <label> ID Indicador: </label><input type="hidden" name="identificaIndicador" name="identificaIndicador" value="<%=identificaIndicador%>" /></td>
                    <td colspan="2"><input tabindex="<%=tabindex++%>" type="text" class="text" name="idIndicador" id="idIndicador" value="<%=cadena%>" disabled /></td>


                    <td height="25" align="right">*</td>
                    <td width="150px" height="25"><label>Indicador (A-z):</label></td>
                    <td colspan="2"><input tabindex="<%=tabindex++%>" type="text" class="text" name="balindicador" id="balindicador" value="<%=balindicador%>" required/></td>
                </tr>
                <tr>   
                    <td align="right">*</td> 
                    <td width="100px" height="25"><label>Departamento (A-z):</label></td>
                    <td colspan="2">                                                
                        <select tabindex="<%=tabindex++%>" name ="identificaDepartamento" id="identificaDepartamento" type="seleccion"  class="text" class="seleccion">
                            <%
                                if (accion == 2) {
                                    out.println("<option class='text' value='" + identificaDepartamento + "'> " + departamento + "</option>");
                                }
                            %>
                            <option class="text" value="null"> Elige una opcion </option>
                            <%
                                if(arrayDepartamento.size() > 0){
                                    for(int i = 0; i < arrayDepartamento.size(); i++){
                                        out.println("<option class='text' value='" + arrayDepartamento.get(i).getBal_identificaDepartamento() + "'> " + arrayDepartamento.get(i).getBal_departamento()+ "</option>");
                                    }
                                }
                            %>
                        </select>
                    </td>

                    <td align="right">*</td>
                    <td width="100px" height="25"><label>&Aacute;rea: (A-z):</label></td>
                    <td colspan="2">
                        <select tabindex="<%=tabindex++%>" name ="identificaArea" id="identificaArea" type="seleccion"  class="text" class="seleccion">

                            <%
                                if (accion == 2) {
                                    out.println("<option class='text' value='" + identificaArea + "'>" + area + "</option>");
                                }
                            %>
                           <option class="text" value="null"> Elige una opcion </option>
                           <%
                                if(arrayArea.size() > 0){
                                    for(int i = 0; i < arrayArea.size(); i++){
                                        out.println("<option class='text' value='" + arrayArea.get(i).getBal_identificaArea() + "'> " + arrayArea.get(i).getBal_area()+ "</option>");
                                    }
                                }
                            %>
                        </select>
                    </td>
                <tr>
                    <td>&nbsp;</td>
                    <td><label>Empresa: (A-z):</label></td>
                    <td colspan="2">
                        <select tabindex="<%=tabindex++%>" name ="empresa" id="empresa" type="seleccion"  class="text" class="seleccion">

                            <%
                                if (accion == 2) {
                                    out.println("<option class='text' value='" + empresa + "'>" + empresa + "</option>");
                                }
                            %>
                           <option class="text" value="null"> Elige una opcion </option>
                           <option class="text" value="Continental"> Continental </option>
                           <option class="text" value="Automodena"> Automodena </option>
                           <option class="text" value="Mitsuautos"> Mitsuautos </option>
                           <option class="text" value="KoreanMotors"> Korean Motors </option>
                           <option class="text" value="Autopolanco"> Autopolanco </option>
                           <option class="text" value="AutopolancoFiat"> Autopolanco Fiat </option>
                           <option class="text" value="AutopolancoChrysler"> Autopolanco Chrysler </option>
                           <option class="text" value="Nihon"> Nihon </option>
                        </select>
                    </td>
                    <td>&nbsp;</td>
                    <td><label>A&ntilde;o:</label></td>
                    <td colspan="2">
                        <select tabindex="<%=tabindex++%>" name ="balanio" id="balanio" type="seleccion"  class="text" class="seleccion">

                            <%
                                if (accion == 2) {
                                    out.println("<option class='text' value='" + balanio + "'>" + balanio + "</option>");
                                }
                            %>
                           <option class="text" value="null"> Elige una opcion </option>
                           <%
                                for (int anio = 2016; anio <= 2016; anio++) {
                                    out.println("<option class='text' value='" + anio + "'>" + anio + "</option>");
                                }
                            %>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="4"><span class="td_texto2">Objetivos mensuales:</span></td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>

                    <td><label>Enero:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balenero" id="balenero" value="<%=balenero%>" type="number" step="0.01" min="-100000000.00" max="100000000.00"/></td>
                    <td><label>Febrero:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balfebrero" id="balfebrero" value="<%=balfebrero%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Marzo:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balmarzo" id="balmarzo" value="<%=balmarzo%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Abril:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balabril" id="balabril" value="<%=balabril%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                </tr>
                <tr>
                    <td><label>Mayo:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balmayo" id="balmayo" value="<%=balmayo%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Junio:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="baljunio" id="baljunio" value="<%=baljunio%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Julio:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="baljulio" id="baljulio" value="<%=baljulio%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Agosto:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balagosto" id="balagosto" value="<%=balagosto%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                </tr>
                <tr>
                    <td><label>Septiembre:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balseptiembre" id="balseptiembre" value="<%=balseptiembre%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Octubre:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="baloctubre" id="baloctubre" value="<%=baloctubre%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Noviembre:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="balnoviembre" id="balnoviembre" value="<%=balnoviembre%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                    <td><label>Diciembre:</label></td>
                    <td><input tabindex="<%=tabindex++%>" name="baldiciembre" id="baldiciembre" value="<%=baldiciembre%>" type="number" step="0.01" min="0.00" max="100000000.00"/></td>
                </tr>   
                <tr>
                    <td colspan="8">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"  align="right"><label>Objetivo Global:</label></td>
                    <td colspan="2"><input tabindex="<%=tabindex++%>" name="objGlobal" id="objGlobal" type="number" step="0.01" min="0.00" max="100000000.00" value="<%=balobjGlobal%>"  maxlength="3"/></td>
                    <%--------------------------------------------------------------------------------------------------------------------------------------%>
                    <%--------------------------------------------------------------------------------------------------------------------------------------%>
                    <td><label>Operacion:</label></td>
                    <td><select tabindex="<%=tabindex++%>" name ="baloperacion" id="baloperacion" type="seleccion" class="seleccion">
                            <%
                                if (accion == 2) {
                                    out.println("<option value='" + baloperacion + "'> " + baloperacion + " </option>");
                                }
                            %>
                            <option value="mas"> M&aacute;s es mejor </option>
                            <option value="menos">  Menos es mejor  </option>
                        </select>
                    </td>
                    <td><label>Medida:</label></td>
                    <td>
                        <select tabindex="<%=tabindex++%>" name ="balmedida" id="balmedida" type="seleccion" class="seleccion">    
                            <%
                                if (accion == 2) {
                                    out.println("<option class='text' value='" + balmedida + "'> " + balmedida + " </option>");
                                }
                            %>
                            <option value=""> Ninguna </option>
                            <option value="$"> $ </option>
                            <option value="%"> % </option>
                        </select>
                    </td>    
                </tr>
                <%--------------------------------------------------------------------------------------------------------------------------------------%>
                <%--------------------------------------------------------------------------------------------------------------------------------------%>
                <tr>
                    <td colspan="2" align="right"><label>Puntuacion Optima:</label></td>
                    <td colspan="2"><input tabindex="<%=tabindex++%>" type="number" name="balPOptimos" id="balPOptimos" step="1" min="0" max="50" class="obj" value="<%=balPOptimos%>"/></td>
                    <%--------------------------------------------------------------------------------------------------------------------------------------%>
                    <%--------------------------------------------------------------------------------------------------------------------------------------%>
                    <td><label>Redondeo:</label></td>
                    <td>
                        <select tabindex="<%=tabindex++%>" name="balredondeo" id="balredondeo" type="seleccion" class="seleccion"> 
                            <%
                                if (accion == 2) {
                                    String texto = "";
                                    if(balredondeo == 0){
                                        texto = "No";
                                    }
                                    if(balredondeo == 1){
                                        texto = "Si";
                                    }
                                    out.println("<option class='text' value='" + balredondeo + "'>" + texto + "</option>");
                                }
                            %>
                            <option value="1"> Si</option>
                            <option value="0"> No </option>
                        </select>

                    </td>
                    <td><label>Editable:</label></td>
                    <td>
                        <select tabindex="<%=tabindex++%>" name ="baleditable" id="baleditable" type="seleccion" class="seleccion">
                            <%
                                if (accion == 2) {
                                    String texto = "";
                                    if(baleditable == 0){
                                        texto = "No";
                                    }
                                    if(baleditable == 1){
                                        texto = "Si";
                                    }
                                    out.println("<option class='text' value='" + baleditable + "'>" + texto + "</option>");
                                }
                            %>
                            <option value="1"> Si </option>
                            <option value="0"> No </option>
                        </select>
                    </td>
                </tr>
                <%--------------------------------------------------------------------------------------------------------------------------------------%>
                <%--------------------------------------------------------------------------------------------------------------------------------------%>
                <tr>
                    <td><label>Opera acumulado:</label></td>
                    <td><select tabindex="<%=tabindex++%>" name ="baloperaAcumulado" id="baloperaAcumulado" type="seleccion" class="seleccion">
                            <%
                                if (accion == 2) {
                                    String texto = "";
                                    if(baloperaAcumulado.equals("prom")){
                                        texto = "Promediado";
                                    }
                                    if(baloperaAcumulado.equals("suma")){
                                        texto = "Aumulado";
                                    }
                                    if(baloperaAcumulado.equals("cap")){
                                        texto = "Capturado";
                                    }
                                    out.println("<option value='" + baloperaAcumulado + "'> " + texto + " </option>");
                                }
                            %>
                            <option value="prom">Promediado</option>
                            <option value="suma">Acumulado</option>
                            <option value="cap">Capturado</option>

                        </select>
                    </td>
                    <td><label>Activo:</label></td>
                    <td>
                        <select tabindex="<%=tabindex++%>" name ="balactivo" id="balactivo" type="seleccion" class="seleccion">
                            <%
                                if (accion == 2) {
                                    String texto = "";
                                    if(balactivo == 0){
                                        texto = "No";
                                    }
                                    if(balactivo == 1){
                                        texto = "Si";
                                    }
                                    out.println("<option class='text' value='" + balactivo + "'>" + texto + "</option>");
                                }
                            %>
                            <option value="1"> Si </option>
                            <option value="0"> No </option>
                        </select>
                    </td>
                    <td></td>

                    <td colspan="2" align="center" valign="top">
                        <input type="hidden" name="accion" id="accion" value="<%=accion%>">
                        <input type="hidden" name="identificaIndicador" id="identificaIndicador" value="<%=identificaIndicador%>">
                        <input type="hidden" name="balanio" id="balanio" value="<%=balanio%>">
                        <input tabindex="<%=tabindex++%>" name="send" id="send" type="submit" class="submit" value="Aceptar" /> </td>
                    <td colspan="2"> <input tabindex="<%=tabindex++%>" name="cancel" id="cancel" type="submit" class="submit" value="Cancelar"> </td>
                </tr>
                <tr>
                    <td colspan="8">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="4"><span>*Campos obligatorios </span></td>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </form>

        <%--<p style="text-align:center;font-size:20px">Formulario enviado con &eacute;xito!!! <br /> 
            Redireccionanado...
        <div style="text-align:center;font-size:15px">si su navegador no lo redirecciona dar click <a href="consulta_indicadores.php">aqui </a></div>--%>

        <jsp:include page="marcasInferior.jsp" />
        <%-- TESTIMONIALS     ================================================== --%>
        <%-- <jsp:include page="testimonials.jsp" />--%>
        <%-- TWITTER          ================================================== --%>
        <%-- <jsp:include page="twiter.jsp" /> --%>
        <%-- FOOOTER          ================================================== --%>
        <jsp:include page="piePagina.jsp" />
        <%-- JAVASCRIPTS      ================================================== --%>
        <%-- Javascript files placed here for faster loading --%>
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
    </body>
</html>
                          