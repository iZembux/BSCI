package modelo;

import control.conexionMySQL;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class balanceCuatrimestral {
    
  private int bal_idIndicador;
  private String bal_Indicador;
  private String bal_area;
  private String bal_identificaIndicador;
  private double bal_objetivoMes1;
  private double bal_incurridoMes1;
  private double bal_objetivoMes2;
  private double bal_incurridoMes2;
  private double bal_objetivoMes3;
  private double bal_incurridoMes3;
  private double bal_objetivoMes4;
  private double bal_incurridoMes4;
  private double bal_objetivoMes5;
  private double bal_incurridoMes5;
  private double bal_objetivoMes6;
  private double bal_incurridoMes6;
  private double bal_objetivoMes7;
  private double bal_incurridoMes7;
  private double bal_objetivoMes8;
  private double bal_incurridoMes8;
  private double bal_objetivoMes9;
  private double bal_incurridoMes9;
  private double bal_objetivoMes10;
  private double bal_incurridoMes10;
  private double bal_objetivoMes11;
  private double bal_incurridoMes11;
  private double bal_objetivoMes12;
  private double bal_incurridoMes12;
  private double bal_puntosOptimos;
  private String bal_Operacion;
  private String bal_medida;
  private double bal_objGlobal;
  private int bal_idArea;
  private int bal_idDepartamento;
  private String bal_operaAcumulado;
  
  public balanceCuatrimestral() {}
  
  public ArrayList<balanceCuatrimestral> balCuatrimestral(String sql){
    ArrayList<balanceCuatrimestral> consultar = new ArrayList();
    ResultSet rs = null;
    PreparedStatement ps = null;
    int Error = 0;
    Connection con = null;
    conexionMySQL coneccion = new conexionMySQL();
    con = conexionMySQL.conectar();
    if (con != null) {
      try
      {
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
          balanceCuatrimestral objetoCuatrimestral = new balanceCuatrimestral();
          objetoCuatrimestral.setBal_idIndicador(rs.getInt("bal_idIndicador"));
          objetoCuatrimestral.setBal_Indicador(rs.getString("bal_indicador"));
          objetoCuatrimestral.setBal_identificaIndicador(rs.getString("bal_identificaIndicador"));
          objetoCuatrimestral.setBal_idArea(rs.getInt("bal_idArea"));
          objetoCuatrimestral.setBal_area(rs.getString("bal_area"));
          objetoCuatrimestral.setBal_idDepartamento(rs.getInt("bal_idDepartamento"));
          objetoCuatrimestral.setBal_objetivoMes1(rs.getDouble("objetivoMes1"));
          objetoCuatrimestral.setBal_incurridoMes1(rs.getDouble("incurridoMes1"));
          objetoCuatrimestral.setBal_objetivoMes2(rs.getDouble("objetivoMes2"));
          objetoCuatrimestral.setBal_incurridoMes2(rs.getDouble("incurridoMes2"));
          objetoCuatrimestral.setBal_objetivoMes3(rs.getDouble("objetivoMes3"));
          objetoCuatrimestral.setBal_incurridoMes3(rs.getDouble("incurridoMes3"));
          objetoCuatrimestral.setBal_objetivoMes4(rs.getDouble("objetivoMes4"));
          objetoCuatrimestral.setBal_incurridoMes4(rs.getDouble("incurridoMes4"));
          objetoCuatrimestral.setBal_puntosOptimos(rs.getDouble("bal_puntosOptimos"));
          objetoCuatrimestral.setBal_Operacion(rs.getString("bal_operacion"));
          objetoCuatrimestral.setBal_medida(rs.getString("bal_medida"));
          objetoCuatrimestral.setBal_objGlobal(rs.getDouble("bal_objGlobal"));
          objetoCuatrimestral.setBal_operaAcumulado(rs.getString("bal_operaAcumulado"));
          consultar.add(objetoCuatrimestral);
          objetoCuatrimestral = null;
        }
        con.close();
      } catch (SQLException e) {
        System.out.println("ERROR AL OBTENER DATOS PARA BALANCE CUATRIMESTRAL SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
          System.out.println("SQL AL OBTENER DATOS PARA BALANCE CUATRIMESTRAL ERROR-2 " + ee.getSQLState() + ee.getMessage());
          Error++;
        }
      }
    }else{
    System.out.println("CONECCION FAIL AL OBTENER DATOS PARA BALANCE CUATRIMESTRAL NORMAL");
    }return consultar;
  }
  
  public ArrayList<balanceCuatrimestral> balCuatrimestralAcum(String sql) {
    ArrayList<balanceCuatrimestral> consultar = new ArrayList();
    ResultSet rs = null;
    PreparedStatement ps = null;
    int Error = 0;
    Connection con = null;
    conexionMySQL coneccion = new conexionMySQL();
    con = conexionMySQL.conectar();
    if (con != null) {
      try
      {
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
          balanceCuatrimestral objetoCuatrimestral = new balanceCuatrimestral();
          objetoCuatrimestral.setBal_idIndicador(rs.getInt("bal_idIndicador"));
          objetoCuatrimestral.setBal_Indicador(rs.getString("bal_indicador"));
          objetoCuatrimestral.setBal_identificaIndicador(rs.getString("bal_identificaIndicador"));
          objetoCuatrimestral.setBal_idArea(rs.getInt("bal_idArea"));
          objetoCuatrimestral.setBal_area(rs.getString("bal_area"));
          objetoCuatrimestral.setBal_idDepartamento(rs.getInt("bal_idDepartamento"));
          objetoCuatrimestral.setBal_objetivoMes1(rs.getDouble("objetivoMes1"));
          objetoCuatrimestral.setBal_incurridoMes1(rs.getDouble("incurridoMes1"));
          objetoCuatrimestral.setBal_objetivoMes2(rs.getDouble("objetivoMes2"));
          objetoCuatrimestral.setBal_incurridoMes2(rs.getDouble("incurridoMes2"));
          objetoCuatrimestral.setBal_objetivoMes3(rs.getDouble("objetivoMes3"));
          objetoCuatrimestral.setBal_incurridoMes3(rs.getDouble("incurridoMes3"));
          objetoCuatrimestral.setBal_objetivoMes4(rs.getDouble("objetivoMes4"));
          objetoCuatrimestral.setBal_incurridoMes4(rs.getDouble("incurridoMes4"));
          objetoCuatrimestral.setBal_objetivoMes5(rs.getDouble("objetivoMes5"));
          objetoCuatrimestral.setBal_incurridoMes5(rs.getDouble("incurridoMes5"));
          objetoCuatrimestral.setBal_objetivoMes6(rs.getDouble("objetivoMes6"));
          objetoCuatrimestral.setBal_incurridoMes6(rs.getDouble("incurridoMes6"));
          objetoCuatrimestral.setBal_objetivoMes7(rs.getDouble("objetivoMes7"));
          objetoCuatrimestral.setBal_incurridoMes7(rs.getDouble("incurridoMes7"));
          objetoCuatrimestral.setBal_objetivoMes8(rs.getDouble("objetivoMes8"));
          objetoCuatrimestral.setBal_incurridoMes8(rs.getDouble("incurridoMes8"));
          objetoCuatrimestral.setBal_objetivoMes9(rs.getDouble("objetivoMes9"));
          objetoCuatrimestral.setBal_incurridoMes9(rs.getDouble("incurridoMes9"));
          objetoCuatrimestral.setBal_objetivoMes10(rs.getDouble("objetivoMes10"));
          objetoCuatrimestral.setBal_incurridoMes10(rs.getDouble("incurridoMes10"));
          objetoCuatrimestral.setBal_objetivoMes11(rs.getDouble("objetivoMes11"));
          objetoCuatrimestral.setBal_incurridoMes11(rs.getDouble("incurridoMes11"));
          objetoCuatrimestral.setBal_objetivoMes12(rs.getDouble("objetivoMes12"));
          objetoCuatrimestral.setBal_incurridoMes12(rs.getDouble("incurridoMes12"));
          objetoCuatrimestral.setBal_puntosOptimos(rs.getDouble("bal_puntosOptimos"));
          objetoCuatrimestral.setBal_Operacion(rs.getString("bal_operacion"));
          objetoCuatrimestral.setBal_medida(rs.getString("bal_medida"));
          objetoCuatrimestral.setBal_objGlobal(rs.getDouble("bal_objGlobal"));
          objetoCuatrimestral.setBal_operaAcumulado(rs.getString("bal_operaAcumulado"));
          consultar.add(objetoCuatrimestral);
          objetoCuatrimestral = null;
        }
        con.close();
      } catch (SQLException e) {
        System.out.println("ERROR AL OBTENER DATOS PARA BALANCE CUATRIMESTRAL SQL-1 " + e.getSQLState() + ": " + e.getMessage());
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
          System.out.println("SQL AL OBTENER DATOS PARA BALANCE CUATRIMESTRAL ERROR-2 " + ee.getSQLState() + ee.getMessage());
          Error++;
        }
      }
    }else{
        System.out.println("CONECCION FAIL AL OBTENER DATOS PARA BALANCE CUATRIMESTRAL ACUMULADO ");
    }
    
    return consultar;
  }
  
  public int getBal_idIndicador() {
    return bal_idIndicador;
  }
  
  public void setBal_idIndicador(int bal_idIndicador) {
    this.bal_idIndicador = bal_idIndicador;
  }
  
  public String getBal_Indicador() {
    return bal_Indicador;
  }
  
  public void setBal_Indicador(String bal_Indicador) {
    this.bal_Indicador = bal_Indicador;
  }
  
  public String getBal_area() {
    return bal_area;
  }
  
  public void setBal_area(String bal_area) {
    this.bal_area = bal_area;
  }
  
  public double getBal_objetivoMes1() {
    return bal_objetivoMes1;
  }
  
  public void setBal_objetivoMes1(double bal_objetivoMes1) {
    this.bal_objetivoMes1 = bal_objetivoMes1;
  }
  
  public double getBal_incurridoMes1() {
    return bal_incurridoMes1;
  }
  
  public void setBal_incurridoMes1(double bal_incurridoMes1) {
    this.bal_incurridoMes1 = bal_incurridoMes1;
  }
  
  public double getBal_objetivoMes2() {
    return bal_objetivoMes2;
  }
  
  public void setBal_objetivoMes2(double bal_objetivoMes2) {
    this.bal_objetivoMes2 = bal_objetivoMes2;
  }
  
  public double getBal_incurridoMes2() {
    return bal_incurridoMes2;
  }
  
  public void setBal_incurridoMes2(double bal_incurridoMes2) {
    this.bal_incurridoMes2 = bal_incurridoMes2;
  }
  
  public double getBal_objetivoMes3() {
    return bal_objetivoMes3;
  }
  
  public void setBal_objetivoMes3(double bal_objetivoMes3) {
    this.bal_objetivoMes3 = bal_objetivoMes3;
  }
  
  public double getBal_incurridoMes3() {
    return bal_incurridoMes3;
  }
  
  public void setBal_incurridoMes3(double bal_incurridoMes3) {
    this.bal_incurridoMes3 = bal_incurridoMes3;
  }
  
  public double getBal_objetivoMes4() {
    return bal_objetivoMes4;
  }
  
  public void setBal_objetivoMes4(double bal_objetivoMes4) {
    this.bal_objetivoMes4 = bal_objetivoMes4;
  }
  
  public double getBal_incurridoMes4() {
    return bal_incurridoMes4;
  }
  
  public void setBal_incurridoMes4(double bal_incurridoMes4) {
    this.bal_incurridoMes4 = bal_incurridoMes4;
  }
  
  public double getBal_objetivoMes5() { return bal_objetivoMes5; }
  
  public void setBal_objetivoMes5(double bal_objetivoMes5)
  {
    this.bal_objetivoMes5 = bal_objetivoMes5;
  }
  
  public double getBal_incurridoMes5() {
    return bal_incurridoMes5;
  }
  
  public void setBal_incurridoMes5(double bal_incurridoMes5) {
    this.bal_incurridoMes5 = bal_incurridoMes5;
  }
  
  public double getBal_objetivoMes6() { return bal_objetivoMes6; }
  
  public void setBal_objetivoMes6(double bal_objetivoMes6)
  {
    this.bal_objetivoMes6 = bal_objetivoMes6;
  }
  
  public double getBal_incurridoMes6() {
    return bal_incurridoMes6;
  }
  
  public void setBal_incurridoMes6(double bal_incurridoMes6) {
    this.bal_incurridoMes6 = bal_incurridoMes6;
  }
  
  public double getBal_objetivoMes7() { return bal_objetivoMes7; }
  
  public void setBal_objetivoMes7(double bal_objetivoMes7)
  {
    this.bal_objetivoMes7 = bal_objetivoMes7;
  }
  
  public double getBal_incurridoMes7() {
    return bal_incurridoMes7;
  }
  
  public void setBal_incurridoMes7(double bal_incurridoMes7) {
    this.bal_incurridoMes7 = bal_incurridoMes7;
  }
  
  public double getBal_objetivoMes8() { return bal_objetivoMes8; }
  
  public void setBal_objetivoMes8(double bal_objetivoMes8)
  {
    this.bal_objetivoMes8 = bal_objetivoMes8;
  }
  
  public double getBal_incurridoMes8() {
    return bal_incurridoMes8;
  }
  
  public void setBal_incurridoMes8(double bal_incurridoMes8) {
    this.bal_incurridoMes8 = bal_incurridoMes8;
  }
  
  public double getBal_objetivoMes9() { return bal_objetivoMes9; }
  
  public void setBal_objetivoMes9(double bal_objetivoMes9)
  {
    this.bal_objetivoMes9 = bal_objetivoMes9;
  }
  
  public double getBal_incurridoMes9() {
    return bal_incurridoMes9;
  }
  
  public void setBal_incurridoMes9(double bal_incurridoMes9) {
    this.bal_incurridoMes9 = bal_incurridoMes9;
  }
  
  public double getBal_objetivoMes10() { return bal_objetivoMes10; }
  
  public void setBal_objetivoMes10(double bal_objetivoMes10)
  {
    this.bal_objetivoMes10 = bal_objetivoMes10;
  }
  
  public double getBal_incurridoMes10() {
    return bal_incurridoMes10;
  }
  
  public void setBal_incurridoMes10(double bal_incurridoMes10) {
    this.bal_incurridoMes10 = bal_incurridoMes10;
  }
  
  public double getBal_objetivoMes11() { return bal_objetivoMes11; }
  
  public void setBal_objetivoMes11(double bal_objetivoMes11)
  {
    this.bal_objetivoMes11 = bal_objetivoMes11;
  }
  
  public double getBal_incurridoMes11() {
    return bal_incurridoMes11;
  }
  
  public void setBal_incurridoMes11(double bal_incurridoMes11) {
    this.bal_incurridoMes11 = bal_incurridoMes11;
  }
  
  public double getBal_objetivoMes12() { return bal_objetivoMes12; }
  
  public void setBal_objetivoMes12(double bal_objetivoMes12)
  {
    this.bal_objetivoMes12 = bal_objetivoMes12;
  }
  
  public double getBal_incurridoMes12() {
    return bal_incurridoMes12;
  }
  
  public void setBal_incurridoMes12(double bal_incurridoMes12) {
    this.bal_incurridoMes12 = bal_incurridoMes12;
  }
  
  public double getBal_puntosOptimos() { return bal_puntosOptimos; }
  
  public void setBal_puntosOptimos(double bal_puntosOptimos)
  {
    this.bal_puntosOptimos = bal_puntosOptimos;
  }
  
  public String getBal_Operacion() {
    return bal_Operacion;
  }
  
  public void setBal_Operacion(String bal_Operacion) {
    this.bal_Operacion = bal_Operacion;
  }
  
  public String getBal_medida() {
    return bal_medida;
  }
  
  public void setBal_medida(String bal_medida) {
    this.bal_medida = bal_medida;
  }
  
  public double getBal_objGlobal() {
    return bal_objGlobal;
  }
  
  public void setBal_objGlobal(double bal_objGlobal) {
    this.bal_objGlobal = bal_objGlobal;
  }
  
  public int getBal_idArea() {
    return bal_idArea;
  }
  
  public void setBal_idArea(int bal_idArea) {
    this.bal_idArea = bal_idArea;
  }
  
  public int getBal_idDepartamento() {
    return bal_idDepartamento;
  }
  
  public void setBal_idDepartamento(int bal_idDepartamento) {
    this.bal_idDepartamento = bal_idDepartamento;
  }
  
  public void setBal_operaAcumulado(String bal_operaAcumulado) {
    this.bal_operaAcumulado = bal_operaAcumulado;
  }
  
  public String getBal_operaAcumulado() {
    return bal_operaAcumulado;
  }
  
  public String getBal_identificaIndicador() {
    return bal_identificaIndicador;
  }
  
  public void setBal_identificaIndicador(String bal_identificaIndicador) {
    this.bal_identificaIndicador = bal_identificaIndicador;
  }
}