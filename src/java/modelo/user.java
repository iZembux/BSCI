/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrador
 */
public class user {
    
    public int consultausuarioint(String parametro, String usuario){
        double objetivo_mes = 0;
        int param=0;
        try {
            Connection conexion = null;
            Statement s;
            ResultSet rs;
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuariosbi", "root", "stmsc0nt");
            s = conexion.createStatement();
            String sql = "";
                sql = "SELECT "+parametro+" FROM userbi where usuario='"+usuario+"'";

            rs = s.executeQuery(sql);
            while (rs.next()) {
            param=rs.getInt(parametro);
            }
            conexion.close();
            rs.close();
        } catch (SQLException ex) {
           // Logger.getLogger(notaref.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return param;
    }    
    
    public String consultausuariostring(String parametro, String usuario){
        double objetivo_mes = 0;
        String param="";
        try {
            Connection conexion = null;
            Statement s;
            ResultSet rs;
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuariosbi", "root", "stmsc0nt");
            s = conexion.createStatement();
            String sql = "";
                sql = "SELECT "+parametro+" FROM userbi where usuario='"+usuario+"'";

            rs = s.executeQuery(sql);
            while (rs.next()) {
                param=rs.getString(parametro);  
            }
            conexion.close();
            rs.close();
        } catch (SQLException ex) {
           // Logger.getLogger(notaref.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return param;
    }
}
