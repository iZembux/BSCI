/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import control.conexionMySQL;
import control.conexionMySQLPrecios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ricar_000
 */
public class unidades {

    private int Uni_IdUnidad;
    private int Uni_IdMarca;
    private int Uni_Carga;
    private int Uni_IdModelo;
    private String marcaString;
    private String modeloString;
    private String Uni_Cpos;
    private String Uni_Version;
    private int Uni_Anio;
    private double Uni_Precio;
    private double Uni_Bonificacion;
    private double Uni_Spdc;
    private double Uni_Tracomex1;
    private double Uni_Tracomex2;
    private int Uni_MesPrecio;
    private int Uni_AnioPrecio;
    private String Uni_UsuarioInserta;
    private String Uni_FechaInserta;
    private String Uni_UsuarioModifica;
    private String Uni_FechaModifica;
    private int Uni_Status;

    public ArrayList<unidades> mostrarUnidades(String marcas, int anio, int mesPrecio) {
        ArrayList<unidades> lista = new ArrayList<unidades>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            /* sql = "SELECT idunidad, modelo, cpos, version, marca, precios, bonificacion, spdc, tracomex1, tracomex2 FROM precios WHERE bonificacion>0";*/
            sql = "SELECT Uni_IdUnidad, Uni_Carga, Uni_IdMarca, (SELECT marca FROM marcas WHERE identificaMarca = Uni_IdentificaMarca) as marcaString,"
                    + " Uni_IdModelo, (SELECT modelo FROM modelos WHERE identificaModelo = Uni_IdentificaModelo) as modeloString,"
                    + " Uni_Cpos, Uni_Version, Uni_Anio, Uni_Precio, Uni_Bonificacion, Uni_Spdc, Uni_Tracomex1, Uni_Tracomex2,"
                    + " Uni_MesPrecio, Uni_AnioPrecio, Uni_UsuarioInserta, Uni_FechaInserta, Uni_UsuarioModifica, Uni_FechaModifica, Uni_Status"
                    + " FROM unidades WHERE Uni_Status = 1 AND Uni_IdentificaMarca IN (" + marcas + ") AND Uni_Anio = " + anio + " AND Uni_MesPrecio = " + mesPrecio + " ORDER BY marcaString, modeloString ";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    unidades objetolista = new unidades();
                    objetolista.setUni_IdUnidad(rs.getInt("Uni_IdUnidad"));
                    objetolista.setUni_IdMarca(rs.getInt("Uni_IdMarca"));
                    objetolista.setUni_Carga(rs.getInt("Uni_Carga"));
                    objetolista.setMarcaString(rs.getString("marcaString"));
                    objetolista.setUni_IdModelo(rs.getInt("Uni_IdModelo"));
                    objetolista.setModeloString(rs.getString("modeloString"));
                    objetolista.setUni_Cpos(rs.getString("Uni_Cpos"));
                    objetolista.setUni_Version(rs.getString("Uni_Version"));
                    objetolista.setUni_Anio(rs.getInt("Uni_Anio"));
                    objetolista.setUni_Precio(rs.getDouble("Uni_Precio"));
                    objetolista.setUni_Bonificacion(rs.getDouble("Uni_Bonificacion"));
                    objetolista.setUni_Spdc(rs.getDouble("Uni_Spdc"));
                    objetolista.setUni_Tracomex1(rs.getDouble("Uni_Tracomex1"));
                    objetolista.setUni_Tracomex2(rs.getDouble("Uni_Tracomex2"));
                    objetolista.setUni_MesPrecio(rs.getInt("Uni_MesPrecio"));
                    objetolista.setUni_AnioPrecio(rs.getInt("Uni_AnioPrecio"));
                    objetolista.setUni_UsuarioInserta(rs.getString("Uni_UsuarioInserta"));
                    objetolista.setUni_FechaInserta(rs.getString("Uni_FechaInserta"));
                    objetolista.setUni_UsuarioModifica(rs.getString("Uni_UsuarioModifica"));
                    objetolista.setUni_FechaModifica(rs.getString("Uni_FechaModifica"));
                    objetolista.setUni_Status(rs.getInt("Uni_Status"));
                    lista.add(objetolista);
                    objetolista = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR mostrarUnidades SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL mostrarUnidades ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL mostrarUnidades");
            return lista;
        }
        return lista;
    }
    
    public ArrayList<unidades> mostrarUnidades2(String marcas, int anio, int mesPrecio) {
        ArrayList<unidades> lista = new ArrayList<unidades>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            /* sql = "SELECT idunidad, modelo, cpos, version, marca, precios, bonificacion, spdc, tracomex1, tracomex2 FROM precios WHERE bonificacion>0";*/
            sql = "SELECT Uni_IdUnidad, Uni_Carga, Uni_IdMarca, (SELECT marca FROM marcas WHERE identificaMarca = Uni_IdentificaMarca) as marcaString,"
                    + " Uni_IdModelo, (SELECT modelo FROM modelos WHERE identificaModelo = Uni_IdentificaModelo) as modeloString,"
                    + " Uni_Cpos, Uni_Version, Uni_Anio, Uni_Precio, Uni_Bonificacion, Uni_Spdc, Uni_Tracomex1, Uni_Tracomex2,"
                    + " Uni_MesPrecio, Uni_AnioPrecio, Uni_UsuarioInserta, Uni_FechaInserta, Uni_UsuarioModifica, Uni_FechaModifica, Uni_Status"
                    + " FROM unidades2 WHERE Uni_Status = 1 AND Uni_IdentificaMarca IN (" + marcas + ") AND Uni_Anio = " + anio + " AND Uni_MesPrecio = " + mesPrecio + " ORDER BY marcaString, modeloString ";
            System.out.println("SQL: " + sql);
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    unidades objetolista = new unidades();
                    objetolista.setUni_IdUnidad(rs.getInt("Uni_IdUnidad"));
                    objetolista.setUni_IdMarca(rs.getInt("Uni_IdMarca"));
                    objetolista.setUni_Carga(rs.getInt("Uni_Carga"));
                    objetolista.setMarcaString(rs.getString("marcaString"));
                    objetolista.setUni_IdModelo(rs.getInt("Uni_IdModelo"));
                    objetolista.setModeloString(rs.getString("modeloString"));
                    objetolista.setUni_Cpos(rs.getString("Uni_Cpos"));
                    objetolista.setUni_Version(rs.getString("Uni_Version"));
                    objetolista.setUni_Anio(rs.getInt("Uni_Anio"));
                    objetolista.setUni_Precio(rs.getDouble("Uni_Precio"));
                    objetolista.setUni_Bonificacion(rs.getDouble("Uni_Bonificacion"));
                    objetolista.setUni_Spdc(rs.getDouble("Uni_Spdc"));
                    objetolista.setUni_Tracomex1(rs.getDouble("Uni_Tracomex1"));
                    objetolista.setUni_Tracomex2(rs.getDouble("Uni_Tracomex2"));
                    objetolista.setUni_MesPrecio(rs.getInt("Uni_MesPrecio"));
                    objetolista.setUni_AnioPrecio(rs.getInt("Uni_AnioPrecio"));
                    objetolista.setUni_UsuarioInserta(rs.getString("Uni_UsuarioInserta"));
                    objetolista.setUni_FechaInserta(rs.getString("Uni_FechaInserta"));
                    objetolista.setUni_UsuarioModifica(rs.getString("Uni_UsuarioModifica"));
                    objetolista.setUni_FechaModifica(rs.getString("Uni_FechaModifica"));
                    objetolista.setUni_Status(rs.getInt("Uni_Status"));
                    lista.add(objetolista);
                    objetolista = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR mostrarUnidades SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL mostrarUnidades ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL mostrarUnidades");
            return lista;
        }
        return lista;
    }
    
    public ArrayList<unidades> mostrarAniosUnidades() {
        ArrayList<unidades> lista = new ArrayList<unidades>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            /* sql = "SELECT idunidad, modelo, cpos, version, marca, precios, bonificacion, spdc, tracomex1, tracomex2 FROM precios WHERE bonificacion>0";*/
            sql = "SELECT DISTINCT(Uni_Anio) AS Uni_Anio FROM unidades WHERE Uni_Status = 1";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    unidades objetolista = new unidades();
                    objetolista.setUni_Anio(rs.getInt("Uni_Anio"));
                    lista.add(objetolista);
                    objetolista = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR mostrarAniosUnidades SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL mostrarAniosUnidades ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL mostrarAniosUnidades");
            return lista;
        }
        return lista;
    }
    
    public ArrayList<unidades> mostrarMesesUnidades() {
        ArrayList<unidades> lista = new ArrayList<unidades>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            /* sql = "SELECT idunidad, modelo, cpos, version, marca, precios, bonificacion, spdc, tracomex1, tracomex2 FROM precios WHERE bonificacion>0";*/
            sql = "SELECT DISTINCT(Uni_MesPrecio) AS Uni_Mes FROM unidades WHERE Uni_Status = 1";
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    unidades objetolista = new unidades();
                    objetolista.setUni_MesPrecio(rs.getInt("Uni_Mes"));
                    lista.add(objetolista);
                    objetolista = null;
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR mostrarAniosUnidades SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
                    System.out.println("SQL mostrarAniosUnidades ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            System.out.println("CONECCION FAIL mostrarAniosUnidades");
            return lista;
        }
        return lista;
    }

    public int[] obtenerMesAnioPreciosVigentes() {
        int[] mesAnio = new int[2];
        String sql = "";
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        conexionMySQLPrecios conmysql = new conexionMySQLPrecios();
        con = conmysql.conectar();
        sql = "SELECT Uni_MesPrecio, Uni_AnioPrecio FROM unidades GROUP BY Uni_MesPrecio, Uni_AnioPrecio";
        if (con != null) {
            try {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    mesAnio[0] = rs.getInt("Uni_MesPrecio");
                    mesAnio[1] = rs.getInt("Uni_AnioPrecio");
                }
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR 1 AL obtenerMesAnioPrecioVigentes SQL: " + e.getMessage());
            }catch(Exception ee){
                System.out.println("ERROR 2 AL obtenerMesAnioPrecioVigentes: " + ee.getMessage());
            }finally{
                try{
                    if(ps != null){
                        ps.close();
                    }
                    if(rs != null){
                        rs.close();
                    }
                    if(con != null){
                        con.close();
                    }
                    ps = null;
                    rs = null;
                    con = null;
                }catch(Exception ex){
                    System.out.println("ERROR 3 AL obtenerMesAnioPrecioVigentes: " + ex.getMessage());
                }
            }
        }else{
            System.out.println("CONNECTION FAIL obtener MesAnioPreciosVigentes");
        }
        return mesAnio;
    }
    
    public ArrayList<unidades> obtenerMesAnioPreciosVigentesEnHistorial(int mes, int anio) {
        ArrayList<unidades> mesAnio = new ArrayList<unidades>();
        String sql = "";
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();
        con = conmysql.conectar();
        sql = "SELECT * FROM historialPrecios WHERE HPr_Mes = ? AND HPr_Anio = ?";
        if (con != null) {
            try {
                ps = con.prepareStatement(sql);
                ps.setInt(1, mes);
                ps.setInt(2, anio);
                rs = ps.executeQuery();
                while(rs.next()){
                    unidades objUnidades = new unidades();
                    objUnidades.setUni_IdUnidad(rs.getInt("HPr_IdUnidad"));
                    objUnidades.setUni_IdModelo(rs.getInt("HPr_IdModelo"));
                    objUnidades.setUni_IdMarca(rs.getInt("HPr_IdMarca"));
                    objUnidades.setUni_Cpos(rs.getString("HPr_Cpos"));
                    objUnidades.setUni_Version(rs.getString("HPr_Version"));
                    objUnidades.setUni_Precio(rs.getDouble("HPr_Precio"));
                    objUnidades.setUni_Bonificacion(rs.getDouble("HPr_Bonificacion"));
                    objUnidades.setUni_Spdc(rs.getDouble("HPr_Spdc"));
                    objUnidades.setUni_Tracomex1(rs.getDouble("HPr_Tracomex1"));
                    objUnidades.setUni_Tracomex2(rs.getDouble("HPr_Tracomex2"));
                    objUnidades.setUni_MesPrecio(rs.getInt("HPr_Mes"));
                    objUnidades.setUni_AnioPrecio(rs.getInt("HPr_Anio"));
                    mesAnio.add(objUnidades);
                    objUnidades = null;
                }
                ps.close();
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR 1 AL obtenerMesAnioPrecioVigentes SQL: " + e.getMessage());
            }catch(Exception ee){
                System.out.println("ERROR 2 AL obtenerMesAnioPrecioVigentes: " + ee.getMessage());
            }finally{
                try{
                    if(ps != null){
                        ps.close();
                    }
                    if(rs != null){
                        rs.close();
                    }
                    if(con != null){
                        con.close();
                    }
                    ps = null;
                    rs = null;
                    con = null;
                }catch(Exception ex){
                    System.out.println("ERROR 3 AL obtenerMesAnioPrecioVigentes: " + ex.getMessage());
                }
            }
        }else{
            System.out.println("CONNECTION FAIL obtener MesAnioPreciosVigentes");
        }
        return mesAnio;
    }

    public int insertarUnidad(int idMarca, String identificaMarca, int idModelo, String identificaModelo, String version, int anio, String cpos, double precio, double bonificacion, double spdc, double tracomex1, double tracomex2, int mesPrecio, int anioPrecio, String usuario, String fecha) {
        int ok = 0;
        String sql = "";
        Connection con = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();
        con = conmysql.conectar();
        sql = "INSERT INTO unidades (Uni_IdMarca, Uni_IdentificaMarca, Uni_IdModelo, Uni_IdentificaModelo, Uni_Version, Uni_Anio, Uni_Cpos, Uni_Precio, Uni_Bonificacion, Uni_Spdc, Uni_Tracomex1, Uni_Tracomex2, Uni_MesPrecio, Uni_AnioPrecio, Uni_UsuarioInserta, Uni_FechaInserta, Uni_Status)";
        sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, idMarca);
            ps.setString(2, identificaMarca);
            ps.setInt(3, idModelo);
            ps.setString(4, identificaModelo);
            ps.setString(5, version);
            ps.setInt(6, anio);
            ps.setString(7, cpos);
            ps.setDouble(8, precio);
            ps.setDouble(9, bonificacion);
            ps.setDouble(10, spdc);
            ps.setDouble(11, tracomex1);
            ps.setDouble(12, tracomex2);
            ps.setInt(13, mesPrecio);
            ps.setInt(14, anioPrecio);
            ps.setString(15, usuario);
            ps.setString(16, fecha);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println("ERROR SQL 1 AL INSERTAR UNIDAD " + e.getMessage());
            ok++;
        } catch (Exception ee) {
            System.out.println("ERROR SQL 2 AL INSERTAR UNIDAD " + ee.getMessage());
            ok++;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
                con = null;
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 3 AL INSERTAR UNIDAD " + e.getMessage());
            }
        }
        return ok;
    }

    public int insertarUnidadHistorico(int idUnidad, int idMarca, int idModelo, String cpos, String version, double precio, double bonificacion, double spdc, double tracomex1, double tracomex2, int mes, int anio, String usuario, String fecha) {
        //                                   1            2             3             4           5                    6              7               8               9               10      11            12            13
        int ok = 0;
        String sql = "";
        Connection con = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();
        con = conmysql.conectar();
        //                                         1             2            3           4         5               6            7           8              9          10         11            12                     13
        sql = "INSERT INTO historialPrecios (Hpr_IdUnidad, Hpr_IdMarca, Hpr_IdModelo, Hpr_Cpos, Hpr_Version, Hpr_Precio, Hpr_Bonificacion, Hpr_Spdc, Hpr_Tracomex1, Hpr_Tracomex2, Hpr_Mes, Hpr_Anio, Hpr_UsuarioInserta, Hpr_FechaInserta)";
        sql += " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //               1  2  3  4  5  6  7  8  9  10 11 12 13 14
        int i = 0;
        System.out.println("Generando Historial: 1[" + idUnidad + "] 2[" + idMarca + "] 3[" + idModelo + "] 4[" + cpos + "] 5[" + precio + "] 6[" + bonificacion + "] 7[" +spdc + "] 8[" + tracomex1+ "] 9[" + tracomex2+ "] 10[" + mes+ "] 11[" + anio+ "] 12[" + usuario+ "] 13[" + fecha + "]");
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUnidad);
            ps.setInt(2, idMarca);
            ps.setInt(3, idModelo);
            ps.setString(4, cpos);
            ps.setString(5, version);
            ps.setDouble(6, precio);
            ps.setDouble(7, bonificacion);
            ps.setDouble(8, spdc);
            ps.setDouble(9, tracomex1);
            ps.setDouble(10, tracomex2);
            ps.setInt(11, mes);
            ps.setInt(12, anio);
            ps.setString(13, usuario);
            ps.setString(14, fecha);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println("ERROR SQL 1 AL INSERTAR UNIDAD EN HISTORICO " + e.getMessage());
            ok++;
        } catch (Exception ee) {
            System.out.println("ERROR SQL 2 AL INSERTAR UNIDAD EN HISTORICO " + ee.getMessage());
            ok++;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
                con = null;
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 3 AL INSERTAR UNIDAD EN HISTORICO " + e.getMessage());
            }
        }
        return ok;
    }

    public int actulizarPrecios(int idUnidad, double precio, double bonificacion, double spdc, double tracomex1, double tracomex2, String usuario, String fecha) {
        int ok = 0;
        String sql = "";
        Connection con = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();

        con = conmysql.conectar();
        sql = "UPDATE unidades SET Uni_Precio = ?, Uni_Bonificacion = ?, Uni_Spdc = ?, Uni_Tracomex1 = ?, Uni_Tracomex2 = ?, Uni_UsuarioModifica = ?, Uni_FechaModifica = ? ";
        sql += " WHERE Uni_IdUnidad = ? ";
        try {
            ps = con.prepareStatement(sql);
            ps.setDouble(1, precio);
            ps.setDouble(2, bonificacion);
            ps.setDouble(3, spdc);
            ps.setDouble(4, tracomex1);
            ps.setDouble(5, tracomex2);
            ps.setString(6, usuario);
            ps.setString(7, fecha);
            ps.setInt(8, idUnidad);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println("ERROR SQL 1 AL ACTUALIZAR PRECIO DE LA UNIDAD " + e.getMessage());
            ok++;
        } catch (Exception ee) {
            System.out.println("ERROR SQL 2 AL ACTUALIZAR PRECIO DE LA UNIDAD " + ee.getMessage());
            ok++;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
                con = null;
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 3 AL ACTUALIZAR PRECIO" + e.getMessage());
            }
        }
        return ok;
    }

    public ArrayList<unidades> buscarVersion(String identificaMarca, String identificaModelo, String version) {
        ArrayList<unidades> versiones = new ArrayList<unidades>();
        String sql = "";
        ResultSet rs = null;
        Connection con = null;
        PreparedStatement ps = null;
        conexionMySQL conmysql = new conexionMySQL();
        con = conmysql.conectar();
        sql = "SELECT uds.Uni_Version, marca.marca, modelo.modelo FROM unidades uds, marcas marca, modelos modelo WHERE uds.Uni_IdentificaMarca = '?' AND uds.Uni_IdentificaModelo = '?' AND uds.Uni_Version = ? AND uds.Uni_Status = 1 AND marca.IdentificaMarca = uds.Uni_IdentificaMarca AND modelo.IdentificaModelo = uds.Uni_IdentificaModelo";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, identificaMarca);
            ps.setString(2, identificaModelo);
            ps.setString(3, version);
            rs = ps.executeQuery();
            while (rs.next()) {
                unidades objLista = new unidades();
                objLista.setUni_Version("Uni_Version");
                objLista.setMarcaString("marca");
                objLista.setModeloString("modelo");
                versiones.add(objLista);
                objLista = null;
            }
        } catch (SQLException e) {
            System.out.println("ERROR SQL-1 AL BUSCAR VERSION: " + e.getMessage());
        } catch (Exception ex) {
            System.out.println("ERROR SQL-1 AL BUSCAR VERSION: " + ex.getMessage());
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (ps != null) {
                    ps.close();
                }
                con = null;
                ps = null;
            } catch (Exception ee) {
                System.out.println("ERROR AL BUSCAR VERSION " + ee.getMessage());
            }
        }
        return versiones;
    }

    public int getUni_IdUnidad() {
        return Uni_IdUnidad;
    }

    public void setUni_IdUnidad(int Uni_IdUnidad) {
        this.Uni_IdUnidad = Uni_IdUnidad;
    }

    public int getUni_IdMarca() {
        return Uni_IdMarca;
    }

    public void setUni_IdMarca(int Uni_IdMarca) {
        this.Uni_IdMarca = Uni_IdMarca;
    }

    public int getUni_IdModelo() {
        return Uni_IdModelo;
    }

    public void setUni_IdModelo(int Uni_IdModelo) {
        this.Uni_IdModelo = Uni_IdModelo;
    }

    public String getUni_Cpos() {
        return Uni_Cpos;
    }

    public void setUni_Cpos(String Uni_Cpos) {
        this.Uni_Cpos = Uni_Cpos;
    }

    public String getUni_Version() {
        return Uni_Version;
    }

    public void setUni_Version(String Uni_Version) {
        this.Uni_Version = Uni_Version;
    }

    public int getUni_Anio() {
        return Uni_Anio;
    }

    public void setUni_Anio(int Uni_Anio) {
        this.Uni_Anio = Uni_Anio;
    }

    public double getUni_Precio() {
        return Uni_Precio;
    }

    public void setUni_Precio(double Uni_Precio) {
        this.Uni_Precio = Uni_Precio;
    }

    public double getUni_Bonificacion() {
        return Uni_Bonificacion;
    }

    public void setUni_Bonificacion(double Uni_Bonificacion) {
        this.Uni_Bonificacion = Uni_Bonificacion;
    }

    public double getUni_Spdc() {
        return Uni_Spdc;
    }

    public void setUni_Spdc(double Uni_Spdc) {
        this.Uni_Spdc = Uni_Spdc;
    }

    public double getUni_Tracomex1() {
        return Uni_Tracomex1;
    }

    public void setUni_Tracomex1(double Uni_Tracomex1) {
        this.Uni_Tracomex1 = Uni_Tracomex1;
    }

    public double getUni_Tracomex2() {
        return Uni_Tracomex2;
    }

    public void setUni_Tracomex2(double Uni_Tracomex2) {
        this.Uni_Tracomex2 = Uni_Tracomex2;
    }

    public int getUni_MesPrecio() {
        return Uni_MesPrecio;
    }

    public void setUni_MesPrecio(int Uni_MesPrecio) {
        this.Uni_MesPrecio = Uni_MesPrecio;
    }

    public int getUni_AnioPrecio() {
        return Uni_AnioPrecio;
    }

    public void setUni_AnioPrecio(int Uni_AnioPrecio) {
        this.Uni_AnioPrecio = Uni_AnioPrecio;
    }

    public String getUni_UsuarioInserta() {
        return Uni_UsuarioInserta;
    }

    public void setUni_UsuarioInserta(String Uni_UsuarioInserta) {
        this.Uni_UsuarioInserta = Uni_UsuarioInserta;
    }

    public String getUni_FechaInserta() {
        return Uni_FechaInserta;
    }

    public void setUni_FechaInserta(String Uni_FechaInserta) {
        this.Uni_FechaInserta = Uni_FechaInserta;
    }

    public String getUni_UsuarioModifica() {
        return Uni_UsuarioModifica;
    }

    public void setUni_UsuarioModifica(String Uni_UsuarioModifica) {
        this.Uni_UsuarioModifica = Uni_UsuarioModifica;
    }

    public String getUni_FechaModifica() {
        return Uni_FechaModifica;
    }

    public void setUni_FechaModifica(String Uni_FechaModifica) {
        this.Uni_FechaModifica = Uni_FechaModifica;
    }

    public int getUni_Status() {
        return Uni_Status;
    }

    public void setUni_Status(int Uni_Status) {
        this.Uni_Status = Uni_Status;
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

    public int getUni_Carga() {
        return Uni_Carga;
    }

    public void setUni_Carga(int Uni_Carga) {
        this.Uni_Carga = Uni_Carga;
    }

}
