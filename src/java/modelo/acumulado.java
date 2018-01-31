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
public class acumulado {
      
     public ArrayList<acumulado> calcularCumAcumulado() {
        ArrayList<acumulado> consulta = new ArrayList<acumulado>();
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
                    acumulado objetoAcumulado = new acumulado();
//                    objetoBalance.setIdIndicador(rs.getInt("id_incurrido"));
//                    objetoBalance.setAnio(rs.getInt("anio"));
//                    objetoBalance.setMes(rs.getInt("mes"));
//                    objetoBalance.setObjAnual(rs.getDouble("objanual"));
//                    objetoBalance.setObjCuatrimestre(rs.getDouble("objcuatrimestre"));
//                    objetoBalance.setIncCuatrimestre(rs.getDouble("inccuatrimestre"));
//                    objetoBalance.setCumCuatrimestre(rs.getDouble("cumcuatrimestre"));
//                    objetoBalance.setObjAcumulado(rs.getDouble("objacumulado"));
//                    objetoBalance.setIncAcumulado(rs.getDouble("incacumulado"));
//                    objetoBalance.setCumAcumulado(rs.getDouble("cumacumulado"));
//                    objetoBalance.setPuntosObtenidos(rs.getDouble("puntosobtenidos"));
//                    objetoBalance.setPuntosOptimos(rs.getDouble("puntosoptimos"));
                   
                    consulta.add(objetoAcumulado);
                    objetoAcumulado = null;
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
    
}
