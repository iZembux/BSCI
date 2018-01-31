/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author ricar_000
 */
public class utilMath {

    public double redondear(double numero, int decimales) {
        return Math.round(numero * Math.pow(10, decimales)) / Math.pow(10, decimales);
        
    }
    public String formatoMiles(String cadena){
        String valorRetorno = "";
        String aux = "";
        int cuentaParaComas = 0;
        for (int x=(cadena.length()-1);x>=0;x--){
            //System.out.println("Caracter " + x + ": " + cadena.charAt(x));
            if(cuentaParaComas > 2){
                cuentaParaComas = 0;
                valorRetorno = valorRetorno+ "," + cadena.charAt(x);
            }else{
                valorRetorno += cadena.charAt(x);
            }
            cuentaParaComas++;         
        }
        aux = valorRetorno;
        valorRetorno = ""; 
        for (int x=(aux.length()-1);x>=0;x--){
            //System.out.println("Caracter " + x + ": " + aux.charAt(x));
            valorRetorno += aux.charAt(x);        
        }
        //System.out.println("VALOR RETORNO: " + valorRetorno);
        return valorRetorno;
    }


}
