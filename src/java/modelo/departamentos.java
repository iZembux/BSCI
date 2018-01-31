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
public class departamentos {
    private int bal_iddepartamento;
    private String bal_identificaDepartamento;
    private String bal_departamento;
    private int bal_activo;
    
     public ArrayList<departamentos> consultarDepartamentos(){
        ArrayList<departamentos> lista = new ArrayList<departamentos>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM bal_departamentos WHERE bal_activo = 1";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    departamentos objetoDepartamentos = new departamentos();
                    objetoDepartamentos.setBal_iddepartamento(rs.getInt("bal_idDepartamento"));
                    objetoDepartamentos.setBal_identificaDepartamento(rs.getString("bal_identificaDepartamento"));
                    objetoDepartamentos.setBal_departamento(rs.getString("bal_departamento"));
                    objetoDepartamentos.setBal_activo(rs.getInt("bal_activo"));
                    lista.add(objetoDepartamentos);
                    objetoDepartamentos = null;
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

    public int getBal_iddepartamento() {
        return bal_iddepartamento;
    }

    public void setBal_iddepartamento(int bal_iddepartamento) {
        this.bal_iddepartamento = bal_iddepartamento;
    }

    public String getBal_departamento() {
        return bal_departamento;
    }

    public void setBal_departamento(String bal_departamento) {
        this.bal_departamento = bal_departamento;
    }

    public int getBal_activo() {
        return bal_activo;
    }

    public void setBal_activo(int bal_activo) {
        this.bal_activo = bal_activo;
    }

    public String getBal_identificaDepartamento() {
        return bal_identificaDepartamento;
    }

    public void setBal_identificaDepartamento(String bal_identificaDepartamento) {
        this.bal_identificaDepartamento = bal_identificaDepartamento;
    }

   
    
}
