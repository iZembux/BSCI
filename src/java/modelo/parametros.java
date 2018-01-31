/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import control.conexionMySQL;
import control.conexionMySQLPrecios;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
/**
 *
 * @author RKMaya
 */
public class parametros {
    private int Par_IdParametro;
    private String Par_Modulo;
    private String Par_IdentificaParametro;
    private String Par_TipoParametro;
    private String Par_Descripcion1;
    private String Par_Descripcion2;
    private double Par_Valor1;
    private double Par_Valor2;
    private int Par_Status;
    private String Par_UsuarioInserta;
    private String Par_FechaInserta;
    private String Par_UsuarioModifica;
    private String Par_FechaModifica;           
    
    public ArrayList<parametros> consultarParametros(String sql){
        ArrayList<parametros> Lista = new ArrayList<parametros>();
        //String sql = "";
        int error = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        conexionMySQL conection = new conexionMySQL();
        con = conection.conectar();
        System.out.println("SQL PARAMETRO: " + sql);
        if(con != null){
            try{
                //sql = "SELECT idParametro, parametro FROM parametros WHERE modulo like 'diasFestivos' AND parametro >= '" + fechaInicio + "' AND parametro <= '" + fechaFin + "' AND status = 1 ORDER BY parametro";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    parametros objParametro = new parametros();
                    objParametro.setPar_IdParametro(rs.getInt("Par_IdParametro"));
                    objParametro.setPar_Modulo(rs.getString("Par_Modulo"));
                    objParametro.setPar_TipoParametro(rs.getString("Par_TipoParametro"));
                    objParametro.setPar_Descripcion1(rs.getString("Par_Descripcion1"));
                    objParametro.setPar_Descripcion2(rs.getString("Par_Descripcion2"));
                    objParametro.setPar_Valor1(rs.getDouble("Par_Valor1"));
                    objParametro.setPar_Valor2(rs.getDouble("Par_Valor2"));
                    Lista.add(objParametro);
                    objParametro = null;
                }
                con.close();
            }catch(SQLException e){
                System.out.println("ERROR AL CONSULTAR PARAMETRO SQL-1 " + e.getMessage());
                error++;
            }finally{
                try{
                    if(ps != null)
                        ps.close();
                    if(rs != null)
                        rs.close();
                    ps = null;
                    rs = null;
                    con.close();
                }catch(SQLException e){
                    System.out.println("ERROR AL CONSULTAR PARAMETRO SQL-2 " + e.getMessage());
                    error++;
                }
            }
        }else{
            return Lista;
        }
        return Lista;
    }
    
    public ArrayList<parametros> consultarParametros(){
        ArrayList<parametros> Lista = new ArrayList<parametros>();
        String sql = "";
        int error = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        conexionMySQLPrecios conection = new conexionMySQLPrecios();
        con = conection.conectar();
        if(con != null){
            try{
                sql = "SELECT * FROM parametros WHERE Par_Status = 1 ORDER BY Par_IdParametro";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    parametros objParametro = new parametros();
                    objParametro.setPar_IdParametro(rs.getInt("Par_IdParametro"));
                    objParametro.setPar_IdentificaParametro(rs.getString("Par_IdentificaParametro"));
                    objParametro.setPar_Descripcion1(rs.getString("Par_Descripcion1"));
                    objParametro.setPar_Descripcion2(rs.getString("Par_Descripcion2"));
                    objParametro.setPar_Valor1(rs.getDouble("Par_Valor1"));
                    objParametro.setPar_Valor2(rs.getDouble("Par_Valor2"));
                    Lista.add(objParametro);
                    objParametro = null;
                }
                con.close();
            }catch(SQLException e){
                System.out.println("ERROR AL CONSULTAR PARAMETRO SQL-1 " + e.getMessage());
                error++;
            }finally{
                try{
                    if(ps != null)
                        ps.close();
                    if(rs != null)
                        rs.close();
                    ps = null;
                    rs = null;
                    con.close();
                }catch(SQLException e){
                    System.out.println("ERROR AL CONSULTAR PARAMETRO SQL-2 " + e.getMessage());
                    error++;
                }
            }
        }else{
            return Lista;
        }
        return Lista;
    }
    
    public double consultarConsecutivoIndicador(){
        double consecutivo = 0.0;
        String sql = "";
        int error = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        conexionMySQL conection = new conexionMySQL();
        con = conection.conectar();
        if(con != null){
            try{
                sql = "SELECT (par_valor1+1) as par_valor1 FROM `parametros` WHERE Par_Identifica = 'CONSEIND' AND Par_Modulo = 'Balance' AND Par_TipoParametro = 'General' AND Par_Status = 1";
                System.out.println("QUERY CONSECUTIVO: " + sql);
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    consecutivo = rs.getDouble("Par_Valor1");
                }
                con.close();
            }catch(SQLException e){
                System.out.println("ERROR AL CONSULTAR CONSECUTIVO SQL-1 " + e.getMessage());
                error++;
            }finally{
                try{
                    if(ps != null)
                        ps.close();
                    if(rs != null)
                        rs.close();
                    ps = null;
                    rs = null;
                    con.close();
                }catch(SQLException e){
                    System.out.println("ERROR AL CONSULTAR CONSECUTIVO SQL-2 " + e.getMessage());
                    error++;
                }
            }
        }else{
            return consecutivo;
        }
        return consecutivo;
    }
    
    public int insertarParametro(String modulo, String tipoParametro, String descripcion1, String descripcion2, double valor1, double valor2, String usuario, String fecha) {
        //System.out.println("Insertar Parametro");
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        sql = "INSERT INTO parametros(Par_Modulo, Par_TipoParametro, Par_Descripcion1, Par_Descripcion2, Par_Valor1, Par_Valor2, Par_UsuarioInserta, Par_FechaInserta, Par_Status) ";
        sql += "VALUES(?,?,?,?,?,?,?,?,1)";
        try {
            System.out.println("SQL: " + sql);
            ps = con.prepareStatement(sql);
            ps.setString(1, modulo);
            ps.setString(2, tipoParametro);
            ps.setString(3, descripcion1);
            ps.setString(4, descripcion2);
            ps.setDouble(5, valor1);
            ps.setDouble(6, valor2);
            ps.setString(8, usuario);
            ps.setString(9, fecha);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ee) {
            System.out.println("Error 1 al GUARDAR PARAMETRO: " + ee.toString() + " : " + ee.getMessage() + " : " + ee.getSQLState());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al GUARDAR PARAMETRO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al GUARDAR PARAMETRO: " + e.toString() + " : " + e.getMessage() + " : " + e.getLocalizedMessage());
            }

        }
        return ok;
    }//fin metodo insertar Parametro
    
    public int actualizarParametro(int idParametro, String descripcion1, String descripcion2, double valor1, double valor2, String usuario, String fecha) {
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
        sql = "UPDATE parametros SET Par_Descripcion1 = ?, Par_Descripcion2 = ?, Par_Valor1 = ?, Par_Valor2 = ?, Par_UsuarioModifica = ?, Par_FechaModifica = ? WHERE Par_IdParametro = ?";
        try {
            System.out.println("SQL: " + sql);
            ps = con.prepareStatement(sql);
            ps.setString(1, descripcion1);
            ps.setString(2, descripcion2);
            ps.setDouble(3, valor1);
            ps.setDouble(4, valor2);
            ps.setString(5, usuario);
            ps.setString(6, fecha);
            ps.setInt(7, idParametro);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ee) {
            System.out.println("Error 1 al ACTUALIZAR PARAMETRO: " + ee.toString() + " : " + ee.getMessage() + " : " + ee.getSQLState());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al ACTUALIZAR PARAMETRO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al ACTUALIZAR PARAMETRO: " + e.toString() + " : " + e.getMessage() + " : " + e.getLocalizedMessage());
            }

        }
        return ok;
    }//fin metodo actulizatParametros
    
    public int actualizarConsecutivoIndicador() {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        sql = "UPDATE parametros SET Par_Valor1 = (Par_Valor1+1) WHERE Par_Identifica = 'CONSEIND' AND Par_Modulo = 'Balance' AND  Par_TipoParametro = 'General' AND Par_Descripcion = 'Consecutivo' AND Par_Status = 1";
        try {
            System.out.println("SQL: " + sql);
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ee) {
            System.out.println("Error 1 al ACTUALIZAR CONSECUTIVO: " + ee.toString() + " : " + ee.getMessage() + " : " + ee.getSQLState());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("Error 2 al ACTUALIZAR CONSECUTIVO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("Error 3 al ACTUALIZAR CONSECUTIVO: " + e.toString() + " : " + e.getMessage() + " : " + e.getLocalizedMessage());
            }

        }
        return ok;
    }//fin metodo actulizatParametros

    public int getPar_IdParametro() {
        return Par_IdParametro;
    }

    public void setPar_IdParametro(int Par_IdParametro) {
        this.Par_IdParametro = Par_IdParametro;
    }

    public String getPar_Modulo() {
        return Par_Modulo;
    }

    public void setPar_Modulo(String Par_Modulo) {
        this.Par_Modulo = Par_Modulo;
    }

    public String getPar_TipoParametro() {
        return Par_TipoParametro;
    }

    public void setPar_TipoParametro(String Par_TipoParametro) {
        this.Par_TipoParametro = Par_TipoParametro;
    }
    
    public String getPar_Descripcion1() {
        return Par_Descripcion1;
    }

    public void setPar_Descripcion1(String Par_Descripcion1) {
        this.Par_Descripcion1 = Par_Descripcion1;
    }
    
    public String getPar_Descripcion2() {
        return Par_Descripcion2;
    }

    public void setPar_Descripcion2(String Par_Descripcion2) {
        this.Par_Descripcion2 = Par_Descripcion2;
    }

    public double getPar_Valor1() {
        return Par_Valor1;
    }

    public void setPar_Valor1(double Par_Valor1) {
        this.Par_Valor1 = Par_Valor1;
    }

    public double getPar_Valor2() {
        return Par_Valor2;
    }

    public void setPar_Valor2(double Par_Valor2) {
        this.Par_Valor2 = Par_Valor2;
    }

    public int getPar_Status() {
        return Par_Status;
    }

    public void setPar_Status(int Par_Status) {
        this.Par_Status = Par_Status;
    }

    public String getPar_UsuarioInserta() {
        return Par_UsuarioInserta;
    }

    public void setPar_UsuarioInserta(String Par_UsuarioInserta) {
        this.Par_UsuarioInserta = Par_UsuarioInserta;
    }

    public String getPar_FechaInserta() {
        return Par_FechaInserta;
    }

    public void setPar_FechaInserta(String Par_FechaInserta) {
        this.Par_FechaInserta = Par_FechaInserta;
    }

    public String getPar_UsuarioModifica() {
        return Par_UsuarioModifica;
    }

    public void setPar_UsuarioModifica(String Par_UsuarioModifica) {
        this.Par_UsuarioModifica = Par_UsuarioModifica;
    }

    public String getPar_FechaModifica() {
        return Par_FechaModifica;
    }

    public void setPar_FechaModifica(String Par_FechaModifica) {
        this.Par_FechaModifica = Par_FechaModifica;
    }

    public String getPar_IdentificaParametro() {
        return Par_IdentificaParametro;
    }

    public void setPar_IdentificaParametro(String Par_IdentificaParametro) {
        this.Par_IdentificaParametro = Par_IdentificaParametro;
    }
    
}
