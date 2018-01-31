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
public class balance {

    private int bal_IdIndicador;
    private String bal_identificaIndicador;
    private int bal_IdArea;
    private String bal_identificaArea;
    private int bal_IdDepartamento;
    private String bal_identificaDepartamento;
    private int bal_Anio;
    private int bal_Mes;
    private Double bal_ObjAnual;
    private Double bal_ObjCuatrimestre;
    private Double bal_IncCuatrimestre;
    private Double bal_CumCuatrimestre;
    private Double bal_ObjAcumulado;
    private Double bal_IncAcumulado;
    private Double bal_CumAcumulado;
    private Double bal_PuntosObtenidos;
    private Double bal_PuntosOptimos;
    private String bal_Medida;
    private String bal_Operacion;
    private String areaString;
    private String bal_Indicador;
    private String bal_Area;
    

    public ArrayList<balance> clasebalance() {
        ArrayList<balance> consulta = new ArrayList<balance>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM bal_incurridos WHERE bal_activo = 1";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    balance objetoBalance = new balance();
                    objetoBalance.setBal_IdIndicador(rs.getInt("bal_idIndicador"));
                    objetoBalance.setBal_Area(rs.getString("bal_area"));
                    objetoBalance.setBal_Indicador(rs.getString("bal_indicador"));
                    objetoBalance.setBal_IdArea(rs.getInt("bal_idArea"));
                    objetoBalance.setBal_IdDepartamento(rs.getInt("bal_idDepartamento"));
                    objetoBalance.setBal_Anio(rs.getInt("bal_anio"));
                    objetoBalance.setBal_Mes(rs.getInt("bal_mes"));
                    objetoBalance.setBal_ObjAnual(rs.getDouble("bal_objanual"));
                    objetoBalance.setBal_ObjCuatrimestre(rs.getDouble("bal_objcuatrimestre"));
                    objetoBalance.setBal_IncCuatrimestre(rs.getDouble("bal_inccuatrimestre"));
                    objetoBalance.setBal_CumCuatrimestre(rs.getDouble("bal_cumcuatrimestre"));
                    objetoBalance.setBal_ObjAcumulado(rs.getDouble("bal_objacumulado"));
                    objetoBalance.setBal_IncAcumulado(rs.getDouble("bal_incacumulado"));
                    objetoBalance.setBal_CumAcumulado(rs.getDouble("bal_cumacumulado"));
                    objetoBalance.setBal_PuntosObtenidos(rs.getDouble("bal_puntosobtenidos"));
                    objetoBalance.setBal_PuntosOptimos(rs.getDouble("bal_puntosoptimos"));
                    objetoBalance.setBal_Medida(rs.getString("bal_medida"));
                    objetoBalance.setBal_Operacion(rs.getString("bal_operacion"));

                    consulta.add(objetoBalance);
                    objetoBalance = null;
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
            return consulta;
        }
        return consulta;
    }

    public int getBal_IdIndicador() {
        return bal_IdIndicador;
    }

    public void setBal_IdIndicador(int bal_IdIndicador) {
        this.bal_IdIndicador = bal_IdIndicador;
    }

    public int getBal_IdArea() {
        return bal_IdArea;
    }

    public void setBal_IdArea(int bal_IdArea) {
        this.bal_IdArea = bal_IdArea;
    }

    public int getBal_IdDepartamento() {
        return bal_IdDepartamento;
    }

    public void setBal_IdDepartamento(int bal_IdDepartamento) {
        this.bal_IdDepartamento = bal_IdDepartamento;
    }

    public int getBal_Anio() {
        return bal_Anio;
    }

    public void setBal_Anio(int bal_Anio) {
        this.bal_Anio = bal_Anio;
    }

    public int getBal_Mes() {
        return bal_Mes;
    }

    public void setBal_Mes(int bal_Mes) {
        this.bal_Mes = bal_Mes;
    }

    public Double getBal_ObjAnual() {
        return bal_ObjAnual;
    }

    public void setBal_ObjAnual(Double bal_ObjAnual) {
        this.bal_ObjAnual = bal_ObjAnual;
    }

    public Double getBal_ObjCuatrimestre() {
        return bal_ObjCuatrimestre;
    }

    public void setBal_ObjCuatrimestre(Double bal_ObjCuatrimestre) {
        this.bal_ObjCuatrimestre = bal_ObjCuatrimestre;
    }

    public Double getBal_IncCuatrimestre() {
        return bal_IncCuatrimestre;
    }

    public void setBal_IncCuatrimestre(Double bal_IncCuatrimestre) {
        this.bal_IncCuatrimestre = bal_IncCuatrimestre;
    }

    public Double getBal_CumCuatrimestre() {
        return bal_CumCuatrimestre;
    }

    public void setBal_CumCuatrimestre(Double bal_CumCuatrimestre) {
        this.bal_CumCuatrimestre = bal_CumCuatrimestre;
    }

    public Double getBal_ObjAcumulado() {
        return bal_ObjAcumulado;
    }

    public void setBal_ObjAcumulado(Double bal_ObjAcumulado) {
        this.bal_ObjAcumulado = bal_ObjAcumulado;
    }

    public Double getBal_IncAcumulado() {
        return bal_IncAcumulado;
    }

    public void setBal_IncAcumulado(Double bal_IncAcumulado) {
        this.bal_IncAcumulado = bal_IncAcumulado;
    }

    public Double getBal_CumAcumulado() {
        return bal_CumAcumulado;
    }

    public void setBal_CumAcumulado(Double bal_CumAcumulado) {
        this.bal_CumAcumulado = bal_CumAcumulado;
    }

    public Double getBal_PuntosObtenidos() {
        return bal_PuntosObtenidos;
    }

    public void setBal_PuntosObtenidos(Double bal_PuntosObtenidos) {
        this.bal_PuntosObtenidos = bal_PuntosObtenidos;
    }

    public Double getBal_PuntosOptimos() {
        return bal_PuntosOptimos;
    }

    public void setBal_PuntosOptimos(Double bal_PuntosOptimos) {
        this.bal_PuntosOptimos = bal_PuntosOptimos;
    }

    public String getBal_Medida() {
        return bal_Medida;
    }

    public void setBal_Medida(String bal_Medida) {
        this.bal_Medida = bal_Medida;
    }

    public String getBal_Operacion() {
        return bal_Operacion;
    }

    public void setBal_Operacion(String bal_Operacion) {
        this.bal_Operacion = bal_Operacion;
    }

    public String getAreaString() {
        return areaString;
    }

    public void setAreaString(String areaString) {
        this.areaString = areaString;
    }

    public String getBal_Indicador() {
        return bal_Indicador;
    }

    public void setBal_Indicador(String bal_Indicador) {
        this.bal_Indicador = bal_Indicador;
    }

    public String getBal_Area() {
        return bal_Area;
    }

    public void setBal_Area(String bal_Area) {
        this.bal_Area = bal_Area;
    }

    public String getBal_identificaIndicador() {
        return bal_identificaIndicador;
    }

    public void setBal_identificaIndicador(String bal_identificaIndicador) {
        this.bal_identificaIndicador = bal_identificaIndicador;
    }

    public String getBal_identificaArea() {
        return bal_identificaArea;
    }

    public void setBal_identificaArea(String bal_identificaArea) {
        this.bal_identificaArea = bal_identificaArea;
    }

    public String getBal_identificaDepartamento() {
        return bal_identificaDepartamento;
    }

    public void setBal_identificaDepartamento(String bal_identificaDepartamento) {
        this.bal_identificaDepartamento = bal_identificaDepartamento;
    }
    }

   