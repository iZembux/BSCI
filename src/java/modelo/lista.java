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
public class lista {

    private int idunidad;
    private int idMarca;
    private int carga;
    private int idModelo;
    private int modelo;
    private String marcaString;
    private String modeloString;
    private String cpos;
    private String version;
    private String marca;
    private double precios;
    private double bonificacion;
    private double spdc;
    private double segurocontabilidad;
    private double tracomex1;
    private double tracomex2;
    private String usuarioInserta;
    private String fechaInserta;
    private String usuarioModifica;
    private String fechaModifica;
    private int status;
    
    public lista() {
        idunidad = 0;
        modelo = 0;
        cpos = "";
        version = "";
        marca = "";
        precios = 0.00;

    }

    public ArrayList<lista> mostrarlista() {
        ArrayList lista = new ArrayList();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT idunidad, '1' as cargar, modelo, cpos, version, marca, precios, bonificacion, spdc, tracomex1, tracomex2 FROM precios WHERE bonificacion>0";
                      try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    lista objetolista = new lista();
                    objetolista.setIdunidad(rs.getInt("idunidad"));
                    objetolista.setModelo(rs.getInt("modelo"));
                    objetolista.setCarga(rs.getInt("carga"));
                    objetolista.setCpos(rs.getString("cpos"));
                    objetolista.setVersion(rs.getString("version"));
                    objetolista.setMarca(rs.getString("marca"));
                    objetolista.setPrecios(rs.getDouble("precios"));
                    objetolista.setBonificacion(rs.getDouble("bonificacion"));
                    objetolista.setSpdc(rs.getDouble("spdc"));
                    objetolista.setTracomex1(rs.getDouble("tracomex1"));
                    objetolista.setTracomex2(rs.getDouble("tracomex2"));
                    lista.add(objetolista);
                    objetolista = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL");
            return lista;
        }
        return lista;
    }
    
    public ArrayList<lista> mostrarlistaFull() {
        ArrayList lista = new ArrayList();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT idunidad, modelo, cpos, version, marca, precios, bonificacion, spdc, tracomex1, tracomex2 FROM precios";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    lista objetolista = new lista();
                    objetolista.setIdunidad(rs.getInt("idunidad"));
                    objetolista.setModelo(rs.getInt("modelo"));
                    objetolista.setCpos(rs.getString("cpos"));
                    objetolista.setVersion(rs.getString("version"));
                    objetolista.setMarca(rs.getString("marca"));
                    objetolista.setPrecios(rs.getDouble("precios"));
                    objetolista.setBonificacion(rs.getDouble("bonificacion"));
                    objetolista.setSpdc(rs.getDouble("spdc"));
                    objetolista.setTracomex1(rs.getDouble("tracomex1"));
                    objetolista.setTracomex2(rs.getDouble("tracomex2"));
                    lista.add(objetolista);
                    objetolista = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 AL MOSTRAR LISTA DE PRECIOS COMPLETA" + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL ERROR-2 AL MOSTRAR LISTA DE PRECIOS COMPLETA " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL AL MOSTRAR LISTA DE PRECIOS COMPLETA");
            return lista;
        }
        return lista;
    }

    public ArrayList<lista> buscarVersion(int idMarca, int idModelo){
        ArrayList<lista> versiones = new ArrayList<lista>();
        String sql = "";
        ResultSet rs = null;
        Connection con = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();
        con = conmysql.conectar();
        sql = "SELECT uds.version, marca.marca, modelo.modelo FROM unidades uds, marcas marca, modelos modelo WHERE uds.idMarca = ? AND uds.idModelo = ? AND uds.status = 1 AND marca.IdMarca = uds.IdMarca AND modelo.IdModelo = uds.IdModelo";
        try{
            ps = con.prepareStatement(sql);
            ps.setInt(1, idMarca);
            ps.setInt(2, idModelo);
            rs = ps.executeQuery();
            while(rs.next()){
                lista objLista = new lista();
                objLista.setVersion("version");
                objLista.setMarcaString("marca");
                objLista.setModeloString("modelo");
                versiones.add(objLista);
                objLista = null;
            }
        }catch(SQLException e){
            System.out.println("ERROR SQL-1 AL BUSCAR VERSION: " + e.getMessage());
        }catch(Exception ex){
            System.out.println("ERROR SQL-1 AL BUSCAR VERSION: " + ex.getMessage());
        }finally{
            try{
                if(con != null){
                    con.close();
                }
                if(ps != null){
                    ps.close();
                }
                con = null;
                ps = null;
            }catch(Exception ee){
                System.out.println("ERROR AL BUSCAR VERSION " + ee.getMessage());
            }
        }
        return versiones;
    }
    
    public int insertarUnidad(int idMarca, int idModelo, String version, int anio, double precio, double bonificacion, double spdc, double tracomex1, double tracomex2){
        int ok = 0;
        String sql = "";
        Connection con = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();
        
        con = conmysql.conectar();
        sql = "INSERT INTO unidades (idMarca, idModelo, version, anio, cpos, precio, bonificacion, spdc, tracomex1, tracomex2, status)";
        sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
        try{
            ps = con.prepareStatement(sql);
            ps.setInt(1, idMarca);
            ps.setInt(2, idModelo);
            ps.setString(3, version);
            ps.setInt(4, anio);
            ps.setDouble(5, precio);
            ps.setDouble(6, bonificacion);
            ps.setDouble(7, spdc);
            ps.setDouble(8, tracomex1);
            ps.setDouble(9, tracomex2);
            ps.executeQuery();
            con.close();
        }catch(SQLException e){
            System.out.println("ERROR SQL 1 AL INSERTAR UNIDAD " + e.getMessage());
            ok++;
        }catch(Exception ee){
            System.out.println("ERROR SQL 2 AL INSERTAR UNIDAD " + ee.getMessage());
            ok++;
        }finally{
            try{
                if(ps != null){
                    ps.close();
                }
                ps = null;
                con.close();
                con = null;
            }catch(Exception e){
                ok++;
                System.out.println("ERROR 3 AL INSERTAR UNIDAD " + e.getMessage());
            }
        }
        return ok;
    }
    
    public int actulizarPrecios(int idUnidad, double precio, double bonificacion, double spdc, double tracomex1, double tracomex2){
        int ok = 0;
        String sql = "";
        Connection con = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();
        
        con = conmysql.conectar();
        sql = "UPDATE precios SET precios = ?, bonificacion = ?, spdc = ?, tracomex1 = ?, tracomex2 = ? ";
        sql += " WHERE idUnidad = ? ";
        try{
            ps = con.prepareStatement(sql);
            ps.setDouble(1, precio);
            ps.setDouble(2, bonificacion);
            ps.setDouble(3, spdc);
            ps.setDouble(4, tracomex1);
            ps.setDouble(5, tracomex2);
            ps.setInt(6, idUnidad);
            ps.executeQuery();
            con.close();
        }catch(SQLException e){
            System.out.println("ERROR SQL 1 AL ACTUALIZAR PRECIO DE LA UNIDAD " + e.getMessage());
            ok++;
        }catch(Exception ee){
            System.out.println("ERROR SQL 2 AL ACTUALIZAR PRECIO DE LA UNIDAD " + ee.getMessage());
            ok++;
        }finally{
            try{
                if(ps != null){
                    ps.close();
                }
                ps = null;
                con.close();
                con = null;
            }catch(Exception e){
                ok++;
                System.out.println("ERROR 3 AL ACTUALIZAR PRECIO" + e.getMessage());
            }
        }
        return ok;
    }
    
    public int getIdunidad() {
        return idunidad;
    }

    public void setIdunidad(int idunidad) {
        this.idunidad = idunidad;
    }

    public int getModelo() {
        return modelo;
    }

    public void setModelo(int modelo) {
        this.modelo = modelo;
    }

    public String getCpos() {
        return cpos;
    }

    public void setCpos(String cpos) {
        this.cpos = cpos;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrecios() {
        return precios;
    }

    public void setPrecios(double precios) {
        this.precios = precios;
    }

    public double getBonificacion() {
        return bonificacion;
    }

    public void setBonificacion(double bonificacion) {
        this.bonificacion = bonificacion;
    }

    public double getSpdc() {
        return spdc;
    }

    public void setSpdc(double spdc) {
        this.spdc = spdc;
    }

    public double getSegurocontabilidad() {
        return segurocontabilidad;
    }

    public void setSegurocontabilidad(double segurocontabilidad) {
        this.segurocontabilidad = segurocontabilidad;
    }

    public double getTracomex1() {
        return tracomex1;
    }

    public void setTracomex1(double tracomex1) {
        this.tracomex1 = tracomex1;
    }

    public double getTracomex2() {
        return tracomex2;
    }

    public void setTracomex2(double tracomex2) {
        this.tracomex2 = tracomex2;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
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

    public String getMarcaString() {
        return marcaString;
    }

    public void setMarcaString(String marcaString) {
        this.marcaString = marcaString;
    }

    public String getModeloString() {
        return modeloString;
    }

    public void setModeloString(String modeloString) {
        this.modeloString = modeloString;
    }

    public int getCarga() {
        return carga;
    }

    public void setCarga(int carga) {
        this.carga = carga;
    }
}
