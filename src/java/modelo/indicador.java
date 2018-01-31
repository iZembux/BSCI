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
public class indicador {

    private int bal_idIndicador;
    private String bal_identificaIndicador;
    private String bal_empresa;
    private int bal_idDepartamento; 
    private String bal_identificaDepartamento; 
    private int bal_idArea;
    private String bal_identificaArea; 
    private String bal_indicador;
    private int anio;
    private double bal_objGlobal;   
    private double bal_enero;
    private double bal_febrero;
    private double bal_marzo;
    private double bal_abril;
    private double bal_mayo;
    private double bal_junio;
    private double bal_julio;
    private double bal_agosto;
    private double bal_septiembre;
    private double bal_octubre;
    private double bal_noviembre;
    private double bal_diciembre;
    private double bal_puntosOptimos;
    private String bal_operacion;
    private String bal_medida;
    private String bal_operaAcumulado;
    private int bal_redondeo;
    private int bal_editable;
    private int bal_activo;
    private String bal_departamento;
    private String bal_area;

    public ArrayList<indicador> consultarIndicador(String unidadNegocio) {
        ArrayList<indicador> lista = new ArrayList<indicador>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT ind.bal_idIndicador as bal_idIndicador, ind.bal_indicador as bal_indicador, ind.bal_enero as bal_enero, ind.bal_febrero as bal_febrero, ind.bal_marzo as bal_marzo, ind.bal_abril as bal_abril, ind.bal_mayo as bal_mayo, ind.bal_junio as bal_junio,"
                    + " ind.bal_julio as bal_julio, ind.bal_agosto as bal_agosto, ind.bal_septiembre as bal_septiembre, ind.bal_octubre as bal_octubre, ind.bal_noviembre as bal_noviembre, ind.bal_diciembre as bal_diciembre, bal_area.bal_area as bal_area, bal_dep.bal_departamento as bal_departamento,"
                    + " ind.bal_puntosOptimos as bal_puntosOptimos, ind.bal_operacion as bal_operacion, ind.bal_medida as bal_medida, ind.bal_objGlobal as bal_objGlobal, ind.bal_idDepartamento as bal_idDepartamento, ind.bal_identificaArea as bal_identificaArea,ind.bal_operaAcumulado as bal_operaAcumulado, ind.bal_redondeo as bal_redondeo, ind.bal_editable as bal_editable, ind.bal_idArea as bal_idArea, ind.bal_activo as bal_activo" 
                    + " FROM bal_indicador ind, bal_incurridos inc, bal_departamentos bal_dep," 
                    + " bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1 " 
                    + " AND bal_dep.bal_identificadepartamento = ind.bal_identificaDepartamento AND bal_area.bal_identificaArea = ind.bal_identificaArea " 
                    + " AND inc.bal_anio = 2015 AND inc.bal_incurridoEmpresa = '" + unidadNegocio + "'";

            //System.out.println("QUERY INDICADOR: " + sql);
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    indicador objetoIndicador = new indicador();
                    objetoIndicador.setBal_idIndicador(rs.getInt("bal_idIndicador"));
                    objetoIndicador.setBal_departamento(rs.getString("bal_departamento"));
                    objetoIndicador.setBal_area(rs.getString("bal_area"));
                    objetoIndicador.setBal_idDepartamento(rs.getInt("bal_idDepartamento"));
                    objetoIndicador.setBal_identificaArea(rs.getString("bal_identificaArea"));
                    objetoIndicador.setBal_indicador(rs.getString("bal_indicador"));
                    objetoIndicador.setBal_objGlobal(rs.getDouble("bal_objGlobal"));
                    objetoIndicador.setBal_enero(rs.getDouble("bal_enero"));
                    objetoIndicador.setBal_febrero(rs.getDouble("bal_febrero"));
                    objetoIndicador.setBal_marzo(rs.getDouble("bal_marzo"));
                    objetoIndicador.setBal_abril(rs.getDouble("bal_abril"));
                    objetoIndicador.setBal_mayo(rs.getDouble("bal_mayo"));
                    objetoIndicador.setBal_junio(rs.getDouble("bal_junio"));
                    objetoIndicador.setBal_julio(rs.getDouble("bal_julio"));
                    objetoIndicador.setBal_agosto(rs.getDouble("bal_Agosto"));
                    objetoIndicador.setBal_septiembre(rs.getDouble("bal_septiembre"));
                    objetoIndicador.setBal_octubre(rs.getDouble("bal_octubre"));
                    objetoIndicador.setBal_noviembre(rs.getDouble("bal_noviembre"));
                    objetoIndicador.setBal_diciembre(rs.getDouble("bal_diciembre"));
                    objetoIndicador.setBal_puntosOptimos(rs.getDouble("bal_puntosOptimos"));
                    objetoIndicador.setBal_operacion(rs.getString("bal_operacion"));
                    objetoIndicador.setBal_medida(rs.getString("bal_medida"));
                    objetoIndicador.setBal_operaAcumulado(rs.getString("bal_operaAcumulado"));
                    objetoIndicador.setBal_redondeo(rs.getInt("bal_redondeo"));
                    objetoIndicador.setBal_editable(rs.getInt("bal_editable"));
                    objetoIndicador.setBal_activo(rs.getInt("bal_activo"));
                    lista.add(objetoIndicador);
                    objetoIndicador = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR AL OBTENER INDICADORES SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL AL OBTENER INDICADORES ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL");
            return lista;
        }
        return lista;
    }
    
    public ArrayList<indicador> consultarIndicadorXId(int idIndicador) {
        ArrayList<indicador> lista = new ArrayList<indicador>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            //sql = "SELECT * FROM bal_indicador WHERE bal_idIndicador = " + idIndicador;
                        sql = "SELECT ind.bal_idIndicador as bal_idIndicador, ind.bal_identificaIndicador as bal_identificaIndicador, ind.bal_indicador as bal_indicador,"
                                + " ind.bal_enero as bal_enero, ind.bal_febrero as bal_febrero, ind.bal_marzo as bal_marzo, ind.bal_abril as bal_abril, ind.bal_mayo as bal_mayo,"
                                + " ind.bal_junio as bal_junio, ind.bal_julio as bal_julio, ind.bal_agosto as bal_agosto, ind.bal_septiembre as bal_septiembre,"
                                + " ind.bal_octubre as bal_octubre, ind.bal_noviembre as bal_noviembre, ind.bal_diciembre as bal_diciembre,"
                                + " bal_area.bal_area as bal_area, bal_dep.bal_departamento as bal_departamento, ind.bal_puntosOptimos as bal_puntosOptimos,"
                                + " ind.bal_operacion as bal_operacion, ind.bal_medida as bal_medida, ind.bal_objGlobal as bal_objGlobal, ind.bal_idDepartamento as bal_idDepartamento,"
                                + " ind.bal_identificaArea as bal_identificaArea, ind.bal_identificaDepartamento as bal_identificaDepartamento, ind.bal_operaAcumulado as bal_operaAcumulado, ind.bal_redondeo as bal_redondeo, ind.bal_editable as bal_editable,"
                                + " ind.bal_idArea as bal_idArea, ind.bal_activo as bal_activo, ind.bal_anio as bal_anio, ind.bal_empresa as bal_empresa" 
                    + " FROM bal_indicador ind, bal_incurridos inc, bal_departamentos bal_dep," 
                    + " bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1 " 
                    + " AND bal_dep.bal_identificadepartamento = ind.bal_identificaDepartamento AND bal_area.bal_identificaArea = ind.bal_identificaArea " 
                    + " AND inc.bal_anio = 2015 AND ind.bal_idIndicador = " + idIndicador;
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    indicador objetoIndicador = new indicador();
                    objetoIndicador.setBal_idIndicador(rs.getInt("bal_idIndicador"));
                    objetoIndicador.setBal_identificaIndicador(rs.getString("bal_identificaIndicador"));
                    objetoIndicador.setBal_departamento(rs.getString("bal_departamento"));
                    objetoIndicador.setBal_identificaArea(rs.getString("bal_identificaArea"));
                    objetoIndicador.setBal_area(rs.getString("bal_area"));
                    objetoIndicador.setBal_idDepartamento(rs.getInt("bal_idDepartamento"));
                    objetoIndicador.setBal_identificaDepartamento(rs.getString("bal_identificaDepartamento"));
                    objetoIndicador.setBal_idArea(rs.getInt("bal_idArea"));
                    objetoIndicador.setBal_indicador(rs.getString("bal_indicador"));
                    objetoIndicador.setBal_empresa(rs.getString("bal_empresa"));
                    objetoIndicador.setAnio(rs.getInt("bal_anio"));
                    objetoIndicador.setBal_objGlobal(rs.getDouble("bal_objGlobal"));
                    objetoIndicador.setBal_enero(rs.getDouble("bal_enero"));
                    objetoIndicador.setBal_febrero(rs.getDouble("bal_febrero"));
                    objetoIndicador.setBal_marzo(rs.getDouble("bal_marzo"));
                    objetoIndicador.setBal_abril(rs.getDouble("bal_abril"));
                    objetoIndicador.setBal_mayo(rs.getDouble("bal_mayo"));
                    objetoIndicador.setBal_junio(rs.getDouble("bal_junio"));
                    objetoIndicador.setBal_julio(rs.getDouble("bal_julio"));
                    objetoIndicador.setBal_agosto(rs.getDouble("bal_Agosto"));
                    objetoIndicador.setBal_septiembre(rs.getDouble("bal_septiembre"));
                    objetoIndicador.setBal_octubre(rs.getDouble("bal_octubre"));
                    objetoIndicador.setBal_noviembre(rs.getDouble("bal_noviembre"));
                    objetoIndicador.setBal_diciembre(rs.getDouble("bal_diciembre"));
                    objetoIndicador.setBal_puntosOptimos(rs.getDouble("bal_puntosOptimos"));
                    objetoIndicador.setBal_operacion(rs.getString("bal_operacion"));
                    objetoIndicador.setBal_medida(rs.getString("bal_medida"));
                    objetoIndicador.setBal_operaAcumulado(rs.getString("bal_operaAcumulado"));
                    objetoIndicador.setBal_redondeo(rs.getInt("bal_redondeo"));
                    objetoIndicador.setBal_editable(rs.getInt("bal_editable"));
                    objetoIndicador.setBal_activo(rs.getInt("bal_activo"));
                    lista.add(objetoIndicador);
                    objetoIndicador = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR AL CONSTULTAR INDICADOR POR ID SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL AL CONSTULTAR INDICADOR POR ID ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL CONSTULTAR INDICADOR POR ID");
            return lista;
        }
        return lista;
    }

    
    public int consultarUltimoIdIndicador() {
        int ultimoId = 0;
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT MAX(`bal_idIndicador`) AS ultimo FROM `bal_indicador`";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    ultimoId = rs.getInt("ultimo");
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR AL OBTENER ULTIMO ID DE INDICADOR SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL AL OBTENER ULTIMO ID DE INDICADOR ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL OBTENER ULTIMO ID DE INDICADOR");
            return ultimoId;
        }
        return ultimoId;
    }

    
    /////-------------------ACTUALIZA INDICADORES----------------------------
    public int actualizarIncurrido(String identificaIndicador, String empresa, String identificaDepartamento, String identificaArea, String balindicador, Double objGlobal,
            Double balenero, Double balfebrero, Double balmarzo, Double balabril, Double balmayo, Double baljunio, Double baljulio, Double balagosto,
            Double balseptiembre, Double baloctubre, Double balnoviembre, Double baldiciembre, Double balPOptimos, int balredondeo, int baleditable,
            String baloperacion, String balmedida, String baloperaAcumulado, int balactivo, int anio) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        ///System.out.println("MES: " + mes + " IDENTIFICADOR: " + identificador + " EMPRESA: " + empresa + " ANIO: " + anio);
        sql = "UPDATE bal_indicador SET bal_identificaDepartamento='" + identificaDepartamento + "', bal_identificaArea='" + identificaArea
                + "', bal_indicador='" + balindicador + "', bal_objGlobal=" + objGlobal + ", bal_enero=" + balenero
                + ", bal_febrero=" + balfebrero + ", bal_marzo=" + balmarzo + ", bal_abril=" + balabril
                + ", bal_mayo=" + balmayo + ", bal_junio=" + baljunio + ", bal_julio=" + baljulio
                + ", bal_agosto=" + balagosto + ", bal_septiembre=" + balseptiembre + ", bal_octubre=" + baloctubre
                + ", bal_noviembre=" + balnoviembre + ", bal_diciembre=" + baldiciembre + ", bal_puntosOptimos=" + balPOptimos + ", "
                + "bal_redondeo=" + balredondeo + ", bal_editable=" + baleditable + ", bal_operacion='" + baloperacion+ "', bal_medida='" + balmedida + "', bal_operaAcumulado='" + baloperaAcumulado + "', bal_activo=" + balactivo;

        sql += " WHERE bal_identificaIndicador = '" + identificaIndicador + "' AND bal_anio = " + anio;
        //bal_empresa='" + empresa + "', bal_identificaDepartamento='" + identificaDepartamento + "',
        //System.out.println("SQL ACTUALIZAR INDICADOR: " + sql);
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
            System.out.println("SQL INDICADOR: " + sql);
        } catch (SQLException ee) {
            System.out.println("ERROR 1 AL ACTUALIZAR INCURRIDO: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("ERROR 2 AL ACTUALIZAR INCURRIDO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 3 AL ACTUALIZAR INCURRIDO: " + e.toString());
            }
        }
        return ok;
    }//fin metodo inserta

    
    public int insertarIndicador(String identificaIndicador, String bal_empresa, String bal_identificaDepartamento, String bal_identificaArea, String bal_indicador, 
            double bal_objGlobal, double bal_enero, double bal_febrero, double bal_marzo, double bal_abril, double bal_mayo, double bal_junio, 
            double bal_julio, double bal_agosto, double bal_septiembre, double bal_octubre, double bal_noviembre, double bal_diciembre, 
            double bal_puntosOptimos, String bal_operacion, String bal_medida, String bal_operaAcumulado, int bal_redondeo, int bal_editable, int bal_anio) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        System.out.println("bal");
//                                                        1                2                 3                     4                 5             6
        sql = "INSERT INTO bal_indicador(bal_identificaIndicador, bal_empresa, bal_identificaDepartamento, bal_identificaArea, bal_indicador, bal_objGlobal,"
//                      7           8           9          10        11        12         13         14             15           16
                + " bal_enero, bal_febrero, bal_marzo, bal_abril, bal_mayo, bal_junio, bal_julio, bal_agosto, bal_septiembre, bal_octubre, "
//                       17             18              19                20            21              22               23            24          25 
                + " bal_noviembre, bal_diciembre, bal_puntosOptimos, bal_operacion, bal_medida, bal_operaAcumulado, bal_redondeo, bal_editable, bal_anio, bal_activo)";
        sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, identificaIndicador);
            ps.setString(2, bal_empresa);
            ps.setString(3, bal_identificaDepartamento);
            ps.setString(4, bal_identificaArea);
            ps.setString(5, bal_indicador);
            ps.setDouble(6, bal_objGlobal);
            ps.setDouble(7, bal_enero);
            ps.setDouble(8, bal_febrero);
            ps.setDouble(9, bal_marzo);
            ps.setDouble(10, bal_abril);
            ps.setDouble(11, bal_mayo);
            ps.setDouble(12, bal_junio);
            ps.setDouble(13, bal_julio);
            ps.setDouble(14, bal_agosto);
            ps.setDouble(15, bal_septiembre);
            ps.setDouble(16, bal_octubre);
            ps.setDouble(17, bal_noviembre);
            ps.setDouble(18, bal_diciembre);
            ps.setDouble(19, bal_puntosOptimos);
            ps.setString(20, bal_operacion);
            ps.setString(21, bal_medida);
            ps.setString(22, bal_operaAcumulado);
            ps.setInt(23, bal_redondeo);
            ps.setInt(24, bal_editable);
            ps.setInt(25, bal_anio);
            ps.executeUpdate();
            con.close();
            System.out.println("SQL INSERTA EL INDICADOR"+ sql);
            
        } catch (SQLException ee) {
            System.out.println("Error 1 al INSERTAR INDICADOR IN INDICAROR: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al INSERTAR INDICADOR PARA FORMULARIO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al INSERTAR INDICADOR: " + e.toString());
            }
        }
        return ok;
    }//fin metodo insertarVentaAutoNuevo
    
    public int getBal_idIndicador() {
        return bal_idIndicador;
    }

    public void setBal_idIndicador(int bal_idIndicador) {
        this.bal_idIndicador = bal_idIndicador;
    }

    public int getBal_idDepartamento() {
        return bal_idDepartamento;
    }

    public void setBal_idDepartamento(int bal_idDepartamento) {
        this.bal_idDepartamento = bal_idDepartamento;
    }

    public int getBal_idArea() {
        return bal_idArea;
    }

    public void setBal_idArea(int bal_idArea) {
        this.bal_idArea = bal_idArea;
    }

    public String getBal_indicador() {
        return bal_indicador;
    }

    public void setBal_indicador(String bal_indicador) {
        this.bal_indicador = bal_indicador;
    }

    public double getBal_objGlobal() {
        return bal_objGlobal;
    }

    public void setBal_objGlobal(double bal_objGlobal) {
        this.bal_objGlobal = bal_objGlobal;
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

    public double getBal_puntosOptimos() {
        return bal_puntosOptimos;
    }

    public void setBal_puntosOptimos(double bal_puntosOptimos) {
        this.bal_puntosOptimos = bal_puntosOptimos;
    }

    public String getBal_operacion() {
        return bal_operacion;
    }

    public void setBal_operacion(String bal_operacion) {
        this.bal_operacion = bal_operacion;
    }

    public String getBal_medida() {
        return bal_medida;
    }

    public void setBal_medida(String bal_medida) {
        this.bal_medida = bal_medida;
    }

    public int getBal_activo() {
        return bal_activo;
    }

    public void setBal_activo(int bal_activo) {
        this.bal_activo = bal_activo;
    }

    public String getBal_identificaArea() {
        return bal_identificaArea;
    }

    public void setBal_identificaArea(String bal_identificaArea) {
        this.bal_identificaArea = bal_identificaArea;
    }

        public String getBal_identificaIndicador() {
        return bal_identificaIndicador;
    }

    public void setBal_identificaIndicador(String bal_identificaIndicador) {
        this.bal_identificaIndicador = bal_identificaIndicador;
    }

    public String getBal_operaAcumulado() {
        return bal_operaAcumulado;
    }

    public void setBal_operaAcumulado(String bal_operaAcumulado) {
        this.bal_operaAcumulado = bal_operaAcumulado;
    }

    public int getBal_redondeo() {
        return bal_redondeo;
    }

    public void setBal_redondeo(int bal_redondeo) {
        this.bal_redondeo = bal_redondeo;
    }

    public int getBal_editable() {
        return bal_editable;
    }

    public void setBal_editable(int bal_editable) {
        this.bal_editable = bal_editable;
    }

    public String getBal_empresa() {
        return bal_empresa;
    }

    public void setBal_empresa(String bal_empresa) {
        this.bal_empresa = bal_empresa;
    }

    public String getBal_identificaDepartamento() {
        return bal_identificaDepartamento;
    }

    public void setBal_identificaDepartamento(String bal_identificaDepartamento) {
        this.bal_identificaDepartamento = bal_identificaDepartamento;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public String getBal_departamento() {
        return bal_departamento;
    }

    public void setBal_departamento(String bal_departamento) {
        this.bal_departamento = bal_departamento;
    }

    public String getBal_area() {
        return bal_area;
    }

    public void setBal_area(String bal_area) {
        this.bal_area = bal_area;
    }
}
