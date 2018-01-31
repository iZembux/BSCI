/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.procesosFecha;
import modelo.usuarios;

/**
 *
 * @author ricar_000
 */
@WebServlet(name = "acceso", urlPatterns = {"/acceso"})
public class acceso extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesosFecha objProcesos = new procesosFecha();
        String fecha = objProcesos.formatosFecha();
        response.setContentType("text/html;charset=iso-8859-1");
        PrintWriter out = response.getWriter();
        try {
            String usuarioIngresado, passwordIngresado, mensaje = "", retorno = "", opcionUnidad = "";
            usuarioIngresado = request.getParameter("usuarioIngresado");
            passwordIngresado = request.getParameter("passwordIngresado");
            opcionUnidad = request.getParameter("cmbSucursal");
            System.out.println("Usuario ingresado:" + usuarioIngresado);
            System.out.println("Password ingresado:" + passwordIngresado);
            System.out.println("Unidad seleccionada : " + opcionUnidad);

            /*
             *Creamos un objeto de tipo usuario para validar existencia en la base de datos
             *Paso 1: Si la lista que devulve contiene algun elemento quiere decir que si existe
             *el usuario y psamos al siguiente paso
             */
            usuarios objUsuario = new usuarios();
            RequestDispatcher dispatcher;
            ArrayList<usuarios> ListaUsu = objUsuario.validarUsuario(usuarioIngresado);
            HttpSession sesion = request.getSession(true);

            if (ListaUsu.size() > 0) {
                int statusQuery;

                //Almacenamos algunas de las variables traidas en la lista
                String usuario = ListaUsu.get(0).getUsu_Usuario();
                int idUsuario = ListaUsu.get(0).getUsu_IdUsuario();
                String password = ListaUsu.get(0).getUsu_Password();
                String tipoUsuario = ListaUsu.get(0).getUsu_TipoUsuario();
                int intentos = ListaUsu.get(0).getUsu_Intentos();
                int status = ListaUsu.get(0).getUsu_Status();
                System.out.println("idusuario" + idUsuario);
                System.out.println("USUARIO: " + usuario);
                System.out.println("PASSWORD: " + password);
                System.out.println("tipoUusario" + tipoUsuario);
                System.out.println("usuario status : " + status);

                String retorno1 = "";
                //-------------------------------------------------------------------------------------------------------------------------
                /* paso 2: VERIFICAR PASSWORD */ 
                if (password.equals(passwordIngresado)) {
                    //PASSWORD CORRECTO
                    /* paso 3: verificar status*/
                    if (intentos > 2) {
                        mensaje += "El usuario " + usuario + " esta bloqueado  Pongase en contacto con el administrador";
                        retorno = "/acceso.jsp";
                        /* paso 4: verificar que cuente con privilegios*/
                    } else {
                        mensaje += "BIENVENIDO usuario " + usuario + "";
                        retorno = "/generar.jsp";
                        System.out.println("Esta es la primer pagina que retorna : ******" + retorno + "*****");
                        sesion.setAttribute("usuarioIngresado", usuario);
                        sesion.setAttribute("tipoUsuarioIngresado", tipoUsuario);
                        sesion.setAttribute("passwordIngresado", password);
                        sesion.setAttribute("idUsuario", "" + idUsuario);
                    }
                    //dispatcher = getServletContext().getRequestDispatcher(retorno);
                    //dispatcher.forward(request, response);
                } else {
                    mensaje += "Password Incorrecto, favor de rectificar";
                    retorno = "/acceso.jsp";
                    intentos++;
                    if (intentos > 3) {
                        intentos = 3;
                    } else {
                        //statusQuery = objUsuario.actualizarIntentos(idUsuario, intentos);
                        //if (statusQuery != 0) {
                        //  System.out.println("ERROR AL ACTUALIZAR INTENTOS");
                        //}
                    }
                    mensaje += " -- Intento " + intentos + " de 3 del usuario: " + usuarioIngresado + "";
                }
                sesion.setAttribute("mensaje", mensaje);
                //dispatcher = getServletContext().getRequestDispatcher(retorno);
                //dispatcher.forward(request, response);
                //response.sendRedirect("acceso.jsp");
                //-------------------------------------------------------------------------------------------------------------------------
            } else {
                mensaje += "Usuario Incorrecto con contrasena favor de verificar";
                retorno = "/acceso.jsp";
                sesion.setAttribute("mensaje", mensaje);
                //response.sendRedirect("acceso.jsp");
            }
            dispatcher = getServletContext().getRequestDispatcher(retorno);
            dispatcher.forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}