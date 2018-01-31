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
public class incurridosCapturados {

    private String area;
    private String departamento;
    private int bal_idincurrido;
    private String bal_incurrido;
    private int bal_anio;
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
    private int bal_activo;

    public ArrayList<incurridosCapturados> consultarIncurridosXEmpresa(String unidadNegocio) {
        ArrayList<incurridosCapturados> lista = new ArrayList<incurridosCapturados>();
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
                    incurridosCapturados objetoIncurridos = new incurridosCapturados();
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
    public String[] consultarIncurridos(String sql) {
        String[] lista = new String[2];
        lista[0] = "0.0";
        lista[1] = "0.0";
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
                System.out.println("SQL INCURRIDOS: " + sql);
                while (rs.next()) {
                    lista[0] = rs.getString("incurridoCapturado");
                    lista[1] = rs.getString("acumuladoCapturado");
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

}
