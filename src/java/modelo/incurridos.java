/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import control.conexionMySQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author REDES
 */
public class incurridos {

    private String area;
    private String departamento;
    private int bal_idincurrido;
    private String bal_incurrido;
    private String bal_identificaIndicador;
    private int bal_anio;
    private double bal_enero;
    private double bal_eneroAcumulado;
    private double bal_febrero;
    private double bal_febreroAcumulado;
    private double bal_marzo;
    private double bal_marzoAcumulado;
    private double bal_abril;
    private double bal_abrilAcumulado;
    private double bal_mayo;
    private double bal_mayoAcumulado;
    private double bal_junio;
    private double bal_junioAcumulado;
    private double bal_julio;
    private double bal_julioAcumulado;
    private double bal_agosto;
    private double bal_agostoAcumulado;
    private double bal_septiembre;
    private double bal_septiembreAcumulado;
    private double bal_octubre;
    private double bal_octubreAcumulado;
    private double bal_noviembre;
    private double bal_noviembreAcumulado;
    private double bal_diciembre;
    private double bal_diciembreAcumulado;
    private int bal_activo;

    /*
     SELECT ind.bal_idArea, dep.bal_idDepartamento, ind.bal_idDepartamento, dep.bal_departamento, area.bal_idArea, ind.bal_idArea, area.bal_area, 
     ind.bal_idIndicador, inc.bal_idIncurrido, ind.bal_indicador, inc.bal_incurrido, inc.bal_anio, inc.bal_enero, inc.bal_febrero, inc.bal_marzo, 
     inc.bal_abril, inc.bal_mayo, inc.bal_junio, inc.bal_julio, inc.bal_agosto, inc.bal_septiembre, inc.bal_octubre, inc.bal_noviembre, 
     inc.bal_diciembre, inc.bal_activo 
     FROM bal_incurridos inc, bal_indicador ind, bal_departamentos dep, bal_areas area 
     WHERE ind.bal_idIndicador = inc.bal_idIncurrido 
     AND dep.bal_idDepartamento = ind.bal_idDepartamento 
     AND area.bal_idArea = ind.bal_idArea 
     AND inc.bal_activo = 1 
     */
    public ArrayList<incurridos> consultarIncurridos(String unidadNegocio) {
        ArrayList<incurridos> lista = new ArrayList<incurridos>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT inc.bal_idIncurrido as bal_idIncurrido, inc.bal_incurrido as bal_incurrido, inc.bal_anio as bal_anio, inc.bal_enero as bal_enero, inc.bal_febrero as bal_febrero, inc.bal_marzo as bal_marzo, inc.bal_abril as bal_abril, inc.bal_mayo as bal_mayo, inc.bal_junio as bal_junio,"
                    + " inc.bal_julio as bal_julio, inc.bal_agosto as bal_agosto, inc.bal_septiembre as bal_septiembre, inc.bal_octubre as bal_octubre, inc.bal_noviembre as bal_noviembre, inc.bal_diciembre as bal_diciembre, bal_area.bal_area as bal_area," 
                    + " bal_dep.bal_departamento as bal_departamento, ind.bal_operacion as bal_operacion, ind.bal_medida as bal_medida, ind.bal_objGlobal as bal_objGlobal, ind.bal_activo as bal_activo FROM bal_indicador ind, bal_incurridos"
                    + " inc, bal_departamentos bal_dep, bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador " 
                    + "AND ind.bal_activo = 1 AND bal_dep.bal_identificadepartamento = ind.bal_identificaDepartamento " 
                    + "AND bal_area.bal_identificaArea = ind.bal_identificaArea AND inc.bal_anio = 2015 AND inc.bal_incurridoEmpresa = '" + unidadNegocio + "'";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                System.out.println("SQL INCURRIDOS: " + sql);
                while (rs.next()) {
                    incurridos objetoIncurridos = new incurridos();
                    objetoIncurridos.setBal_idincurrido(rs.getInt("bal_idIncurrido"));
                    objetoIncurridos.setDepartamento(rs.getString("bal_departamento"));
                    objetoIncurridos.setArea(rs.getString("bal_area"));
                    objetoIncurridos.setBal_incurrido(rs.getString("bal_incurrido"));
                    objetoIncurridos.setBal_anio(rs.getInt("bal_anio"));
                    objetoIncurridos.setBal_enero(rs.getDouble("bal_enero"));
                    objetoIncurridos.setBal_febrero(rs.getDouble("bal_febrero"));
                    objetoIncurridos.setBal_marzo(rs.getDouble("bal_marzo"));
                    objetoIncurridos.setBal_abril(rs.getDouble("bal_abril"));
                    objetoIncurridos.setBal_mayo(rs.getDouble("bal_mayo"));
                    objetoIncurridos.setBal_junio(rs.getDouble("bal_junio"));
                    objetoIncurridos.setBal_julio(rs.getDouble("bal_julio"));
                    objetoIncurridos.setBal_agosto(rs.getDouble("bal_agosto"));
                    objetoIncurridos.setBal_septiembre(rs.getDouble("bal_septiembre"));
                    objetoIncurridos.setBal_octubre(rs.getDouble("bal_octubre"));
                    objetoIncurridos.setBal_noviembre(rs.getDouble("bal_noviembre"));
                    objetoIncurridos.setBal_diciembre(rs.getDouble("bal_diciembre"));
                    objetoIncurridos.setBal_activo(rs.getInt("bal_activo"));
                    System.out.println("ID INC: " + rs.getInt("bal_idIncurrido"));
                    lista.add(objetoIncurridos);
                    objetoIncurridos = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR-1 AL CONSULTAR INCURRIDOS SQL " + e.getSQLState() + ": " + e.getMessage());
                Error++;
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                    ps = null;
                    rs = null;
                    con.close();
                } catch (SQLException ee) {
                    System.out.println("ERROR-2 AL CONSULTAR INCURRIDOS SQL " + ee.getSQLState() + ": " + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL");
            return lista;
        }
        return lista;
    }

    public ArrayList<incurridos> consultarIncurridosxAnio(int anio) {
        ArrayList<incurridos> lista = new ArrayList<incurridos>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM incurridos WHERE activo  = 1 and anio=" + anio;
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    incurridos objetoIncurridos = new incurridos();
                    objetoIncurridos.setBal_idincurrido(rs.getInt("bal_idIncurrido"));
                    objetoIncurridos.setBal_incurrido(rs.getString("bal_incurrido"));
                    objetoIncurridos.setBal_anio(rs.getInt("bal_anio"));
                    objetoIncurridos.setBal_enero(rs.getDouble("bal_enero"));
                    objetoIncurridos.setBal_febrero(rs.getDouble("bal_febrero"));
                    objetoIncurridos.setBal_marzo(rs.getDouble("bal_marzo"));
                    objetoIncurridos.setBal_abril(rs.getDouble("bal_abril"));
                    objetoIncurridos.setBal_mayo(rs.getDouble("bal_mayo"));
                    objetoIncurridos.setBal_junio(rs.getDouble("bal_junio"));
                    objetoIncurridos.setBal_julio(rs.getDouble("bal_julio"));
                    objetoIncurridos.setBal_agosto(rs.getDouble("bal_agosto"));
                    objetoIncurridos.setBal_septiembre(rs.getDouble("bal_septiembre"));
                    objetoIncurridos.setBal_octubre(rs.getDouble("bal_octubre"));
                    objetoIncurridos.setBal_noviembre(rs.getDouble("bal_noviembre"));
                    objetoIncurridos.setBal_diciembre(rs.getDouble("bal_diciembre"));
                    objetoIncurridos.setBal_activo(rs.getInt("bal_activo"));

                    lista.add(objetoIncurridos);
                    objetoIncurridos = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR AL CONSULTAR INCURRIDOS POR ANIO SQL-1 " + e.getSQLState() + ": " + e.getMessage());
                Error++;
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                    ps = null;
                    rs = null;
                    con.close();
                } catch (SQLException ee) {
                    System.out.println("SQL AL CONSULTAR INCURRIDOS POR ANIO ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL CONSULTAR INCURRIDOS POR ANIO");
            return lista;
        }
        return lista;
    }

        public int insertarIncurrido(String identificaIndicador, String bal_incurridoEmpresa, String bal_incurrido, int bal_anio) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
//                                                     1                     2                3           4
        sql = "INSERT INTO bal_incurridos(bal_identificaIndicador, bal_incurridoEmpresa, bal_incurrido, bal_anio,"
//                      5           6           7          8         9         10         11          12             13           14
                + " bal_enero, bal_febrero, bal_marzo, bal_abril, bal_mayo, bal_junio, bal_julio, bal_agosto, bal_septiembre, bal_octubre, "
//                       15              16            17
                + " bal_noviembre, bal_diciembre, bal_activo)";
        sql += " VALUES(?,?,?,?,0,0,0,0,0,0,0,0,0,0,0,0,1)";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, identificaIndicador);
            ps.setString(2, bal_incurridoEmpresa);
            ps.setString(3, bal_incurrido);
            ps.setInt(4, bal_anio);
            ps.executeUpdate();
            con.close();            
        } catch (SQLException ee) {
            System.out.println("Error 1 al INSERTAR INCURRIDO: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al INSERTAR INCURRIDO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al INSERTAR INCURRIDO: " + e.toString());
            }
        }
        return ok;
    }//fin metodo insertarIncurrido
    
    public ArrayList<incurridos> consultarIncurridosFiltro(String unidadNegocio, String identificaDepartamento, String identificaArea, String anio) {
        ArrayList<incurridos> lista = new ArrayList<incurridos>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT inc.bal_idIncurrido as bal_idIncurrido, ind.bal_identificaIndicador as bal_identificaIndicador, inc.bal_incurrido as bal_incurrido, inc.bal_anio as bal_anio, inc.bal_enero as bal_enero, inc.bal_febrero as bal_febrero, inc.bal_marzo as bal_marzo, inc.bal_abril as bal_abril, inc.bal_mayo as bal_mayo, inc.bal_junio as bal_junio,"
                    + " inc.bal_julio as bal_julio, inc.bal_agosto as bal_agosto, inc.bal_septiembre as bal_septiembre, inc.bal_octubre as bal_octubre, inc.bal_noviembre as bal_noviembre, inc.bal_diciembre as bal_diciembre, bal_area.bal_area as bal_area," 
                    + " bal_dep.bal_departamento as bal_departamento, ind.bal_operacion as bal_operacion, ind.bal_medida as bal_medida, ind.bal_objGlobal as bal_objGlobal, ind.bal_activo as bal_activo FROM bal_indicador ind, bal_incurridos"
                    + " inc, bal_departamentos bal_dep, bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_editable = 1 AND ind.bal_operaAcumulado != 'cap'" 
                    + " AND ind.bal_activo = 1 AND bal_dep.bal_identificadepartamento = ind.bal_identificaDepartamento " 
                    + " AND bal_area.bal_identificaArea = ind.bal_identificaArea AND inc.bal_anio = " + anio;
                    if(!unidadNegocio.equals("all")){
                        sql += " AND inc.bal_incurridoEmpresa = '" + unidadNegocio + "'";
                    }
                    if(!identificaDepartamento.equals("all")){
                        sql += " AND ind.bal_identificadepartamento = '" + identificaDepartamento + "'";
                    }
                    if(!identificaArea.equals("all")){
                        sql += " AND ind.bal_identificaArea = '" + identificaArea + "'";
                    }
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                //System.out.println("SQL INCURRIDOS: " + sql);
                while (rs.next()) {
                    incurridos objetoIncurridos = new incurridos();
                    objetoIncurridos.setBal_idincurrido(rs.getInt("bal_idIncurrido"));
                    objetoIncurridos.setBal_identificaIndicador(rs.getString("bal_identificaIndicador"));
                    objetoIncurridos.setDepartamento(rs.getString("bal_departamento"));
                    objetoIncurridos.setArea(rs.getString("bal_area"));
                    objetoIncurridos.setBal_incurrido(rs.getString("bal_incurrido"));
                    objetoIncurridos.setBal_anio(rs.getInt("bal_anio"));
                    objetoIncurridos.setBal_enero(rs.getDouble("bal_enero"));
                    objetoIncurridos.setBal_febrero(rs.getDouble("bal_febrero"));
                    objetoIncurridos.setBal_marzo(rs.getDouble("bal_marzo"));
                    objetoIncurridos.setBal_abril(rs.getDouble("bal_abril"));
                    objetoIncurridos.setBal_mayo(rs.getDouble("bal_mayo"));
                    objetoIncurridos.setBal_junio(rs.getDouble("bal_junio"));
                    objetoIncurridos.setBal_julio(rs.getDouble("bal_julio"));
                    objetoIncurridos.setBal_agosto(rs.getDouble("bal_agosto"));
                    objetoIncurridos.setBal_septiembre(rs.getDouble("bal_septiembre"));
                    objetoIncurridos.setBal_octubre(rs.getDouble("bal_octubre"));
                    objetoIncurridos.setBal_noviembre(rs.getDouble("bal_noviembre"));
                    objetoIncurridos.setBal_diciembre(rs.getDouble("bal_diciembre"));
                    objetoIncurridos.setBal_activo(rs.getInt("bal_activo"));
                    //System.out.println("ID INC: " + rs.getInt("bal_idIncurrido"));
                    lista.add(objetoIncurridos);
                    objetoIncurridos = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR-1 AL CONSULTAR INCURRIDOS PARA FILTRO SQL " + e.getSQLState() + ": " + e.getMessage());
                Error++;
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                    ps = null;
                    rs = null;
                    con.close();
                } catch (SQLException ee) {
                    System.out.println("ERROR-2 AL CONSULTAR INCURRIDOS PARA FILTRO SQL " + ee.getSQLState() + ": " + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL CONSULTAR INCURRIDOS PARA FILTRO");
            return lista;
        }
        return lista;
    }
    
    public ArrayList<incurridos> consultarIncurridosCapFiltro(String unidadNegocio, String identificaDepartamento, String identificaArea, String anio) {
        ArrayList<incurridos> lista = new ArrayList<incurridos>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT inc.bal_idIncurrido as bal_idIncurrido, ind.bal_identificaIndicador as bal_identificaIndicador, inc.bal_incurrido as bal_incurrido, inc.bal_anio as bal_anio, inc.bal_enero as bal_enero, inc.bal_eneroAcumulado as bal_eneroAcumulado, inc.bal_febrero as bal_febrero, inc.bal_febreroAcumulado as bal_febreroAcumulado, inc.bal_marzo as bal_marzo, inc.bal_marzoAcumulado as bal_marzoAcumulado, inc.bal_abril as bal_abril, inc.bal_abrilAcumulado as bal_abrilAcumulado, inc.bal_mayo as bal_mayo, inc.bal_mayoAcumulado as bal_mayoAcumulado, inc.bal_junio as bal_junio, inc.bal_junioAcumulado as bal_junioAcumulado,"
                    + " inc.bal_julio as bal_julio, inc.bal_agosto as bal_agosto, inc.bal_septiembre as bal_septiembre, inc.bal_octubre as bal_octubre, inc.bal_noviembre as bal_noviembre, inc.bal_diciembre as bal_diciembre, bal_area.bal_area as bal_area," 
                    + " inc.bal_julioAcumulado as bal_julioAcumulado, inc.bal_agostoAcumulado as bal_agostoAcumulado, inc.bal_septiembreAcumulado as bal_septiembreAcumulado, inc.bal_octubreAcumulado as bal_octubreAcumulado, inc.bal_noviembreAcumulado as bal_noviembreAcumulado, inc.bal_diciembreAcumulado as bal_diciembreAcumulado, " 
                    + " bal_dep.bal_departamento as bal_departamento, ind.bal_operacion as bal_operacion, ind.bal_medida as bal_medida, ind.bal_objGlobal as bal_objGlobal, ind.bal_activo as bal_activo FROM bal_indicador ind, bal_acumuladosCapturados inc, " 
                    + " bal_departamentos bal_dep, bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_editable = 1 AND ind.bal_operaAcumulado = 'cap'" 
                    + " AND ind.bal_activo = 1 AND bal_dep.bal_identificadepartamento = ind.bal_identificaDepartamento " 
                    + " AND bal_area.bal_identificaArea = ind.bal_identificaArea AND inc.bal_anio = " + anio;
                    if(!unidadNegocio.equals("all")){
                        sql += " AND inc.bal_incurridoEmpresa = '" + unidadNegocio + "'";
                    }
                    if(!identificaDepartamento.equals("all")){
                        sql += " AND ind.bal_identificadepartamento = '" + identificaDepartamento + "'";
                    }
                    if(!identificaArea.equals("all")){
                        sql += " AND ind.bal_identificaArea = '" + identificaArea + "'";
                    }
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                //System.out.println("SQL INCURRIDOS: " + sql);
                while (rs.next()) {
                    incurridos objetoIncurridos = new incurridos();
                    objetoIncurridos.setBal_idincurrido(rs.getInt("bal_idIncurrido"));
                    objetoIncurridos.setBal_identificaIndicador(rs.getString("bal_identificaIndicador"));
                    objetoIncurridos.setDepartamento(rs.getString("bal_departamento"));
                    objetoIncurridos.setArea(rs.getString("bal_area"));
                    objetoIncurridos.setBal_incurrido(rs.getString("bal_incurrido"));
                    objetoIncurridos.setBal_anio(rs.getInt("bal_anio"));
                    objetoIncurridos.setBal_enero(rs.getDouble("bal_enero"));
                    objetoIncurridos.setBal_eneroAcumulado(rs.getDouble("bal_eneroAcumulado"));
                    objetoIncurridos.setBal_febrero(rs.getDouble("bal_febrero"));
                    objetoIncurridos.setBal_febreroAcumulado(rs.getDouble("bal_febreroAcumulado"));
                    objetoIncurridos.setBal_marzo(rs.getDouble("bal_marzo"));
                    objetoIncurridos.setBal_marzoAcumulado(rs.getDouble("bal_marzoAcumulado"));
                    objetoIncurridos.setBal_abril(rs.getDouble("bal_abril"));
                    objetoIncurridos.setBal_abrilAcumulado(rs.getDouble("bal_abrilAcumulado"));
                    objetoIncurridos.setBal_mayo(rs.getDouble("bal_mayo"));
                    objetoIncurridos.setBal_mayoAcumulado(rs.getDouble("bal_mayoAcumulado"));
                    objetoIncurridos.setBal_junio(rs.getDouble("bal_junio"));
                    objetoIncurridos.setBal_junioAcumulado(rs.getDouble("bal_junioAcumulado"));
                    objetoIncurridos.setBal_julio(rs.getDouble("bal_julio"));
                    objetoIncurridos.setBal_julioAcumulado(rs.getDouble("bal_julioAcumulado"));
                    objetoIncurridos.setBal_agosto(rs.getDouble("bal_agosto"));
                    objetoIncurridos.setBal_agostoAcumulado(rs.getDouble("bal_agostoAcumulado"));
                    objetoIncurridos.setBal_septiembre(rs.getDouble("bal_septiembre"));
                    objetoIncurridos.setBal_septiembreAcumulado(rs.getDouble("bal_septiembreAcumulado"));
                    objetoIncurridos.setBal_octubre(rs.getDouble("bal_octubre"));
                    objetoIncurridos.setBal_octubreAcumulado(rs.getDouble("bal_octubreAcumulado"));
                    objetoIncurridos.setBal_noviembre(rs.getDouble("bal_noviembre"));
                    objetoIncurridos.setBal_noviembreAcumulado(rs.getDouble("bal_noviembreAcumulado"));
                    objetoIncurridos.setBal_diciembre(rs.getDouble("bal_diciembre"));
                    objetoIncurridos.setBal_diciembreAcumulado(rs.getDouble("bal_diciembreAcumulado"));
                    objetoIncurridos.setBal_activo(rs.getInt("bal_activo"));
                    //System.out.println("ID INC: " + rs.getInt("bal_idIncurrido"));
                    lista.add(objetoIncurridos);
                    objetoIncurridos = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR-1 AL CONSULTAR INCURRIDOS CAPTURADOS PARA FILTRO SQL " + e.getSQLState() + ": " + e.getMessage());
                Error++;
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                    ps = null;
                    rs = null;
                    con.close();
                } catch (SQLException ee) {
                    System.out.println("ERROR-2 AL CONSULTAR INCURRIDOS CAPTURADOS PARA FILTRO SQL " + ee.getSQLState() + ": " + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL CONSULTAR INCURRIDOS CAPTURADOS PARA FILTRO");
            return lista;
        }
        return lista;
    }

    public ArrayList<incurridos> buscarIncurridoCuatrimestral(String sql) {
        ArrayList<incurridos> lista = new ArrayList<incurridos>();
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    incurridos objetoIncurridos = new incurridos();
                    objetoIncurridos.setBal_idincurrido(rs.getInt("bal_idIncurrido"));
                    objetoIncurridos.setBal_incurrido(rs.getString("bal_incurrido"));
                    objetoIncurridos.setBal_anio(rs.getInt("bal_anio"));
                    objetoIncurridos.setBal_enero(rs.getDouble("bal_enero"));
                    objetoIncurridos.setBal_febrero(rs.getDouble("bal_febrero"));
                    objetoIncurridos.setBal_marzo(rs.getDouble("bal_marzo"));
                    objetoIncurridos.setBal_abril(rs.getDouble("bal_abril"));
                    objetoIncurridos.setBal_mayo(rs.getDouble("bal_mayo"));
                    objetoIncurridos.setBal_junio(rs.getDouble("bal_junio"));
                    objetoIncurridos.setBal_julio(rs.getDouble("bal_julio"));
                    objetoIncurridos.setBal_agosto(rs.getDouble("bal_agosto"));
                    objetoIncurridos.setBal_septiembre(rs.getDouble("bal_septiembre"));
                    objetoIncurridos.setBal_octubre(rs.getDouble("bal_octubre"));
                    objetoIncurridos.setBal_noviembre(rs.getDouble("bal_noviembre"));
                    objetoIncurridos.setBal_diciembre(rs.getDouble("bal_diciembre"));
                    objetoIncurridos.setBal_activo(rs.getInt("bal_activo"));

                    lista.add(objetoIncurridos);
                    objetoIncurridos = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR AL OBTENER INCURRIDOS CUATRAMESTRAL SQL-1 " + e.getSQLState() + ": " + e.getMessage());
                Error++;
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                    ps = null;
                    rs = null;
                    con.close();
                } catch (SQLException ee) {
                    System.out.println("SQL AL OBTENER INCURRIDOS CUATRAMESTRAL ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL OBTENER INCURRIDOS CUATRIMESTRAL");
            return lista;
        }
        return lista;
    }
    
        public int actualizarIncurrido(int idIncurrido, int anio, String unidadNegocio, double enero, double febrero, double marzo, double abril, double mayo, double junio, double julio, double agosto, double septiembre, double octubre, double noviembre, double diciembre, String usuario, String fecha) {
        //System.out.println("Actualizar Parametro");
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        /*
        System.out.println("ID PARAMETRO: " + idParametro);
        System.out.println("DESCRIPCION1: " + descripcion1);
        System.out.println("DESCRIPCION2: " + descripcion2);
        System.out.println("VALOR1: " + valor1);
        System.out.println("VALOR2: " + valor2);
        System.out.println("USUARIO: " + usuario);
        System.out.println("FECHA: " + fecha);
        */
        sql = "UPDATE bal_incurridos SET bal_enero = ?, bal_febrero = ?, bal_marzo = ?, bal_abril = ? bal_mayo = ?, bal_junio = ? bal_julio = ?, bal_agosto = ? bal_septiembre = ?, bal_octubre = ? bal_noviembre = ?, bal_diciembre = ? WHERE bal_idIndicador= ? AND bal_anio = ?";
        try {
            System.out.println("SQL: " + sql);
            ps = con.prepareStatement(sql);
            ps.setDouble(1, enero);
            ps.setDouble(2, febrero);
            ps.setDouble(3, marzo);
            ps.setDouble(4, abril);
            ps.setDouble(5, mayo);
            ps.setDouble(6, junio);
            ps.setDouble(7, julio);
            ps.setDouble(8, agosto);
            ps.setDouble(9, septiembre);
            ps.setDouble(10, octubre);
            ps.setDouble(11, noviembre);
            ps.setDouble(12, diciembre);
            ps.setInt(13, idIncurrido);
            ps.setInt(14, anio);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ee) {
            System.out.println("Error 1 al ACTUALIZAR INCURRIDO: " + ee.toString() + " : " + ee.getMessage() + " : " + ee.getSQLState());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al ACTUALIZAR INCURRIDO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al ACTUALIZAR INCURRIDO: " + e.toString() + " : " + e.getMessage() + " : " + e.getLocalizedMessage());
            }

        }
        return ok;
    }//fin metodo actulizarIncurridos
        
    public int actualizarIncurridoXMes(String identificaIndicador, int anio, String unidadNegocio, String mes, double valor, String usuario, String fecha) {
        //System.out.println("Actualizar Parametro");
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        /*
        System.out.println("ID PARAMETRO: " + idParametro);
        System.out.println("DESCRIPCION1: " + descripcion1);
        System.out.println("DESCRIPCION2: " + descripcion2);
        System.out.println("VALOR1: " + valor1);
        System.out.println("VALOR2: " + valor2);
        System.out.println("USUARIO: " + usuario);
        System.out.println("FECHA: " + fecha);
        */
        sql = "UPDATE bal_incurridos SET bal_" + mes + " = ? WHERE bal_identificaIndicador= ? AND bal_anio = ?";
        try {
            System.out.println("SQL: " + sql);
            ps = con.prepareStatement(sql);
            ps.setDouble(1, valor);
            ps.setString(2, identificaIndicador);
            ps.setInt(3, anio);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ee) {
            System.out.println("Error 1 al ACTUALIZAR INCURRIDO: " + ee.toString() + " : " + ee.getMessage() + " : " + ee.getSQLState());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al ACTUALIZAR INCURRIDO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al ACTUALIZAR INCURRIDO: " + e.toString() + " : " + e.getMessage() + " : " + e.getLocalizedMessage());
            }

        }
        return ok;
    }//fin metodo ac

    public int actualizarIncurridoCapXMes(String identificaIndicador, int anio, String unidadNegocio, String mes, double valor, double acumulado, String usuario, String fecha) {
        //System.out.println("Actualizar Parametro");
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        System.out.println("actualizarIncurridoCapXMes");
        System.out.println("identifica indicador: " + identificaIndicador);
        System.out.println("Unidad de Negocio: " + unidadNegocio);
        System.out.println("Anio: " + anio);
        System.out.println("Mes: " + mes);
        System.out.println("Incurrido: " + valor);
        System.out.println("Acumualado: " + acumulado);
        sql = "UPDATE bal_acumuladoscapturados SET bal_" + mes + " = ?, bal_" + mes + "Acumulado = ? WHERE bal_identificaIndicador= ? AND bal_anio = ?";
        try {
            System.out.println("SQL: " + sql);
            ps = con.prepareStatement(sql);
            ps.setDouble(1, valor);
            ps.setDouble(2, acumulado);
            ps.setString(3, identificaIndicador);
            ps.setInt(4, anio);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ee) {
            System.out.println("Error 1 al ACTUALIZAR INCURRIDO CAPTURADO: " + ee.toString() + " : " + ee.getMessage() + " : " + ee.getSQLState());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al ACTUALIZAR INCURRIDO CAPTURADO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al ACTUALIZAR INCURRIDO CAPTURADO: " + e.toString() + " : " + e.getMessage() + " : " + e.getLocalizedMessage());
            }

        }
        return ok;
    }//fin metodo ac

    public int getBal_idincurrido() {
        return bal_idincurrido;
    }

    public void setBal_idincurrido(int bal_idincurrido) {
        this.bal_idincurrido = bal_idincurrido;
    }

    public String getBal_incurrido() {
        return bal_incurrido;
    }

    public void setBal_incurrido(String bal_incurrido) {
        this.bal_incurrido = bal_incurrido;
    }

    public int getBal_anio() {
        return bal_anio;
    }

    public void setBal_anio(int bal_anio) {
        this.bal_anio = bal_anio;
    }

    public double getBal_enero() {
        return bal_enero;
    }

    public void setBal_enero(double bal_enero) {
        this.bal_enero = bal_enero;
    }

    public double getBal_febrero() {
        return bal_febrero;
    }

    public void setBal_febrero(double bal_febrero) {
        this.bal_febrero = bal_febrero;
    }

    public double getBal_marzo() {
        return bal_marzo;
    }

    public void setBal_marzo(double bal_marzo) {
        this.bal_marzo = bal_marzo;
    }

    public double getBal_abril() {
        return bal_abril;
    }

    public void setBal_abril(double bal_abril) {
        this.bal_abril = bal_abril;
    }

    public double getBal_mayo() {
        return bal_mayo;
    }

    public void setBal_mayo(double bal_mayo) {
        this.bal_mayo = bal_mayo;
    }

    public double getBal_junio() {
        return bal_junio;
    }

    public void setBal_junio(double bal_junio) {
        this.bal_junio = bal_junio;
    }

    public double getBal_julio() {
        return bal_julio;
    }

    public void setBal_julio(double bal_julio) {
        this.bal_julio = bal_julio;
    }

    public double getBal_agosto() {
        return bal_agosto;
    }

    public void setBal_agosto(double bal_agosto) {
        this.bal_agosto = bal_agosto;
    }

    public double getBal_septiembre() {
        return bal_septiembre;
    }

    public void setBal_septiembre(double bal_septiembre) {
        this.bal_septiembre = bal_septiembre;
    }

    public double getBal_octubre() {
        return bal_octubre;
    }

    public void setBal_octubre(double bal_octubre) {
        this.bal_octubre = bal_octubre;
    }

    public double getBal_noviembre() {
        return bal_noviembre;
    }

    public void setBal_noviembre(double bal_noviembre) {
        this.bal_noviembre = bal_noviembre;
    }

    public double getBal_diciembre() {
        return bal_diciembre;
    }

    public void setBal_diciembre(double bal_diciembre) {
        this.bal_diciembre = bal_diciembre;
    }

    public int getBal_activo() {
        return bal_activo;
    }

    public void setBal_activo(int bal_activo) {
        this.bal_activo = bal_activo;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getBal_identificaIndicador() {
        return bal_identificaIndicador;
    }

    public void setBal_identificaIndicador(String bal_identificaIndicador) {
        this.bal_identificaIndicador = bal_identificaIndicador;
    }

    public double getBal_eneroAcumulado() {
        return bal_eneroAcumulado;
    }

    public void setBal_eneroAcumulado(double bal_eneroAcumulado) {
        this.bal_eneroAcumulado = bal_eneroAcumulado;
    }

    public double getBal_febreroAcumulado() {
        return bal_febreroAcumulado;
    }

    public void setBal_febreroAcumulado(double bal_febreroAcumulado) {
        this.bal_febreroAcumulado = bal_febreroAcumulado;
    }

    public double getBal_marzoAcumulado() {
        return bal_marzoAcumulado;
    }

    public void setBal_marzoAcumulado(double bal_marzoAcumulado) {
        this.bal_marzoAcumulado = bal_marzoAcumulado;
    }

    public double getBal_abrilAcumulado() {
        return bal_abrilAcumulado;
    }

    public void setBal_abrilAcumulado(double bal_abrilAcumulado) {
        this.bal_abrilAcumulado = bal_abrilAcumulado;
    }

    public double getBal_mayoAcumulado() {
        return bal_mayoAcumulado;
    }

    public void setBal_mayoAcumulado(double bal_mayoAcumulado) {
        this.bal_mayoAcumulado = bal_mayoAcumulado;
    }

    public double getBal_junioAcumulado() {
        return bal_junioAcumulado;
    }

    public void setBal_junioAcumulado(double bal_junioAcumulado) {
        this.bal_junioAcumulado = bal_junioAcumulado;
    }

    public double getBal_julioAcumulado() {
        return bal_julioAcumulado;
    }

    public void setBal_julioAcumulado(double bal_julioAcumulado) {
        this.bal_julioAcumulado = bal_julioAcumulado;
    }

    public double getBal_agostoAcumulado() {
        return bal_agostoAcumulado;
    }

    public void setBal_agostoAcumulado(double bal_agostoAcumulado) {
        this.bal_agostoAcumulado = bal_agostoAcumulado;
    }

    public double getBal_septiembreAcumulado() {
        return bal_septiembreAcumulado;
    }

    public void setBal_septiembreAcumulado(double bal_septiembreAcumulado) {
        this.bal_septiembreAcumulado = bal_septiembreAcumulado;
    }

    public double getBal_octubreAcumulado() {
        return bal_octubreAcumulado;
    }

    public void setBal_octubreAcumulado(double bal_octubreAcumulado) {
        this.bal_octubreAcumulado = bal_octubreAcumulado;
    }

    public double getBal_noviembreAcumulado() {
        return bal_noviembreAcumulado;
    }

    public void setBal_noviembreAcumulado(double bal_noviembreAcumulado) {
        this.bal_noviembreAcumulado = bal_noviembreAcumulado;
    }

    public double getBal_diciembreAcumulado() {
        return bal_diciembreAcumulado;
    }

    public void setBal_diciembreAcumulado(double bal_diciembreAcumulado) {
        this.bal_diciembreAcumulado = bal_diciembreAcumulado;
    }

}
