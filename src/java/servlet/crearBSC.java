/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.utilMath;

/**
 *
 * @author becario-TI
 */
@WebServlet(name = "crearBSC", urlPatterns = {"/crearBSC"})
public class crearBSC extends HttpServlet {

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
        System.out.println("Entrando a servlet");
        String empresaVarGlobal="Continental";
        try (PrintWriter out = response.getWriter()) {
            empresaVarGlobal = request.getParameter("empresaVarGlobal");
        }catch (Exception e){
            
        }
        String nombreArchivo="ListaDePrecios" + empresaVarGlobal + ".jsp";
        String sourceFile = "PlantillaBSCI.jsp";
        String hoja = "INTEGRACION";
        int anioReporte=0;
        int mesReporte=0;
        try{
            anioReporte= Integer.parseInt(request.getParameter("anioReporte"));
        }catch(Exception e){
            
        }
        try{
            mesReporte= Integer.parseInt(request.getParameter("mesReporte"));
        } catch(Exception e){
            
        }
        utilMath objMath=new utilMath();
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
