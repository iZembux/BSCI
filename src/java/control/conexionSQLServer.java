package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author oracle
 */

public class conexionSQLServer {

    public conexionSQLServer(){}
    
    public static Connection conectar(){
        String host="192.168.1.45:1433;";
        String sid="databaseName=Mitsuautos;";
        String usuario="user=sa;";
        String contrasena="password=Craker334;";
        String cadenaconexion;
        cadenaconexion="jdbc:sqlserver://" + host + sid + usuario + contrasena;
        Connection connx=null;
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("DRIVER CARGARDO EXITOSAMENTE");
        }
        catch(ClassNotFoundException e){
            System.out.println("Ocurrio el siguiente error driver 1: "+e.getMessage());
            return null;
        }        
        try{
            connx=DriverManager.getConnection(cadenaconexion);
            //System.out.println("String CONN: " + cadenaconexion);
            System.out.println("CONEXION REALIZADA EXITOSAMENTE");
            return connx;
        }
        catch(SQLException e){
            System.out.println("Ocurrio el siguiente error al conectar:" +e.getMessage());
            return null;
        }
    
    }//fin metodo conectar
    
    public static Connection conectar(String BD){
        //String host="localhost:1433;";
        String host="192.168.1.45:1433;";
        //String host="10.10.1.15:1433;";
        String sid="databaseName="+ BD +";";
        String usuario="user=sa;";
        String contrasena="password=Craker334;";
        //String contrasena="password=70Y07Asfe;";
        String cadenaconexion;
        cadenaconexion="jdbc:sqlserver://" + host + sid + usuario + contrasena;
        Connection connx=null;
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("DRIVER CARGARDO EXITOSAMENTE");
        }
        catch(ClassNotFoundException e){
            System.out.println("Ocurrio el siguiente error driver 1: "+e.getMessage());
            return null;
        }        
        try{
            connx=DriverManager.getConnection(cadenaconexion);
            //System.out.println("String CONN: " + cadenaconexion);
            System.out.println("CONEXION REALIZADA EXITOSAMENTE");
            return connx;
        }
        catch(SQLException e){
            System.out.println("Ocurrio el siguiente error al conectar:" +e.getMessage());
            return null;
        }
    
    }//fin metodo conectar
    
    public static Connection conectar(String BD, String host){
        //String host="localhost:1433;";
        //String host="192.168.1.45:1433;";
        //String host="10.10.1.15:1433;";
        String sid="databaseName="+ BD +";";
        String usuario="user=sa;";
        String contrasena="password=Craker334;";
        //String contrasena="password=stmsc0nt;";
        //String contrasena="password=70Y07Asfe;";
        String cadenaconexion;
         cadenaconexion="jdbc:sqlserver://" + host + sid + usuario + contrasena;
        Connection connx=null;
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("DRIVER CARGARDO EXITOSAMENTE");
        }
        catch(ClassNotFoundException e){
            System.out.println("Ocurrio el siguiente error driver 1: "+e.getMessage());
            return null;
        }        
        try{
            connx=DriverManager.getConnection(cadenaconexion);
            //System.out.println("String CONN: " + cadenaconexion);
            System.out.println("CONEXION REALIZADA EXITOSAMENTE");
            return connx;
        }
        catch(SQLException e){
            System.out.println("Ocurrio el siguiente error al conectar:" +e.getMessage());
            return null;
        }
    
    }//fin metodo conectar
}//fin de clase
