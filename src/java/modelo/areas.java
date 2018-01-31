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
public class areas {

    private int bal_idarea;
    private String bal_area;
    private String bal_identificaArea;
    private int bal_activo;

    public ArrayList<areas> consultarAreas() {
        ArrayList<areas> lista = new ArrayList<areas>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM bal_areas WHERE bal_activo = 1";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    areas objetoAreas = new areas();
                    objetoAreas.setBal_idarea(rs.getInt("bal_idarea"));
                    objetoAreas.setBal_area(rs.getString("bal_area"));
                    objetoAreas.setBal_identificaArea(rs.getString("bal_identificaArea"));
                    objetoAreas.setBal_activo(rs.getInt("bal_activo"));
                    lista.add(objetoAreas);
                    objetoAreas = null;
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

    public int getBal_idarea() {
        return bal_idarea;
    }

    public void setBal_idarea(int bal_idarea) {
        this.bal_idarea = bal_idarea;
    }

    public String getBal_area() {
        return bal_area;
    }

    public void setBal_area(String bal_area) {
        this.bal_area = bal_area;
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
    }

   