/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import control.conexionMySQL;
import control.conexionMySQL;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.persistence.Basic; 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
//import modelo.DatosPortada2;

/**
 *
 * @author aBIMAEL
 */
@Entity
@Table(name = "userbi")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Userbi.findAll", query = "SELECT u FROM Userbi u")
    , @NamedQuery(name = "Userbi.findByIduserBI", query = "SELECT u FROM Userbi u WHERE u.iduserBI = :iduserBI")
    , @NamedQuery(name = "Userbi.findByStatus", query = "SELECT u FROM Userbi u WHERE u.status = :status")
    , @NamedQuery(name = "Userbi.findByUsuario", query = "SELECT u FROM Userbi u WHERE u.usuario = :usuario")
    , @NamedQuery(name = "Userbi.findByPassword", query = "SELECT u FROM Userbi u WHERE u.password = :password")
    , @NamedQuery(name = "Userbi.findByTipo", query = "SELECT u FROM Userbi u WHERE u.tipo = :tipo")
    , @NamedQuery(name = "Userbi.findByIntentos", query = "SELECT u FROM Userbi u WHERE u.intentos = :intentos")
    , @NamedQuery(name = "Userbi.findByNombre", query = "SELECT u FROM Userbi u WHERE u.nombre = :nombre")
    , @NamedQuery(name = "Userbi.findByDepartamento", query = "SELECT u FROM Userbi u WHERE u.departamento = :departamento")
    , @NamedQuery(name = "Userbi.findByDesde", query = "SELECT u FROM Userbi u WHERE u.desde = :desde")
    , @NamedQuery(name = "Userbi.findByPuesto", query = "SELECT u FROM Userbi u WHERE u.puesto = :puesto")
    , @NamedQuery(name = "Userbi.findByConti", query = "SELECT u FROM Userbi u WHERE u.conti = :conti")
    , @NamedQuery(name = "Userbi.findByMitsu", query = "SELECT u FROM Userbi u WHERE u.mitsu = :mitsu")
    , @NamedQuery(name = "Userbi.findByFiat", query = "SELECT u FROM Userbi u WHERE u.fiat = :fiat")
    , @NamedQuery(name = "Userbi.findByHyundai", query = "SELECT u FROM Userbi u WHERE u.hyundai = :hyundai")
    , @NamedQuery(name = "Userbi.findByPatriotismo", query = "SELECT u FROM Userbi u WHERE u.patriotismo = :patriotismo")
    , @NamedQuery(name = "Userbi.findByFiatauto", query = "SELECT u FROM Userbi u WHERE u.fiatauto = :fiatauto")
    , @NamedQuery(name = "Userbi.findByAutopolanco", query = "SELECT u FROM Userbi u WHERE u.autopolanco = :autopolanco")
    , @NamedQuery(name = "Userbi.findByNihon", query = "SELECT u FROM Userbi u WHERE u.nihon = :nihon")
    , @NamedQuery(name = "Userbi.findByPuertasantafe", query = "SELECT u FROM Userbi u WHERE u.puertasantafe = :puertasantafe")
    , @NamedQuery(name = "Userbi.findByVentas", query = "SELECT u FROM Userbi u WHERE u.ventas = :ventas")
    , @NamedQuery(name = "Userbi.findByHyp", query = "SELECT u FROM Userbi u WHERE u.hyp = :hyp")
    , @NamedQuery(name = "Userbi.findByFandi", query = "SELECT u FROM Userbi u WHERE u.fandi = :fandi")
    , @NamedQuery(name = "Userbi.findByServicio", query = "SELECT u FROM Userbi u WHERE u.servicio = :servicio")
    , @NamedQuery(name = "Userbi.findByRefacciones", query = "SELECT u FROM Userbi u WHERE u.refacciones = :refacciones")
    , @NamedQuery(name = "Userbi.findByAdministracion", query = "SELECT u FROM Userbi u WHERE u.administracion = :administracion")
    , @NamedQuery(name = "Userbi.findByDirectiva", query = "SELECT u FROM Userbi u WHERE u.directiva = :directiva")
    , @NamedQuery(name = "Userbi.findByEjecutiva", query = "SELECT u FROM Userbi u WHERE u.ejecutiva = :ejecutiva")
    , @NamedQuery(name = "Userbi.findByRef", query = "SELECT u FROM Userbi u WHERE u.ref = :ref")
    , @NamedQuery(name = "Userbi.findByServ", query = "SELECT u FROM Userbi u WHERE u.serv = :serv")
    , @NamedQuery(name = "Userbi.findByPronosticos", query = "SELECT u FROM Userbi u WHERE u.pronosticos = :pronosticos")
    , @NamedQuery(name = "Userbi.findByRazonez", query = "SELECT u FROM Userbi u WHERE u.razonez = :razonez")
    , @NamedQuery(name = "Userbi.findByBscanual", query = "SELECT u FROM Userbi u WHERE u.bscanual = :bscanual")})
public class Userbi implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "iduserBI")
    private Integer iduserBI;
    @Basic(optional = false)
    @NotNull
    @Column(name = "status")
    private int status;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "Usuario")
    private String usuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipo")
    private String tipo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "intentos")
    private int intentos;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "Nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "Departamento")
    private String departamento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "Desde")
    private String desde;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "Puesto")
    private String puesto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Conti")
    private int conti;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Mitsu")
    private int mitsu;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fiat")
    private int fiat;
    @Basic(optional = false)
    @NotNull
    @Column(name = "hyundai")
    private int hyundai;
    @Column(name = "patriotismo")
    private Integer patriotismo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fiatauto")
    private int fiatauto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "autopolanco")
    private int autopolanco;
    @Basic(optional = false)
    @NotNull
    @Column(name = "nihon")
    private int nihon;
    @Column(name = "puertasantafe")
    private Integer puertasantafe;
    @Column(name = "ventas")
    private Integer ventas;
    @Column(name = "hyp")
    private Integer hyp;
    @Column(name = "fandi")
    private Integer fandi;
    @Column(name = "servicio")
    private Integer servicio;
    @Column(name = "refacciones")
    private Integer refacciones;
    @Column(name = "administracion")
    private Integer administracion;
    @Column(name = "directiva")
    private Integer directiva;
    @Column(name = "ejecutiva")
    private Integer ejecutiva;
    @Column(name = "ref")
    private Integer ref;
    @Column(name = "serv")
    private Integer serv;
    @Column(name = "pronosticos")
    private Integer pronosticos;
    @Column(name = "razonez")
    private Integer razonez;
    @Column(name = "bscanual")
    private Integer bscanual;

    public Userbi() {
    }

    public Userbi(Integer iduserBI) {
        this.iduserBI = iduserBI;
    }

    public Userbi(Integer iduserBI, int status, String usuario, String password, String tipo, int intentos, String nombre, String departamento, String desde, String puesto, int conti, int mitsu, int fiat, int hyundai, int fiatauto, int autopolanco, int nihon) {
        this.iduserBI = iduserBI;
        this.status = status;
        this.usuario = usuario;
        this.password = password;
        this.tipo = tipo;
        this.intentos = intentos;
        this.nombre = nombre;
        this.departamento = departamento;
        this.desde = desde;
        this.puesto = puesto;
        this.conti = conti;
        this.mitsu = mitsu;
        this.fiat = fiat;
        this.hyundai = hyundai;
        this.fiatauto = fiatauto;
        this.autopolanco = autopolanco;
        this.nihon = nihon;
    }

    public Integer getIduserBI() {
        return iduserBI;
    }

    public void setIduserBI(Integer iduserBI) {
        this.iduserBI = iduserBI;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getIntentos() {
        return intentos;
    }

    public void setIntentos(int intentos) {
        this.intentos = intentos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getDesde() {
        return desde;
    }

    public void setDesde(String desde) {
        this.desde = desde;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    public int getConti() {
        return conti;
    }

    public void setConti(int conti) {
        this.conti = conti;
    }

    public int getMitsu() {
        return mitsu;
    }

    public void setMitsu(int mitsu) {
        this.mitsu = mitsu;
    }

    public int getFiat() {
        return fiat;
    }

    public void setFiat(int fiat) {
        this.fiat = fiat;
    }

    public int getHyundai() {
        return hyundai;
    }

    public void setHyundai(int hyundai) {
        this.hyundai = hyundai;
    }

    public Integer getPatriotismo() {
        return patriotismo;
    }

    public void setPatriotismo(Integer patriotismo) {
        this.patriotismo = patriotismo;
    }

    public int getFiatauto() {
        return fiatauto;
    }

    public void setFiatauto(int fiatauto) {
        this.fiatauto = fiatauto;
    }

    public int getAutopolanco() {
        return autopolanco;
    }

    public void setAutopolanco(int autopolanco) {
        this.autopolanco = autopolanco;
    }

    public int getNihon() {
        return nihon;
    }

    public void setNihon(int nihon) {
        this.nihon = nihon;
    }

    public Integer getPuertasantafe() {
        return puertasantafe;
    }

    public void setPuertasantafe(Integer puertasantafe) {
        this.puertasantafe = puertasantafe;
    }

    public Integer getVentas() {
        return ventas;
    }

    public void setVentas(Integer ventas) {
        this.ventas = ventas;
    }

    public Integer getHyp() {
        return hyp;
    }

    public void setHyp(Integer hyp) {
        this.hyp = hyp;
    }

    public Integer getFandi() {
        return fandi;
    }

    public void setFandi(Integer fandi) {
        this.fandi = fandi;
    }

    public Integer getServicio() {
        return servicio;
    }

    public void setServicio(Integer servicio) {
        this.servicio = servicio;
    }

    public Integer getRefacciones() {
        return refacciones;
    }

    public void setRefacciones(Integer refacciones) {
        this.refacciones = refacciones;
    }

    public Integer getAdministracion() {
        return administracion;
    }

    public void setAdministracion(Integer administracion) {
        this.administracion = administracion;
    }

    public Integer getDirectiva() {
        return directiva;
    }

    public void setDirectiva(Integer directiva) {
        this.directiva = directiva;
    }

    public Integer getEjecutiva() {
        return ejecutiva;
    }

    public void setEjecutiva(Integer ejecutiva) {
        this.ejecutiva = ejecutiva;
    }

    public Integer getRef() {
        return ref;
    }

    public void setRef(Integer ref) {
        this.ref = ref;
    }

    public Integer getServ() {
        return serv;
    }

    public void setServ(Integer serv) {
        this.serv = serv;
    }

    public Integer getPronosticos() {
        return pronosticos;
    }

    public void setPronosticos(Integer pronosticos) {
        this.pronosticos = pronosticos;
    }

    public Integer getRazonez() {
        return razonez;
    }

    public void setRazonez(Integer razonez) {
        this.razonez = razonez;
    }

    public Integer getBscanual() {
        return bscanual;
    }

    public void setBscanual(Integer bscanual) {
        this.bscanual = bscanual;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iduserBI != null ? iduserBI.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Userbi)) {
            return false;
        }
        Userbi other = (Userbi) object;
        if ((this.iduserBI == null && other.iduserBI != null) || (this.iduserBI != null && !this.iduserBI.equals(other.iduserBI))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "servlet.Userbi[ iduserBI=" + iduserBI + " ]";
    }
    
    public ArrayList<Userbi> validarUsuario(String usuario) {
        ArrayList<Userbi> Lista = new ArrayList<>();
        String sql = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        int Error = 0;
        Connection con = null;
        conexionMySQL coneccion = new conexionMySQL();
        con = coneccion.conectar();
        if (con != null) {
            sql = "SELECT * FROM userBI WHERE usuario=? AND status=1 ";
            try {

                ps = con.prepareStatement(sql);
                ps.setString(1, usuario);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Userbi objUsuario = new Userbi();
                    objUsuario.setIduserBI(rs.getInt("iduserBI"));
                    objUsuario.setStatus(rs.getInt("status"));
                    objUsuario.setUsuario(rs.getString("Usuario"));
                    objUsuario.setPassword(rs.getString("password"));
                    objUsuario.setNombre(rs.getString("Nombre"));
                    objUsuario.setDepartamento(rs.getString("Departamento"));
                    objUsuario.setDesde(rs.getString("Desde"));
                    objUsuario.setConti(rs.getInt("Conti"));
                    objUsuario.setMitsu(rs.getInt("Mitsu"));
                    objUsuario.setFiat(rs.getInt("fiat"));
                    objUsuario.setHyundai(rs.getInt("Hyundai"));
                    objUsuario.setPatriotismo(rs.getInt("patriotismo"));
                    objUsuario.setFiatauto(rs.getInt("fiatauto"));
                    objUsuario.setAutopolanco(rs.getInt("autopolanco"));
                    objUsuario.setNihon(rs.getInt("nihon"));
                    objUsuario.setVentas(rs.getInt("ventas"));
                    objUsuario.setHyp(rs.getInt("hyp"));
                    objUsuario.setFandi(rs.getInt("fandi"));
                    objUsuario.setServicio(rs.getInt("servicio"));
                    objUsuario.setRefacciones(rs.getInt("refacciones"));
                    objUsuario.setAdministracion(rs.getInt("administracion"));
                    Lista.add(objUsuario);
                    objUsuario = null;
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
            return Lista;
        }
        return Lista;
    }
    
}
