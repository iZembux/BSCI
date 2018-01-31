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
 * @author ricar_000
 */
public class modelos {
    private int idModelo;
    private int idMarca;
    private String identificaMarca;
    private String modelo;
    private String identificaModelo;
    private String usuarioInserta;
    private String fechaInserta;
    private String usuarioModifica;
    private String fechaModifica;
    private int status;

        public ArrayList<modelos> mostrarModelos(String identificaMarca) {
        ArrayList<modelos> lista = new ArrayList<modelos>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT idModelo, identificaModelo, idMarca, identificaMarca, modelo, usuarioInserta, fechaInserta, usuarioModifica, fechaModifica, status FROM modelos WHERE identificaMarca = ? AND status = 1";
            try {
                ps = con.prepareStatement(sql);
                ps.setString(1, identificaMarca);
                rs = ps.executeQuery();
                while (rs.next()) {
                    modelos objModelo = new modelos();
                    objModelo.setIdModelo(rs.getInt("idModelo"));
                    objModelo.setIdentificaModelo(rs.getString("identificaModelo"));
                    objModelo.setIdMarca(rs.getInt("idMarca"));
                    objModelo.setIdentificaMarca(rs.getString("identificaMarca"));
                    objModelo.setIdMarca(rs.getInt("idMarca"));
                    objModelo.setModelo(rs.getString("modelo"));
                    objModelo.setUsuarioInserta(rs.getString("usuarioInserta"));
                    objModelo.setFechaInserta(rs.getString("fechaInserta"));
                    objModelo.setUsuarioModifica(rs.getString("usuarioModifica"));
                    objModelo.setFechaModifica(rs.getString("fechaModifica"));
                    objModelo.setStatus(rs.getInt("status"));
                    lista.add(objModelo);
                    objModelo = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 AL OBTENER MODELOS " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("ERROR SQL-2 AL OBTENER MODELOS " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL OBTENER MODELOS");
            return lista;
        }
        return lista;
    }
    
    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getUsuarioInserta() {
        return usuarioInserta;
    }

    public void setUsuarioInserta(String usuarioInserta) {
        this.usuarioInserta = usuarioInserta;
    }

    public String getFechaInserta() {
        return fechaInserta;
    }

    public void setFechaInserta(String fechaInserta) {
        this.fechaInserta = fechaInserta;
    }

    public String getUsuarioModifica() {
        return usuarioModifica;
    }

    public void setUsuarioModifica(String usuarioModifica) {
        this.usuarioModifica = usuarioModifica;
    }

    public String getFechaModifica() {
        return fechaModifica;
    }

    public void setFechaModifica(String fechaModifica) {
        this.fechaModifica = fechaModifica;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getIdentificaMarca() {
        return identificaMarca;
    }

    public void setIdentificaMarca(String identificaMarca) {
        this.identificaMarca = identificaMarca;
    }

    public String getIdentificaModelo() {
        return identificaModelo;
    }

    public void setIdentificaModelo(String identificaModelo) {
        this.identificaModelo = identificaModelo;
    }
    
    
}
