/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import control.conexionMySQL;
/**
 *
 * @author RKMaya
 */
public class usuarios {
  private int Usu_IdUsuario;
  private String Usu_Sucursal;
  private String Usu_Usuario;
  private String Usu_Password;
  private String Usu_TipoUsuario;
  private String Usu_Sistema;
  private String Empleado;
  private int Usu_Intentos;
  private int Usu_Status;
  private int Per_IdPersona;
  private String Usu_Acceso;
  
  public ArrayList<usuarios> validarUsuario(String usuario) {
        ArrayList<usuarios> Lista = new ArrayList<usuarios>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM usuarios WHERE Usu_Usuario=? AND Usu_Status=1 ";
            try {
                ps = con.prepareStatement(sql);
                ps.setString(1, usuario);
                rs = ps.executeQuery();
                while (rs.next()) {
                    usuarios objUsuario = new usuarios();
                    objUsuario.setUsu_IdUsuario(rs.getInt("Usu_IdUsuario"));
                    objUsuario.setUsu_Sucursal(rs.getString("Usu_Sucursal"));
                    objUsuario.setUsu_Usuario(rs.getString("Usu_Usuario"));
                    objUsuario.setUsu_Password(rs.getString("Usu_Password"));
                    objUsuario.setUsu_TipoUsuario(rs.getString("Usu_TipoUsuario"));
                    objUsuario.setUsu_Sistema(rs.getString("Usu_Sistema"));
                    objUsuario.setUsu_Intentos(rs.getInt("Usu_Intentos"));
                    //objUsuario.setPer_IdPersona(rs.getInt("Per_IdPersona"));
                    objUsuario.setUsu_Status(rs.getInt("Usu_Status"));
                    Lista.add(objUsuario);
                    objUsuario = null;
                }
                //System.out.println("QUERY: " + sql);
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
            return Lista;
        }
        return Lista;
    }

  public ArrayList<usuarios> buscarUsuario(int IdPersona) {
        ArrayList<usuarios> Lista = new ArrayList<usuarios>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM usuarios WHERE Per_IdPersona = ? AND Usu_Status=1 ";
            try {
                ps = con.prepareStatement(sql);
                ps.setInt(1, IdPersona);
                rs = ps.executeQuery();
                while (rs.next()) {
                    usuarios objUsuario = new usuarios();
                    objUsuario.setUsu_IdUsuario(rs.getInt("Usu_IdUsuario"));
                    objUsuario.setUsu_Sucursal(rs.getString("Usu_Sucursal"));
                    objUsuario.setUsu_Usuario(rs.getString("Usu_Usuario"));
                    objUsuario.setUsu_Password(rs.getString("Usu_Password"));
                    objUsuario.setUsu_TipoUsuario(rs.getString("Usu_TipoUsuario"));
                    objUsuario.setUsu_Sistema(rs.getString("Usu_Sistema"));
                    objUsuario.setUsu_Intentos(rs.getInt("Usu_Intentos"));
                    objUsuario.setUsu_Status(rs.getInt("Usu_Status"));
                    Lista.add(objUsuario);
                    objUsuario = null;
                }
                //System.out.println("QUERY: " + sql);
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
            return Lista;
        }
        return Lista;
    }

   public ArrayList<usuarios> buscarUsuarios() {
        ArrayList<usuarios> Lista = new ArrayList<usuarios>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement st = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = " SELECT Usu_IdUsuario, Usu_Usuario, Usu_TipoUsuario, Usu_Acceso, Usu_Status "
                    + "FROM usuarios usuario WHERE Usu_Status = 1 ";
            try {
                st = con.prepareStatement(sql);
                rs = st.executeQuery();
                while (rs.next()) {
                    usuarios objUsuario = new usuarios();
                    objUsuario.setUsu_IdUsuario(rs.getInt("Usu_IdUsuario"));
                    objUsuario.setUsu_Usuario(rs.getString("Usu_Usuario"));
                    objUsuario.setUsu_TipoUsuario(rs.getString("Usu_TipoUsuario"));
                    objUsuario.setUsu_Acceso(rs.getString("Usu_Acceso"));
                    objUsuario.setUsu_Status(rs.getInt("Usu_Status"));
                    Lista.add(objUsuario);
                    objUsuario = null;
                }
                //System.out.println("QUERY: " + sql);
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 " + e.getSQLState() + ": " + e.getMessage());
                Error++;
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                    st = null;
                    rs = null;
                    con.close();
                } catch (SQLException ee) {
                    System.out.println("SQL ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            return Lista;
        }
        return Lista;
    }

   public ArrayList<usuarios> buscarUsuarioAdministradores() {
        ArrayList<usuarios> Lista = new ArrayList<usuarios>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement st = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = " SELECT usuario.Usu_IdUsuario, usuario.Usu_Usuario, usuario.Usu_TipoUsuario, usuario.Per_IdPersona, usuario.Usu_Acceso, "
			+ "(SELECT CONCAT(persona.Per_NombRazon, ' ', persona.Per_ApPater, ' ', persona.Per_ApMater) FROM personas persona WHERE persona.Per_IdPersona = usuario.Per_IdPersona) AS empleado, "
			+ "usuario.Usu_Status FROM usuarios usuario WHERE usuario.Usu_Status = 1 AND usuario.Usu_TipoUsuario = 'administrador'";
            try {
                st = con.prepareStatement(sql);
                rs = st.executeQuery();
                while (rs.next()) {
                    usuarios objUsuario = new usuarios();
                    objUsuario.setUsu_IdUsuario(rs.getInt("Usu_IdUsuario"));
                    objUsuario.setUsu_Usuario(rs.getString("Usu_Usuario"));
                    objUsuario.setUsu_TipoUsuario(rs.getString("Usu_TipoUsuario"));
                    objUsuario.setUsu_Acceso(rs.getString("Usu_Acceso"));
                    objUsuario.setEmpleado(rs.getString("empleado"));
                    objUsuario.setUsu_Status(rs.getInt("Usu_Status"));
                    Lista.add(objUsuario);
                    objUsuario = null;
                }
                //System.out.println("QUERY: " + sql);
                con.close();
            } catch (SQLException e) {
                System.out.println("ERROR SQL-1 " + e.getSQLState() + ": " + e.getMessage());
                Error++;
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                    st = null;
                    rs = null;
                    con.close();
                } catch (SQLException ee) {
                    System.out.println("SQL ERROR-2 " + ee.getSQLState() + ee.getMessage());
                    Error++;
                }
            }
        } else {
            return Lista;
        }
        return Lista;
    }
   
  public int insertarUsuario(String usuario, String password, int idPersona) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        sql = "INSERT INTO usuarios (Usu_Usuario, Usu_Password, Per_IdPersona) ";
        sql += "VALUES (?,?, ?);";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            ps.setInt(3, idPersona);
            ps.executeUpdate();
            con.close();
            System.out.println("INSERTANDO USUARIO");
        } catch (SQLException ee) {
            System.out.println("ERROR 1 AL INSERTAR USUARIO: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("ERROR 2 AL INSERTAR USUARIO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 3 AL INSERTAR USUARIO: " + e.toString());
            }

        }
        return ok;
    }//fin metodo InsertarUsuario
  
  public int actualizarIntentos(int idUsuario, int intentos) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        sql = "UPDATE usuarios SET Usu_Intentos=? ";
        sql += "WHERE Usu_IdUsuario=?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, intentos);
            ps.setInt(2, idUsuario);
            ps.executeUpdate();
            con.close();
            System.out.println("INTENTOS DEL USUARIO ACITUALIZADOS CORRECTAMENTE");
        } catch (SQLException ee) {
            System.out.println("ERROR 1 AL ACTUALIZAR INTENTOS: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("ERROR 1 AL ACTUALIZAR INTENTOS: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 1 AL ACTUALIZAR INTENTOS: " + e.toString());
            }

        }
        return ok;
    }//fin metodo actualizarIntentos
  public int actualizarPassword(int idUsuario, String password) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        sql = "UPDATE usuarios SET Usu_Password=? ";
        sql += "WHERE Usu_IdUsuario=?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, idUsuario);
            ps.executeUpdate();
            con.close();
            System.out.println("INTENTOS DEL USUARIO ACITUALIZADOS CORRECTAMENTE");
        } catch (SQLException ee) {
            System.out.println("ERROR 1 AL ACTUALIZAR PASSWORD: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("ERROR 2 AL ACTUALIZAR PASSWORD: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 3 AL ACTUALIZAR PASSWORD: " + e.toString());
            }

        }
        return ok;
    }//fin metodo actualizarIntentos
  
  public int actualizarAccesos(int idUsuario, String acceso) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        sql = "UPDATE usuarios SET Usu_Acceso=? ";
        sql += "WHERE Usu_IdUsuario=?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, acceso);
            ps.setInt(2, idUsuario);
            ps.executeUpdate();
            con.close();
            System.out.println("ACCESO DEL USUARIO ACITUALIZADO CORRECTAMENTE");
        } catch (SQLException ee) {
            System.out.println("ERROR 1 AL ACTUALIZAR ACCESO: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("ERROR 1 AL ACTUALIZAR ACCESO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 1 AL ACTUALIZAR ACCESO: " + e.toString());
            }

        }
        return ok;
    }//fin metodo actualizarIntentos
  
  public int actualizarUsuario(int idPersona, String usuario, String password) {
        PreparedStatement ps = null;
        String sql = "";
        int ok = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        sql = "UPDATE usuarios SET Usu_Usuario=?, Usu_Password=? ";
        sql += "WHERE Per_IdPersona=?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            ps.setInt(3, idPersona);
            ps.executeUpdate();
            con.close();
            System.out.println("USUARIO ACITUALIZADO CORRECTAMENTE");
        } catch (SQLException ee) {
            System.out.println("ERROR 1 AL ACTUALIZAR USUARIO: " + ee.toString());
            ok++;
        } catch (Exception e) {
            ok++;
            System.out.println("ERROR 1 AL ACTUALIZAR USUARIO: " + e.toString());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                ps = null;
                con.close();
            } catch (Exception e) {
                ok++;
                System.out.println("ERROR 1 AL ACTUALIZAR USUARIO: " + e.toString());
            }

        }
        return ok;
    }//fin metodo actualizarIntentos
  
    /**
     * @return the Usu_IdUsuario
     */
  
    public int getUsu_IdUsuario() {
        return Usu_IdUsuario;
    }

    /**
     * @param Usu_IdUsuario the Usu_IdUsuario to set
     */
    public void setUsu_IdUsuario(int Usu_IdUsuario) {
        this.Usu_IdUsuario = Usu_IdUsuario;
    }

    /**
     * @return the sucursal
     */
    public String getUsu_Sucursal() {
        return Usu_Sucursal;
    }

    /**
     * @param sucursal the sucursal to set
     */
    public void setUsu_Sucursal(String Usu_Sucursal) {
        this.Usu_Sucursal = Usu_Sucursal;
    }

    /**
     * @return the usuario
     */
    public String getUsu_Usuario() {
        return Usu_Usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsu_Usuario(String Usu_Usuario) {
        this.Usu_Usuario = Usu_Usuario;
    }

    /**
     * @return the password
     */
    public String getUsu_Password() {
        return Usu_Password;
    }

    /**
     * @param password the password to set
     */
    public void setUsu_Password(String Usu_Password) {
        this.Usu_Password = Usu_Password;
    }

    /**
     * @return the tipoUsuario
     */
    public String getUsu_TipoUsuario() {
        return Usu_TipoUsuario;
    }

    /**
     * @param tipoUsuario the tipoUsuario to set
     */
    public void setUsu_TipoUsuario(String tipoUsuario) {
        this.Usu_TipoUsuario = tipoUsuario;
    }

    /**
     * @return the sistema
     */
    public String getUsu_Sistema() {
        return Usu_Sistema;
    }

    /**
     * @param sistema the sistema to set
     */
    public void setUsu_Sistema(String Usu_Sistema) {
        this.Usu_Sistema = Usu_Sistema;
    }

    /**
     * @return the intentos
     */
    public int getUsu_Intentos() {
        return Usu_Intentos;
    }

    /**
     * @param intentos the intentos to set
     */
    public void setUsu_Intentos(int Usu_Intentos) {
        this.Usu_Intentos = Usu_Intentos;
    }

    /**
     * @return the status
     */
    public int getUsu_Status() {
        return Usu_Status;
    }

    /**
     * @param status the status to set
     */
    public void setUsu_Status(int Usu_Status) {
        this.Usu_Status = Usu_Status;
    }

    public int getPer_IdPersona() {
        return Per_IdPersona;
    }

    public void setPer_IdPersona(int Per_IdPersona) {
        this.Per_IdPersona = Per_IdPersona;
    }

    public String getUsu_Acceso() {
        return Usu_Acceso;
    }

    public void setUsu_Acceso(String Usu_Acceso) {
        this.Usu_Acceso = Usu_Acceso;
    }

    public String getEmpleado() {
        return Empleado;
    }

    public void setEmpleado(String Empleado) {
        this.Empleado = Empleado;
    }
    
}
