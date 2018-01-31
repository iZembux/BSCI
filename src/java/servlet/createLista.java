/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.Pattern;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import modelo.departamentos;
import modelo.procesosFecha;
import modelo.utilMath;
import modelo.generarReporte;
import modelo.balance;

/**
 *
 * @author ricar_000
 */
@WebServlet(name = "createLista", urlPatterns = {"/createLista"})
public class createLista extends HttpServlet {

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
        System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        System.out.println("Entrando a servlet=======================================");
        String empresaVarGlobal = "Continental";
        try {
            empresaVarGlobal = request.getParameter("empresaVarGlobal");
        } catch (Exception e) {
        }

        String nombreArchivo = "ListaDePrecios" + empresaVarGlobal + ".xls";

        String sourceFile = "PlantillaBSCI.xls";
        //String newFile = "C:\\Desarrollo\\maya\\" + nombreArchivo;
        String hoja = "INTEGRACION";
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

        utilMath objMath = new utilMath();

        jxl.write.NumberFormat fivedps = new jxl.write.NumberFormat("#,##0.0");
        jxl.write.WritableCellFormat fivedpsFormat = new jxl.write.WritableCellFormat(fivedps);
        //Number number4 = new Number(2, 4, 3.141519, fivedpsFormat); 
        //sheet.addCell(number4);
        try {
            fivedpsFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        WritableFont wfc = new WritableFont(WritableFont.ARIAL, 20, WritableFont.BOLD, true, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.GREEN);
        WritableFont wfcBlack = new WritableFont(WritableFont.ARIAL, 20, WritableFont.BOLD, true, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat wcfFCTitulo = new jxl.write.WritableCellFormat(wfc);
        jxl.write.WritableCellFormat wcfFCTituloBlack = new jxl.write.WritableCellFormat(wfcBlack);
        try {
            wcfFCTitulo.setBackground(jxl.format.Colour.RED);                                 //Preferencias de color rojo en la celda 
            wcfFCTituloBlack.setBackground(jxl.format.Colour.BLACK);                          //Preferencias de color rojo en la celda 
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        WritableFont font = new WritableFont(WritableFont.createFont("Calibri"), 11);
        jxl.write.WritableCellFormat format = new jxl.write.WritableCellFormat(font);
        jxl.format.Colour GrayTitulos = new jxl.format.Colour(10000, "1", 68, 84, 106) {
        };
        try {
            format.setBackground(jxl.format.Colour.GREY_50_PERCENT, jxl.format.Pattern.SOLID);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        WritableFont headersFont = new WritableFont(WritableFont.createFont("Calibri"), 11, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat headerFormat = new jxl.write.WritableCellFormat(headersFont);
        jxl.write.WritableCellFormat headerFormat2 = new jxl.write.WritableCellFormat(headersFont);
        jxl.format.Colour BlackTitulos = new jxl.format.Colour(0000, "negro", 0, 0, 0) {
        };
        //bien jxl.format.Colour BlackTitulos = new jxl.format.Colour(10000, "1", 0, 0, 0) {};

        try {
            headerFormat.setBackground(jxl.format.Colour.BLACK, jxl.format.Pattern.SOLID);
            headerFormat2.setBackground(BlackTitulos, jxl.format.Pattern.SOLID);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 1 CABECERA GENERAL
        WritableFont cabeceraGeneralFont = new WritableFont(WritableFont.ARIAL, 14, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat cabeceraGeneral = new jxl.write.WritableCellFormat(cabeceraGeneralFont);

        try {
            cabeceraGeneral.setBackground(BlackTitulos, jxl.format.Pattern.SOLID);
            cabeceraGeneral.setBorder(Border.ALL, BorderLineStyle.THIN);
            cabeceraGeneral.setAlignment(Alignment.CENTRE);
            cabeceraGeneral.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO COLOR VERDE PARA PUNTUACION OBTENIDA VERDE
        WritableFont colorobtenidoFont = new WritableFont(WritableFont.createFont("Calibri"), 9, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat colorobtenido = new jxl.write.WritableCellFormat(colorobtenidoFont);

        try {
            colorobtenido.setBackground(Colour.GREEN, jxl.format.Pattern.SOLID);
            colorobtenido.setBorder(Border.ALL, BorderLineStyle.THIN);
            colorobtenido.setAlignment(Alignment.CENTRE);
            colorobtenido.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }
        //------------------------- FORTMATO COLOR VERDE PARA PUNTUACION OBTENIDA AMARILLO
        WritableFont colorobtenidoamarilloFont = new WritableFont(WritableFont.createFont("Calibri"), 9, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        jxl.write.WritableCellFormat colorobtenidoamarillo = new jxl.write.WritableCellFormat(colorobtenidoamarilloFont);

        try {
            colorobtenidoamarillo.setBackground(Colour.YELLOW, jxl.format.Pattern.SOLID);
            colorobtenidoamarillo.setBorder(Border.ALL, BorderLineStyle.THIN);
            colorobtenidoamarillo.setAlignment(Alignment.CENTRE);
            colorobtenidoamarillo.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }
        //------------------------- FORTMATO COLOR VERDE PARA PUNTUACION OBTENIDA ROJO
        WritableFont colorobtenidorojoFont = new WritableFont(WritableFont.createFont("Calibri"), 9, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat colorobtenidorojo = new jxl.write.WritableCellFormat(colorobtenidoFont);

        try {
            colorobtenidorojo.setBackground(Colour.RED, jxl.format.Pattern.SOLID);
            colorobtenidorojo.setBorder(Border.ALL, BorderLineStyle.THIN);
            colorobtenidorojo.setAlignment(Alignment.CENTRE);
            colorobtenidorojo.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //------------------------- FORTMATO 2 CABECERA RESUMEN
        WritableFont cabeceraResumenFont = new WritableFont(WritableFont.createFont("Calibri"), 9, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat cabeceraResumen = new jxl.write.WritableCellFormat(cabeceraResumenFont);

        try {
            cabeceraResumen.setBackground(Colour.OLIVE_GREEN, jxl.format.Pattern.SOLID);
            cabeceraResumen.setBorder(Border.ALL, BorderLineStyle.THIN);
            cabeceraResumen.setAlignment(Alignment.CENTRE);
            cabeceraResumen.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 3 CABECERA RESUMEN
        WritableFont cabeceraFilaResumenFont = new WritableFont(WritableFont.createFont("Calibri"), 6, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat cabeceraFilaResumen = new jxl.write.WritableCellFormat(cabeceraFilaResumenFont);

        try {
            cabeceraFilaResumen.setBackground(Colour.OLIVE_GREEN, jxl.format.Pattern.SOLID);
            cabeceraFilaResumen.setBorder(Border.ALL, BorderLineStyle.THIN);
            cabeceraFilaResumen.setAlignment(Alignment.CENTRE);
            cabeceraFilaResumen.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 4 CABECERA DEPTO
        WritableFont cabeceraDeptoFont = new WritableFont(WritableFont.createFont("Calibri"), 11, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        jxl.write.WritableCellFormat cabeceraDepto = new jxl.write.WritableCellFormat(cabeceraDeptoFont);

        try {
            cabeceraDepto.setBackground(Colour.GRAY_25, jxl.format.Pattern.SOLID);
            cabeceraDepto.setBorder(Border.ALL, BorderLineStyle.THIN);
            cabeceraDepto.setAlignment(Alignment.CENTRE);
            cabeceraDepto.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 5 ENCABEZADOS DEPTO
        WritableFont encabezadosDeptoFont = new WritableFont(WritableFont.createFont("Calibri"), 8, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat encabezadosDepto = new jxl.write.WritableCellFormat(encabezadosDeptoFont);

        try {
            encabezadosDepto.setBackground(BlackTitulos, jxl.format.Pattern.SOLID);
            encabezadosDepto.setBorder(Border.ALL, BorderLineStyle.THIN);
            encabezadosDepto.setAlignment(Alignment.CENTRE);
            encabezadosDepto.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 6 CABECERA FILA RESUMEN
        WritableFont cabeceraFilaDeptoFont = new WritableFont(WritableFont.createFont("Calibri"), 8, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        jxl.write.WritableCellFormat cabeceraFilaDepto = new jxl.write.WritableCellFormat(cabeceraFilaDeptoFont);

        try {
            cabeceraFilaDepto.setBorder(Border.ALL, BorderLineStyle.THIN);
            cabeceraFilaDepto.setAlignment(Alignment.CENTRE);
            cabeceraFilaDepto.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }
//        
//         //------------------------- FORTMATO 88 COLOR VERDE PARA PUNTUACION OBTENIDA
//        WritableFont cabeceraFilaDeptoFont = new WritableFont(WritableFont.ARIAL, 8, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
//        jxl.write.WritableCellFormat cabeceraFilaDepto = new jxl.write.WritableCellFormat(cabeceraFilaDeptoFont);
//
//        try {
//            cabeceraFilaDepto.setBorder(Border.ALL, BorderLineStyle.THIN);
//            cabeceraFilaDepto.setAlignment(Alignment.CENTRE);
//            cabeceraFilaDepto.setVerticalAlignment(VerticalAlignment.CENTRE);
//        } catch (WriteException ex) {
//            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
//        }
//

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 7 INDICADOR
        WritableFont indicadorFont = new WritableFont(WritableFont.createFont("Calibri"), 11, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        jxl.write.WritableCellFormat indicador = new jxl.write.WritableCellFormat(indicadorFont);

        try {
            indicador.setBorder(Border.ALL, BorderLineStyle.THIN);
            indicador.setAlignment(Alignment.LEFT);
            indicador.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 8 CUERPO DEPTO
        WritableFont cuerpoDeptoFont = new WritableFont(WritableFont.createFont("Calibri"), 9, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        //jxl.write.WritableCellFormat cuerpoDepto = new jxl.write.WritableCellFormat(cuerpoDeptoFont);
        jxl.write.WritableCellFormat cuerpoDepto = new jxl.write.WritableCellFormat(fivedps);

        try {
            cuerpoDepto.setBorder(Border.ALL, BorderLineStyle.THIN);
            cuerpoDepto.setAlignment(Alignment.CENTRE);
            cuerpoDepto.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 9 TOTALES DEPTO
        WritableFont totalesDeptoFont = new WritableFont(WritableFont.createFont("Calibri"), 11, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        jxl.write.WritableCellFormat totalesDepto = new jxl.write.WritableCellFormat(totalesDeptoFont);

        try {
            totalesDepto.setBackground(Colour.VERY_LIGHT_YELLOW, jxl.format.Pattern.SOLID);
            totalesDepto.setBorder(Border.ALL, BorderLineStyle.THIN);
            totalesDepto.setAlignment(Alignment.CENTRE);
            totalesDepto.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }
 //------------------------- FORTMATO 9 TOTALES 
        WritableFont totalesFont = new WritableFont(WritableFont.createFont("Calibri"), 11, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        jxl.write.WritableCellFormat totales = new jxl.write.WritableCellFormat(totalesFont);

        try {           
            totales.setBorder(Border.ALL, BorderLineStyle.THIN);
            totales.setAlignment(Alignment.CENTRE);
            totales.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 10 PIE
        WritableFont pieFont = new WritableFont(WritableFont.createFont("Calibri"), 6, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.WHITE);
        jxl.write.WritableCellFormat pie = new jxl.write.WritableCellFormat(pieFont);

        try {
            pie.setBackground(Colour.TURQUOISE, jxl.format.Pattern.SOLID);
            pie.setBorder(Border.ALL, BorderLineStyle.THIN);
            pie.setAlignment(Alignment.CENTRE);
            pie.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }

        //---------------------------------------------------------------------------------------------------------------------------
        //------------------------- FORTMATO 11 CUERPO RESUMEN
        WritableFont cuerpoResumenFont = new WritableFont(WritableFont.createFont("Calibri"), 10, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
        jxl.write.WritableCellFormat cuerpoResumen = new jxl.write.WritableCellFormat(cuerpoResumenFont);

        try {
            cuerpoResumen.setBorder(Border.ALL, BorderLineStyle.THIN);
            cuerpoResumen.setAlignment(Alignment.CENTRE);
            cuerpoResumen.setVerticalAlignment(VerticalAlignment.CENTRE);
        } catch (WriteException ex) {
            Logger.getLogger(createLista.class.getName()).log(Level.SEVERE, null, ex);
        }
        //---------------------------------------------------------------------------------------------------------------------------

        procesosFecha objFecha = new procesosFecha();
        generarReporte generarReporte = new generarReporte();
        ArrayList<balance> arrayBalance = new ArrayList<balance>();

        mesReporte = 1;
        String unidadNegocio = "Continental";
        String mesCuatrimestre = "1er";
        anioReporte = 2015;
        String mesEspanol = "Enero";
        try {
            
            unidadNegocio = request.getParameter("unidadNegocio");
            System.out.println("=========================================================");
            System.out.println("-----------Unidad negocio :"+unidadNegocio+"--------------");
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
        mesEspanol = objFecha.obtenerMesEspanol(mesReporte);
        departamentos vista = new departamentos();
        ArrayList<departamentos> arrayDepartamentos = new ArrayList<departamentos>();
        arrayDepartamentos = vista.consultarDepartamentos();

        nombreArchivo = "BSCI_" + unidadNegocio + "_" + mesEspanol + "_" + anioReporte + ".xls";
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
        //PrintWriter out = response.getWriter();
        try {
            //Lee archivo fuente
            //Workbook target_workbook = Workbook.getWorkbook(new File("PlantillaBSCI.xls"));
            //Se crea el libro Excel
            //WritableWorkbook workbook = Workbook.createWorkbook(new File(nombreArchivo));
            //Workbook target_workbook = Workbook.getWorkbook(new File(sourceFile));
            //WritableWorkbook workbook = Workbook.createWorkbook(new File(nombreArchivo), target_workbook);
            //target_workbook.close();
            WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream());
            //target_workbook.close();
            //Se obtiene el nombre de la hoja donde se escribira la nueva informacion
            //WritableSheet sheet = workbook.getSheet("BSCI");
            //Se crea una nueva hoja dentro del libro
            WritableSheet sheet = workbook.createSheet("BSCI", 0);
            //Creamos celdas de varios tipos
            sheet.mergeCells(0, 0, 10, 0);
            sheet.mergeCells(0, 1, 10, 1);
            sheet.setColumnView(0, 14);//ini:seteamos el ancho de las columnas 
            sheet.setColumnView(1, 55);
            sheet.setColumnView(2, 15);
            sheet.setColumnView(3, 15);
            sheet.setColumnView(4, 15);
            sheet.setColumnView(5, 15);
            sheet.setColumnView(6, 15);
            sheet.setColumnView(7, 15);
            sheet.setColumnView(8, 15);
            sheet.setColumnView(9, 10);
            sheet.setColumnView(10, 10);

            int columna = 0;
            int cantidadModelos = 8;
            int cantidadIndicadores = 0;
            String[][] puntosResumen = new String[arrayDepartamentos.size()][9];  /// colocar nombre de sucursal a los balance 
            String razonSocial = "CONTINENTAL AUTOMOTRIZ S.A. DE C.V.";
            if (unidadNegocio.equals("Mitsuautos")) {
                razonSocial = "MITSUBISHI CONTINENTAL";
            }
            if (unidadNegocio.equals("Automodena")) {
                razonSocial = "FIAT CONTINENTAL";
            }
            if (unidadNegocio.equals("Autopolanco")) {
                razonSocial = "SAN RAFAEL";
            }
            if (unidadNegocio.equals("KoreanMotors")) {
                razonSocial = "HYUNDAI METEPEC";
            }
            if (unidadNegocio.equals("AutopolancoFiat")) {
                razonSocial = "AUTOPOLANCO FIAT";
            }
            if (unidadNegocio.equals("AutopolancoChrysler")) {
                razonSocial = "AUTOPOLANCO CHRYSLER";
            }
            if (unidadNegocio.equals("Lerma")) {
                razonSocial = "LERMA";
            }
            if (unidadNegocio.equals("Tenancingo")) {
                razonSocial = "TENANCINGO";
            }
            if (unidadNegocio.equals("Atlacomulco")) {
                razonSocial = "ATLACOMULCO";
            }         
            if (unidadNegocio.equals("Nihon")) {
                razonSocial = "TOYOTA SANTA FE";
            }
             if (unidadNegocio.equals("HyundaiPatriotismo")) {
                razonSocial = "HYUNDAI PATRIOTISMO";
            }
             if (unidadNegocio.equals("PuertaSantaFe")) {
                razonSocial = "PUERTA SANTA FE";
            }
              if (unidadNegocio.equals("Alfa-mitsu")) {
                razonSocial = "ALFA ROMEO - MITSUBISHI";
            }
               if (unidadNegocio.equals("Mitsubishi")) {
                razonSocial = "MITSUBISHI";
            }
               
            //----------------------------------------------------------------------------------------------------------------------------
            sheet.addCell(new jxl.write.Label(0, 0, razonSocial, cabeceraGeneral));
            sheet.addCell(new jxl.write.Label(0, 1, "INDICADORES DE GESTION AL CIERRE DEL MES DE " + mesEspanol.toUpperCase() + " DE " + anioReporte, cabeceraGeneral));
            
            if (arrayDepartamentos.size() > 0) {
                for (int tabla = 0; tabla < arrayDepartamentos.size(); tabla++) {
                    columna = 0;
                    arrayBalance = generarReporte.genenrarBalanceXDepartamento(mesReporte, anioReporte, arrayDepartamentos.get(tabla).getBal_identificaDepartamento(), 
                            unidadNegocio);
                    puntosResumen[tabla][0] = arrayDepartamentos.get(tabla).getBal_departamento();
                    //----------------------------------------------------------------------------------------------------------------------------
                    sheet.mergeCells(0, cantidadModelos, 10, cantidadModelos);
                    //System.out.println("MERGE: 0," + cantidadModelos + ", 10, " + cantidadModelos);
                    sheet.addCell(new jxl.write.Label(0, (cantidadModelos), arrayDepartamentos.get(tabla).getBal_departamento(), cabeceraDepto));
                    cantidadModelos++;
                    //sheet.setRowView(cantidadModelos, 6);
                    sheet.addCell(new jxl.write.Label(0, (cantidadModelos), "Area", encabezadosDepto));
                    //sheet.addCell(new jxl.write.Label(columna++, cantidadModelos, "TOTALES", fivedpsFormat));       
                    sheet.addCell(new jxl.write.Label(1, (cantidadModelos), "INDICADOR", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(2, (cantidadModelos), "Objetivo Global Anual", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(3, (cantidadModelos), "Objetivo del " + mesCuatrimestre + " mes del cuatrimestre", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(4, (cantidadModelos), "Incurrido del " + mesCuatrimestre + " mes del cuatrimestre", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(5, (cantidadModelos), "% de Cumplimiento del " + mesCuatrimestre + " mes del cuatrimestre", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(6, (cantidadModelos), "Objetivo Acumulado del cuatrimestre", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(7, (cantidadModelos), "Incurrido Acumulado del cuatrimestre", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(8, (cantidadModelos), "% de Cumplimiento acumulado del cuatrimestre", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(9, (cantidadModelos), "Puntuacion Obtenida", encabezadosDepto));
                    sheet.addCell(new jxl.write.Label(10, (cantidadModelos), "Puntuacion Optima Propuesta " + anioReporte, encabezadosDepto));
        

                    //---------------------------------------------------------------------------------
                    double totalesObtenidos = 0;
                    double totalesOptimos = 0;
                    double totalPorcentaje = 0.0;
                    int puntuacionMaxima = 0;
                    int resultadoObtenido = 0;
                    cantidadModelos++;
                    for (int i = 0; i < arrayBalance.size(); i++) {
                        String bal_area = arrayBalance.get(i).getBal_Area();
                        String bal_indicador = arrayBalance.get(i).getBal_Indicador();
                        double bal_objAnual = arrayBalance.get(i).getBal_ObjAnual();
                        //out.print("<td>" + objMath.redondear(Inspeccion2, 2) + "</td>");
                        double objetivoCuatrimestre = arrayBalance.get(i).getBal_ObjCuatrimestre();
                        double incurridoCuatrimestre = arrayBalance.get(i).getBal_IncCuatrimestre();
                        double cumplientoCuatrimestre = arrayBalance.get(i).getBal_CumCuatrimestre();
                        double objetivoAcumulado = arrayBalance.get(i).getBal_ObjAcumulado();
                        double incurridoAcumulado = arrayBalance.get(i).getBal_IncAcumulado();
                        double cumplimientoAcumulado = arrayBalance.get(i).getBal_CumAcumulado();
                        double puntosObtenidos = arrayBalance.get(i).getBal_PuntosObtenidos();
                        double puntosOptimos = arrayBalance.get(i).getBal_PuntosOptimos();
                        String medida = arrayBalance.get(i).getBal_Medida();
                        columna = 1;
                        //color = obtenerColor($cumplimiento_acumulado);
                        totalesObtenidos += puntosObtenidos;
                        totalesOptimos += puntosOptimos;

                        resultadoObtenido += resultadoObtenido;
                        puntuacionMaxima += puntuacionMaxima;

                        sheet.addCell(new jxl.write.Label(0, (cantidadModelos), bal_area, cabeceraFilaDepto));
                        sheet.addCell(new jxl.write.Label(1, (cantidadModelos), bal_indicador, indicador));
                        //------------------------------------------------------------------------------------
                        if (medida.equals("%")) {
                            sheet.addCell(new jxl.write.Label(2, (cantidadModelos), objMath.formatoMiles(""+ (int) (bal_objAnual * 100)) + medida, totales));
                            sheet.addCell(new jxl.write.Label(3, (cantidadModelos), objMath.formatoMiles(""+ (int) (objetivoCuatrimestre * 100)) + medida, totales));
                            sheet.addCell(new jxl.write.Label(4, (cantidadModelos), objMath.formatoMiles(""+ (int) (incurridoCuatrimestre * 100)) + medida, totales));
                            sheet.addCell(new jxl.write.Label(5, (cantidadModelos), (int) objMath.redondear(cumplientoCuatrimestre,2) + "%", totales));
                            sheet.addCell(new jxl.write.Label(6, (cantidadModelos), objMath.formatoMiles(""+ (int) (objetivoAcumulado * 100)) + medida, totales));
                            sheet.addCell(new jxl.write.Label(7, (cantidadModelos), objMath.formatoMiles(""+ (int) (incurridoAcumulado * 100)) + medida, totales));
                            sheet.addCell(new jxl.write.Label(8, (cantidadModelos), (int) objMath.redondear(cumplimientoAcumulado,2) + "%", totales));
                        }
                        if (medida.equals("$")) {
                            sheet.addCell(new jxl.write.Label(2, (cantidadModelos), medida + " " + objMath.formatoMiles(""+ (int) bal_objAnual), totales));
                            sheet.addCell(new jxl.write.Label(3, (cantidadModelos), medida + " " + objMath.formatoMiles(""+ (int)objetivoCuatrimestre), totales));
                            sheet.addCell(new jxl.write.Label(4, (cantidadModelos), medida + " " + objMath.formatoMiles(""+ (int) objMath.redondear(incurridoCuatrimestre, 2)), totales));
                            sheet.addCell(new jxl.write.Label(5, (cantidadModelos), (int) objMath.redondear(cumplientoCuatrimestre,2) + "%", totales));
                            sheet.addCell(new jxl.write.Label(6, (cantidadModelos), medida + " " + objMath.formatoMiles(""+ (int) objMath.redondear(objetivoAcumulado, 2)), totales));
                            sheet.addCell(new jxl.write.Label(7, (cantidadModelos), medida + " " + objMath.formatoMiles(""+ (int) objMath.redondear(incurridoAcumulado, 2)), totales));
                            sheet.addCell(new jxl.write.Label(8, (cantidadModelos), (int) objMath.redondear(cumplimientoAcumulado,2) + "%", totales));
                            
                            System.out.println("variable incurrido" + incurridoCuatrimestre);
                        }
                        if (medida.equals("")) {
                            if(bal_indicador.equalsIgnoreCase("Productividad del taller")){
                                sheet.addCell(new jxl.write.Label(2, (cantidadModelos), objMath.redondear(bal_objAnual, 2) + "", totales));
                                sheet.addCell(new jxl.write.Label(3, (cantidadModelos), objMath.redondear(objetivoCuatrimestre, 2) + "", totales));
                                sheet.addCell(new jxl.write.Label(4, (cantidadModelos), objMath.redondear(incurridoCuatrimestre, 2) + "", totales));
                                sheet.addCell(new jxl.write.Label(5, (cantidadModelos), (int) cumplientoCuatrimestre + "%", totales));
                                sheet.addCell(new jxl.write.Label(6, (cantidadModelos), objMath.redondear(objetivoAcumulado, 2) + "", totales));
                                sheet.addCell(new jxl.write.Label(7, (cantidadModelos), objMath.redondear(incurridoAcumulado, 2) + "", totales));
                                sheet.addCell(new jxl.write.Label(8, (cantidadModelos), (int) cumplimientoAcumulado + "%", totales));
                            }else{
                                sheet.addCell(new jxl.write.Label(2, (cantidadModelos), objMath.formatoMiles(""+ (int) objMath.redondear(bal_objAnual, 2)) + "", totales));
                                sheet.addCell(new jxl.write.Label(3, (cantidadModelos), objMath.formatoMiles(""+ (int) objMath.redondear(objetivoCuatrimestre, 2)) + "", totales));
                                sheet.addCell(new jxl.write.Label(4, (cantidadModelos), objMath.formatoMiles(""+ (int) objMath.redondear(incurridoCuatrimestre, 2)) + "", totales));
                                sheet.addCell(new jxl.write.Label(5, (cantidadModelos), (int) cumplientoCuatrimestre + "%", totales));
                                sheet.addCell(new jxl.write.Label(6, (cantidadModelos), objMath.formatoMiles(""+ (int) objMath.redondear(objetivoAcumulado, 2)) + "", totales));
                                sheet.addCell(new jxl.write.Label(7, (cantidadModelos), objMath.formatoMiles(""+ (int) objMath.redondear(incurridoAcumulado, 2)) + "", totales));
                                sheet.addCell(new jxl.write.Label(8, (cantidadModelos), (int) cumplimientoAcumulado + "%", totales));
                            }
                        }
                        //------------------------------------------------------------------------------------
                        /*String numero1 = puntosObtenidos + " ";
                        String numero2 = puntosOptimos + " ";
                        puntosObtenidos = Integer.parseInt(numero1);
                        puntosOptimos = Integer.parseInt(numero2);*/

                        double porcentajeObtenido = 0.0;

                        porcentajeObtenido = (double) puntosObtenidos / (double) puntosOptimos;
                        System.out.println("INDICADOR: " + indicador + " PO:" + puntosObtenidos + " PM:" + puntosOptimos + " PORC:" + porcentajeObtenido);
                        if (puntosOptimos > 0) {
                            porcentajeObtenido = puntosObtenidos / puntosOptimos;
                        }
                        sheet.addCell(new jxl.write.Number(9, (cantidadModelos), (int) (puntosObtenidos), totales));//INSERTA PUNTUACION OBTENIDA

                        if (cumplimientoAcumulado >= 100.0) {
                            sheet.addCell(new jxl.write.Number(9, (cantidadModelos), puntosObtenidos, colorobtenido));// COLOR verde puntuacion obtenida
                        }
                        if (cumplimientoAcumulado < 100.0 && cumplimientoAcumulado >= 85.0) {
                            sheet.addCell(new jxl.write.Number(9, (cantidadModelos), puntosObtenidos, colorobtenidoamarillo));//COLOR AMARILLO puntuacion obtenida
                        }
                        if (cumplimientoAcumulado < 85.0) {
                            sheet.addCell(new jxl.write.Number(9, (cantidadModelos), puntosObtenidos, colorobtenidorojo));///COLOR rojo puntuacion obtenida
                        }

                        sheet.addCell(new jxl.write.Label(10, (cantidadModelos), (int) objMath.redondear(puntosOptimos, 2) + "", totales));// INSERTA PUNTUACIO OPTIMA PROPUESTA
                        //-----------------------------------------------------------------------------------------  
                        cantidadModelos++;
                    }
                    //columna=-3;

                    //Totales por departamento (FORMATO 9 el amarillo)
                    sheet.addCell(new jxl.write.Label(8, (cantidadModelos), "TOTALES", totales));
                    sheet.addCell(new jxl.write.Label(9, (cantidadModelos), "" + (int) totalesObtenidos, totales));
                    sheet.addCell(new jxl.write.Label(10, (cantidadModelos), "" + (int) totalesOptimos, totales));
                    totalPorcentaje = ((totalesObtenidos / totalesOptimos) * 100);
                    //System.out.println("TotalPorcentaje para resumen: " + "(" + totalesObtenidos + " / " + totalesOptimos + ")" + "*" + 100);
                    double porcentaje = 0.0;

                    porcentaje = ((totalesObtenidos / totalesOptimos) * 100);
                    System.out.println("PORCENTAJE: " + porcentaje);
                    puntosResumen[tabla][1] = "" + totalesObtenidos;
                    puntosResumen[tabla][2] = "" + totalesOptimos;
                    puntosResumen[tabla][3] = "" + (int) porcentaje;
                    cantidadModelos++;
                    cantidadModelos++;

                    //---------------------------------------------------------------------------------------
                }
            }

//////////////////////////////////--------TOTALES PUNTUACION
            sheet.addCell(
                    new jxl.write.Label(10, 3, "TOTALES", cabeceraResumen));
            sheet.addCell(
                    new jxl.write.Label(0, 3, "AREAS", cabeceraFilaResumen));
            sheet.addCell(
                    new jxl.write.Label(0, 4, "PUNTUACION MAXIMA", cabeceraFilaResumen));
            sheet.addCell(
                    new jxl.write.Label(0, 5, "RESULTADO OBTENIDO", cabeceraFilaResumen));
            sheet.addCell(
                    new jxl.write.Label(0, 6, "PORCENTAJE DE EXITO", cabeceraFilaResumen));

            int celda = 1;
            for (int y = 0; y < puntosResumen.length; y++) {
                sheet.addCell(new jxl.write.Label(celda++, 3, puntosResumen[y][0], cabeceraResumen));//departamentos
            }
            //---------------------------------------------------------------------------------------------------------------------
            // double puntuacionMaxima = 0.0;   //quitar.0
            int puntuacionMaxima = 0;
            int totalesontenido1 = 0;

            celda = 1;

            for (int y = 0; y < puntosResumen.length; y++) {
                puntuacionMaxima = (int) Double.parseDouble(puntosResumen[y][2]);
                puntosResumen[y][2] = puntuacionMaxima + "";
                sheet.addCell(new jxl.write.Label(celda++, 4, puntosResumen[y][2], cuerpoResumen));//resultado obtenido
                totalesontenido1 += Integer.parseInt(puntosResumen[y][2]);
            }

            // double resultadoObtenido = 0.0; //quitar .0
            int resultadoObtenido = 0;
            int totalesobtenido = 0;
            celda = 1;
            for (int y = 0; y < puntosResumen.length; y++) {
                resultadoObtenido = (int) Double.parseDouble(puntosResumen[y][1]);
                puntosResumen[y][1] = resultadoObtenido + "";
                sheet.addCell(new jxl.write.Label(celda++, 5, puntosResumen[y][1], cuerpoResumen)); //puntuacion maxima

                //resultadoObtenido=(Integer.parseInt(puntosResumen[y][1])/1);
                //puntosResumen[y][1]=resultadoObtenido+"";
                totalesobtenido += Integer.parseInt(puntosResumen[y][1]);

                //sheet.addCell(new jxl.write.Label(8, (cantidadModelos), (int) objMath.redondear(cumplimientoAcumulado, 0) + "%", cuerpoDepto));
                //---------------------------------------------------------------------------------------------------------------------
            }
            celda = 1;
            for (int y = 0; y < puntosResumen.length; y++) {
                //sheet.addCell(new jxl.write.Label(celda++, 6, puntosResumen[y][3] + " %", cuerpoResumen)); //Porcentaje Obtenido
                if (Double.parseDouble(puntosResumen[y][3]) >= 100.0) {
                    sheet.addCell(new jxl.write.Label(celda++, 6, puntosResumen[y][3] + " %", colorobtenido)); //Porcentaje Obtenido
                }
                if (Double.parseDouble(puntosResumen[y][3]) >= 85.0 && Integer.parseInt(puntosResumen[y][3]) <= 99.9) {
                    sheet.addCell(new jxl.write.Label(celda++, 6, puntosResumen[y][3] + " %", colorobtenidoamarillo)); //Porcentaje Obtenido
                    ///COLORES
                }
                if (Double.parseDouble(puntosResumen[y][3]) < 85.0) {
                    sheet.addCell(new jxl.write.Label(celda++, 6, puntosResumen[y][3] + " %", colorobtenidorojo)); //Porcentaje Obtenido
                }
                //resultadoObtenido += Integer.parseInt(puntosResumen[y][3]);
                //System.out.println("imprimiendo" + resultadoObtenido);
            }

            double porcentajeTotal = (totalesobtenido * 100.0) / totalesontenido1;
            System.out.println("}************************************************************");
            System.out.println("Porcentaje > " + porcentajeTotal);
            System.out.println("}************************************************************");
            //float porcentajeTotal =(totalesobtenido /totalesontenido1 );
            //System.out.println("Porcentaje total >" +porcentajeTotal);

            //porcentajeTotal=(float) ((double)porcentajeTotal*100);
            //System.out.println("Resultadio > "+porcentajeTotal);
            System.out.println("(" + totalesobtenido + "/" + totalesontenido1 + ") * 100" + porcentajeTotal);
            sheet.addCell(new jxl.write.Number(10, (4), (int) totalesontenido1, cuerpoResumen));//totales
            sheet.addCell(new jxl.write.Number(10, (5), (int) totalesobtenido, cuerpoResumen));//totales

            if (porcentajeTotal >= 100) {
                sheet.addCell(new jxl.write.Label(10, (6), (int) objMath.redondear(porcentajeTotal, 2) + "%", colorobtenido));///COLORES
                System.out.println("Porcentaje Total: " + porcentajeTotal);

            } else if (porcentajeTotal >= 85 && porcentajeTotal <= 99.9) {
                sheet.addCell(new jxl.write.Label(10, (6), (int) objMath.redondear(porcentajeTotal, 2) + "%", colorobtenidoamarillo));
                ///COLORES
            } else {
                sheet.addCell(new jxl.write.Label(10, (6), (int) objMath.redondear(porcentajeTotal, 2) + "%", colorobtenidorojo));
            }

            //sheet.addCell(new jxl.write.Number(10, (6), (int) porcentajeTotal, cuerpoResumen));//totales
            //  111 sheet.addCell(new jxl.write.Label(10, (6), (int) objMath.redondear(porcentajeTotal,0) + "%", cuerpoResumen));
            //111 System.out.println("Porcentaje Total: " + porcentajeTotal);

            /*sheet.addCell(new jxl.write.Label(2, 3, "H y P", headerFormat2));
             sheet.addCell(new jxl.write.Label(3, 3, "VTAS MENUDEO", headerFormat2));
             sheet.addCell(new jxl.write.Label(4, 3, "VTAS FLOTILLA", headerFormat2));
             sheet.addCell(new jxl.write.Label(5, 3, " F & I", headerFormat2));
             sheet.addCell(new jxl.write.Label(6, 3, "REFACCIONES", headerFormat2));
             sheet.addCell(new jxl.write.Label(7, 3, "ADM & FIN", headerFormat2));
             sheet.addCell(new jxl.write.Label(8, 3, "TOTALES", headerFormat2));
             */
            //Escribimos los resultados al fichero Excel
            workbook.write();

            workbook.close();

            System.out.println(
                    "Lista del anio: " + anioReporte);
            System.out.println(
                    "Archivo Excel Creado Exitosamente!!");
            //leerExcel();
            System.out.println(
                    "Archivo Creado.");
            //nombreArchivo = "prueba.pdf";
            //ftp.transferSocket("192.168.1.27", "ricardo", "stmsc0nt", nombreArchivo);
        } catch (Exception e) {
            System.out.println("writeExcel -> " + e);
            System.out.println("writeExcel -> " + e.getLocalizedMessage());
            System.out.println("writeExcel -> " + e.getMessage());
            System.out.println("writeExcel -> " + e.toString());
        } /*catch (IOException ex) {
         System.out.println("Error al crear el fichero.");
         } catch (WriteException ex) {
         System.out.println("Error al escribir el fichero.");
         }*/

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
