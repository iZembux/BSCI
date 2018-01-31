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
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

/**
 *
 * @author ricar_000
 */
@WebServlet(name = "readExcel", urlPatterns = {"/readExcel"})
public class readExcel extends HttpServlet {

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
        String nombreArchivo = "Lista_de_precios.xls";
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
        try {
            
            WritableWorkbook workbookNvo = Workbook.createWorkbook(response.getOutputStream());
            //Se crea una nueva hoja dentro del libro
            WritableSheet sheetNvo = workbookNvo.createSheet("ListaDePrecios", 0);
            Workbook workbook = Workbook.getWorkbook(new File("PlantillaListaPrecios.xls")); //Pasamos el excel que vamos a leer
            Sheet sheet = workbook.getSheet(0); //Seleccionamos la hoja que vamos a leer
            String nombre;

            for (int fila = 1; fila < sheet.getRows(); fila++) {                    //recorremos las filas
                for (int columna = 0; columna < sheet.getColumns(); columna++) {    //recorremos las columnas
                    nombre = sheet.getCell(columna, fila).getContents();            //setear la celda leida a nombre
                    System.out.print(nombre + "");                                  // imprimir nombre
                }
                System.out.println("\n");
                System.out.println("————————————");
            }
        
            //Escribimos los resultados al fichero Excel
            workbookNvo.write();
            workbookNvo.close();
            System.out.println("Archivo Excel Creado Exitosamente!!");
            //for (int e = 0; e < 10000; e++) {
            //}
            //leerExcel();
            System.out.println("Archivo Creado.");
        } catch (IOException ex) {
            System.out.println("Error al crear el fichero.");
        } catch (WriteException ex) {
            System.out.println("Error al escribir el fichero.");
        } catch (BiffException ex) {
            Logger.getLogger(readExcel.class.getName()).log(Level.SEVERE, null, ex);
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
