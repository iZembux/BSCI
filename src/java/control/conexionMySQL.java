package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author oracle
 */

public class conexionMySQL {

    public conexionMySQL(){}
    
    public static Connection conectar(){
        String host="localhost";
        String sid="usuariosbi";
        String usuario="root";
        String contrasena="stmsc0nt";
        String cadenaconexion;
        cadenaconexion="jdbc:mysql://" + host +"/"+ sid;
        Connection connx=null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //System.out.println("DRIVER CARGARDO EXITOSAMENTE");
        }
        catch(ClassNotFoundException e){
            System.out.println("Ocurrio el siguiente error driver 1: "+e.getMessage());
            return null;
        }        
        try{
            connx=DriverManager.getConnection(cadenaconexion, usuario, contrasena);
            //System.out.println("String CONN: " + cadenaconexion);
            //System.out.println("CONEXION REALIZADA EXITOSAMENTE");
            return connx;
        }
        catch(SQLException e){
            System.out.println("Ocurrio el siguiente error al conectar:" +e.getMessage());
            return null;
        }
    
    }//fin metodo conectar
}//fin de clase
