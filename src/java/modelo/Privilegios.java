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
 * @author Sistemas 2013
 */
public class Privilegios {
    private int idPermiso;
    private String usuario;
    private String descripcion;
    private String vista;
    private int status;
    private String unidadNegocio;
    
    public Privilegios(){
    idPermiso=0;
    usuario="";
    descripcion="";
    vista="";
    status=0;
    unidadNegocio="";
    
    }
    
    public ArrayList<Privilegios> usuariosPrivilegios(String usuario){
    ArrayList<Privilegios> ListaUsers = new ArrayList<>();
     String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
           
          
            sql = "SELECT permisos.usuario, permisos.empresa, permisos.vista FROM permisos WHERE permisos.usuario ='"+usuario+"'";
            
            
   
            try {
                ps = con.prepareStatement(sql);
                
                rs = ps.executeQuery();
                while (rs.next()) {
                    
                    Privilegios objPrivilegios = new Privilegios();
                   
                    objPrivilegios.setUsuario(rs.getString("usuario"));
                    
                    objPrivilegios.setVista(rs.getString("vista"));
                    objPrivilegios.setUnidadNegocio(rs.getString("empresa"));
                   
                    ListaUsers.add(objPrivilegios);
                    
                    objPrivilegios = null;
                }
                //System.out.println("QUERY: " + sql);
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 " + e.getSQLState() + ": " + e.getMessage());
               
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
                    System.out.println("SQL ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    
                }
            }
        } else {
            System.out.println("CONECCION FAIL");
            return ListaUsers;
        }
        
    return ListaUsers;
    }
    
    public ArrayList<Privilegios> validarPrivilegios(String usuario, String unidadNegocio){
        ArrayList <Privilegios> listaPrivilegios = new ArrayList<>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            
            sql = "SELECT permisos.id_permiso, permisos.usuario, permisos.vista, permisos.empresa "
                    + "FROM permisos WHERE ((permisos.usuario =?) AND (permisos.empresa =?))";
            
            
   
            try {
                ps = con.prepareStatement(sql);
                ps.setString(1, usuario);
                ps.setString(2, unidadNegocio);
                rs = ps.executeQuery();
                while (rs.next()) {
                    
                    Privilegios objPrivilegios = new Privilegios();
                    objPrivilegios.setIdPermiso(rs.getInt("id_permiso"));
                    objPrivilegios.setUsuario(rs.getString("usuario"));
                    //objPrivilegios.setDescripcion(rs.getString("descripcion"));
                    objPrivilegios.setVista(rs.getString("vista"));
                    objPrivilegios.setUnidadNegocio(rs.getString("empresa"));
                   // objUsuario.setUsu_IdUsuario(rs.getInt("id_usu"));
                    listaPrivilegios.add(objPrivilegios);
                    
                    objPrivilegios = null;
                }
                //System.out.println("QUERY: " + sql);
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 " + e.getSQLState() + ": " + e.getMessage());
               
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
                    System.out.println("SQL ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    
                }
            }
        } else {
            System.out.println("CONECCION FAIL");
            return listaPrivilegios;
        }
        
        
        return listaPrivilegios;
    }

    
    public ArrayList<Privilegios> obtenerEmpresas(String usuario){
        System.out.println("");
        ArrayList <Privilegios> listaPrivilegios = new ArrayList<>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            
            sql = "SELECT permisos.id_permiso, permisos.usuario, permisos.vista, permisos.empresa FROM permisos " +
            "WHERE ((permisos.usuario ='"+usuario+"') AND (vista='homeDireccionGeneral.jsp' ))group by permisos.empresa";
            System.out.println("SQL Obtener empresas :"+sql);
            try {
                ps = con.prepareStatement(sql);                
                rs = ps.executeQuery();
                while (rs.next()) {
                    
                    Privilegios objPrivilegios = new Privilegios();
                    objPrivilegios.setUnidadNegocio(rs.getString("empresa"));
                    listaPrivilegios.add(objPrivilegios);
                    
                    objPrivilegios = null;
                }
                //System.out.println("QUERY: " + sql);
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 " + e.getSQLState() + ": " + e.getMessage());
               
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
                    System.out.println("SQL ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    
                }
            }
        } else {
            System.out.println("CONECCION FAIL");
            return listaPrivilegios;
        }
        
        
        return listaPrivilegios;
    }
    
    
    
    
    public int getIdPermiso() {
        return idPermiso;
    }

    public void setIdPermiso(int idPermiso) {
        this.idPermiso = idPermiso;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getVista() {
        return vista;
    }

    public void setVista(String vista) {
        this.vista = vista;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUnidadNegocio() {
        return unidadNegocio;
    }

    public void setUnidadNegocio(String unidadNegocio) {
        this.unidadNegocio = unidadNegocio;
    }
}
