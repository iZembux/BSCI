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
public class calcularAcumulado {

    private int bal_IdIndicador;
    private Double bal_Anio;
    private Double bal_mes;
    private Double bal_objAnual;
    private Double bal_objCuatrimestre;
    private Double bal_intCuatrimestre;
    private Double bal_cumCuatrimestre;
    private Double bal_objAcumulado;
    private Double bal_intAcumulado;
    private Double bal_cumAcumulado;
    private int bal_puntosObtenidos;
    private int bal_puntosOptimos;
public ArrayList<incurridos> clasebalance() {
        ArrayList<incurridos> lista = new ArrayList<incurridos>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM incurridos WHERE activo = 1";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    incurridos objetoIncurridos = new incurridos();
                    objetoIncurridos.setBal_idincurrido(rs.getInt("bal_idIndicador"));
                    objetoIncurridos.setBal_incurrido(rs.getString("bal_anio"));
                    objetoIncurridos.setBal_anio(rs.getInt("bal_mes"));
                    objetoIncurridos.setBal_enero(rs.getDouble("bal_objanual"));
                    objetoIncurridos.setBal_febrero(rs.getDouble("bal_objcuatrimestre"));
                    objetoIncurridos.setBal_marzo(rs.getDouble("bal_intcuatrimestre"));
                    objetoIncurridos.setBal_abril(rs.getDouble("bal_cumcuatrimestre"));
                    objetoIncurridos.setBal_mayo(rs.getDouble("bal_objacumulado"));
                    objetoIncurridos.setBal_junio(rs.getDouble("bal_incacumulado"));
                    objetoIncurridos.setBal_julio(rs.getDouble("bal_cumacumulado"));
                    objetoIncurridos.setBal_agosto(rs.getDouble("bal_puntosobtenidos"));
                    objetoIncurridos.setBal_septiembre(rs.getDouble("bal_puntosoptimos"));
                    
                    
                    lista.add(objetoIncurridos);
                    objetoIncurridos = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR AL OBTENER LIMITES EXCENTO SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL AL OBTENER LIMITES EXCENTO ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL");
            return lista;
        }
        return lista;
    }

    public int getBal_IdIndicador() {
        return bal_IdIndicador;
    }

    public void setBal_IdIndicador(int bal_IdIndicador) {
        this.bal_IdIndicador = bal_IdIndicador;
    }

    public Double getBal_Anio() {
        return bal_Anio;
    }

    public void setBal_Anio(Double bal_Anio) {
        this.bal_Anio = bal_Anio;
    }

    public Double getBal_mes() {
        return bal_mes;
    }

    public void setBal_mes(Double bal_mes) {
        this.bal_mes = bal_mes;
    }

    public Double getBal_objAnual() {
        return bal_objAnual;
    }

    public void setBal_objAnual(Double bal_objAnual) {
        this.bal_objAnual = bal_objAnual;
    }

    public Double getBal_objCuatrimestre() {
        return bal_objCuatrimestre;
    }

    public void setBal_objCuatrimestre(Double bal_objCuatrimestre) {
        this.bal_objCuatrimestre = bal_objCuatrimestre;
    }

    public Double getBal_intCuatrimestre() {
        return bal_intCuatrimestre;
    }

    public void setBal_intCuatrimestre(Double bal_intCuatrimestre) {
        this.bal_intCuatrimestre = bal_intCuatrimestre;
    }

    public Double getBal_cumCuatrimestre() {
        return bal_cumCuatrimestre;
    }

    public void setBal_cumCuatrimestre(Double bal_cumCuatrimestre) {
        this.bal_cumCuatrimestre = bal_cumCuatrimestre;
    }

    public Double getBal_objAcumulado() {
        return bal_objAcumulado;
    }

    public void setBal_objAcumulado(Double bal_objAcumulado) {
        this.bal_objAcumulado = bal_objAcumulado;
    }

    public Double getBal_intAcumulado() {
        return bal_intAcumulado;
    }

    public void setBal_intAcumulado(Double bal_intAcumulado) {
        this.bal_intAcumulado = bal_intAcumulado;
    }

    public Double getBal_cumAcumulado() {
        return bal_cumAcumulado;
    }

    public void setBal_cumAcumulado(Double bal_cumAcumulado) {
        this.bal_cumAcumulado = bal_cumAcumulado;
    }

    public int getBal_puntosObtenidos() {
        return bal_puntosObtenidos;
    }

    public void setBal_puntosObtenidos(int bal_puntosObtenidos) {
        this.bal_puntosObtenidos = bal_puntosObtenidos;
    }

    public int getBal_puntosOptimos() {
        return bal_puntosOptimos;
    }

    public void setBal_puntosOptimos(int bal_puntosOptimos) {
        this.bal_puntosOptimos = bal_puntosOptimos;
    }

   
}
   