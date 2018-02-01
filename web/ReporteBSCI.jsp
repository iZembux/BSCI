<%-- 
    Document   : ReporteBSCI
    Created on : 29/01/2018, 12:27:46 PM
    Author     : Guadalupe
--%>

<%@page import="servlet.Userbi"%>
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
        <% System.out.println("Validar usuarios");
        RequestDispatcher dispatcher;
        String NombreReporte = "";
        utilMath objMath = new utilMath();
        DecimalFormat df = new DecimalFormat("#.0"); 
        
        Calendar fecha_hoy = Calendar.getInstance(); 
        String añohoy = String.valueOf(fecha_hoy.get(Calendar.YEAR));
        String meshoy = String.valueOf(fecha_hoy.get(Calendar.MONTH) + 1);
       // System.out.println("Mes hoy es:."+meshoy); 
        int mesH=Integer.parseInt(meshoy);  
       // System.out.println("el Mes h es: "+mesH); 
        String diahoy = String.valueOf(fecha_hoy.get(Calendar.DAY_OF_MONTH));  
        
        ////////////////////////////////////////////////////////////////////////////////
        try { 
        String nombre = request.getParameter("nombre");
        String pass = request.getParameter("pass");
        String puesto = request.getParameter("puesto");
        System.out.println("Usuario: " +nombre);
        System.out.println("Contraseña: "+pass);
        Userbi objUsuario = new Userbi(); 
        ArrayList<Userbi> ListaUsu = objUsuario.validarUsuario(nombre); 
        HttpSession sesion = request.getSession(true); 
        String mensaje="", retorno;
        System.out.println("Lista usuarios:" +ListaUsu);  
        if (ListaUsu.size() > 0) {
            String usuario = ListaUsu.get(0).getUsuario();
            
                int idUsuario = ListaUsu.get(0).getIduserBI();
                String password = ListaUsu.get(0).getPassword();
                String NombreUser = ListaUsu.get(0).getNombre(); 
                String Puesto= ListaUsu.get(0).getPuesto();
                System.out.println("Puestoooooo:" +Puesto); 
                System.out.println("idusuario" + idUsuario);
                System.out.println("USUARIO: " + usuario);
                System.out.println("PASSWORD: " + password);

                String retorno1 = "";
                 if (password.equals(pass)) {
                     System.out.println("Contraseñas iguales");
                     retorno1 = "/ReportesG.jsp";  
                     System.out.println("Entra en reportesG");
                    sesion.setAttribute("idUsuario", "" + idUsuario);
                    sesion.setAttribute("Bienvenido", "1");
                    mensaje += "BIENVENIDO usuario " + usuario + ""; 
                    retorno = retorno1; 
                    
                    sesion.setAttribute("usuarioIngresado", usuario);
                    sesion.setAttribute("passwordIngresado", password);
                    sesion.setAttribute("idUsuario", "" + idUsuario);
                    sesion.setAttribute("NombreUsuario", "" + NombreUser); 
                    sesion.setAttribute("Puesto",Puesto);  
                    dispatcher = getServletContext().getRequestDispatcher(retorno);
                    dispatcher.forward(request, response);
                 } else {
                   
                    mensaje += "Password Incorrecto, favor de rectificar";
                    retorno = "/login.html";
                    }
                 sesion.setAttribute("mensaje", mensaje);
                dispatcher = getServletContext().getRequestDispatcher(retorno);
                response.sendRedirect("login.html");
                dispatcher.forward(request, response);
                
        } else {
                mensaje += "Usuario Incorrecto favor de verificar";
                retorno = "/login.html";
                dispatcher = getServletContext().getRequestDispatcher(retorno);
                dispatcher.forward(request, response);
                //response.sendRedirect("acceso.jsp");
            } 
        } catch (Exception e) {
            
        } 
        %>
        
       
    </body>
</html>
