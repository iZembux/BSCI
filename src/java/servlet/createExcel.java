/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.Workbook;
import jxl.format.Colour;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

/**
 *
 * @author ricar_000
 */
@WebServlet(name = "createExcel", urlPatterns = {"/createExcel"})
public class createExcel extends HttpServlet {

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
        String nombreArchivo = "ListaDePrecios.xls";
        //response.setContentType("application/vnd.ms-excel");
        //response.setHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
        String sourceFile = "C:\\Jaspersoft\\jasperreports-server-cp-5.5.0a\\apache-tomcat\\bin\\Plantilla.xls";
        String newFile = "C:\\Desarrollo\\maya\\PlantillaNvo.xls";
        String hoja = "INTEGRACION";
        int row = 0;
        int column = 0;
        double valor = 3.1416;
        try {
            Workbook target_workbook = Workbook.getWorkbook(new File(sourceFile));
            WritableWorkbook workbook = Workbook.createWorkbook(new File(newFile), target_workbook);
            
            
            WritableFont headersFont = new WritableFont(WritableFont.ARIAL, 12, WritableFont.BOLD);
            jxl.write.WritableCellFormat headerFormat = new jxl.write.WritableCellFormat(headersFont);
            try {
                headerFormat.setBackground(Colour.ICE_BLUE);
            } catch (WriteException ex) {
                Logger.getLogger(createExcel.class.getName()).log(Level.SEVERE, null, ex);
            }
            target_workbook.close();
            WritableSheet sheet = workbook.getSheet(hoja);
            System.out.println("COLUMNA: " + column);
            System.out.println("FILA: " + row);
            jxl.write.Number number = new jxl.write.Number(column, row, valor);
            sheet.addCell(number);
            sheet.addCell(new jxl.write.Label(1, 1, "Modelo 1"));
            sheet.addCell(new jxl.write.Label(2, 2, "Modelo 2"));
            sheet.addCell(new jxl.write.Label(3, 3, "Modelo 3"));
            sheet.addCell(new jxl.write.Label(4, 3, "Modelo 4"));
            sheet.addCell(new jxl.write.Label(2, 5, "Modelo 5", headerFormat));
            sheet.addCell(new jxl.write.Label(2, 6, "Modelo 6"));
            sheet.addCell(new jxl.write.Label(2, 7, "Modelo 7"));
            sheet.addCell(new jxl.write.Label(2, 20, "Modelo 8"));
            sheet.addCell(new jxl.write.Label(2, 21, "Modelo 9"));
            sheet.addCell(new jxl.write.Label(2, 22, "Modelo 10"));
            workbook.write();
            workbook.close();
        } catch (Exception e) {
            System.out.println("writeExcel ->" + e);
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
