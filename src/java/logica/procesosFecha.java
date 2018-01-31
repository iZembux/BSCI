/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author RKMaya
 */
public class procesosFecha {

    public boolean is_date(String fecha) {
        System.out.println("VALIDANDO FECHA: " + fecha);
        if (fecha == null) {
            return false;
        } else {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); //año-mes-dia  
            if (fecha.trim().length() != dateFormat.toPattern().length()) {
                return false;
            }
            dateFormat.setLenient(false);
            try {
                dateFormat.parse(fecha.trim());
            } catch (ParseException pe) {
                return false;
            }
            return true;
        }
    }

    public boolean verificarFecha(String start_date, String evaluame) {
        //    date_default_timezone_set('America/Mexico_City');
        start_date = start_date.replace("-", "/");
        evaluame = evaluame.replace("-", "/");
        Date start = new Date(start_date);
        Date eval = new Date(evaluame);
        long start_ts = start.getTime();
        long user_ts = eval.getTime();
        //System.out.println("<script type='text/javascript'>alert('FECHA 1: " + start_date + " FECHA 2: " + evaluame + "');</script>");
        //echo "<br/>Fechas COTIZACION: $evaluame >= SISTEMA: $start_date";
        if (user_ts > start_ts) {
            //System.out.println("<script type='text/javascript'>alert('FECHA 2 [" + evaluame + "] VALIDA');</script>");
            //echo "<br/>Fecha [$user_ts] VALIDA";
            return true;
        } else {
            //System.out.println("<script type='text/javascript'> alert('FAVOR DE INTRODUCIR UNA FECHA');</script>");
            //echo "<br/>FAVOR DE INTRODUCIR UNA FECHA VALIDOS";
            return false;
        }
    }

    public int obtenerDiasMes(int mes, int anio) {
        int dias = 30;
        switch(mes){
            case 1:
                dias = 31;
                break;
            case 2:
                dias = 28;
                if((anio%4) == 0){
                    dias = 29;
                }
                break;
            case 3:
                dias = 31;
                break;
            case 4:
                dias = 30;
                break;
            case 5:
                dias = 31;
                break;
            case 6:
                dias = 30;
                break;
            case 7:
                dias = 31;
                break;
            case 8:
                dias = 31;
                break;
            case 9:
                dias = 30;
                break;
            case 10:
                dias = 31;
                break;
            case 11:
                dias = 30;
                break;
            case 12:
                dias = 31;
                break;
        }
        return dias;
    }
    
    //----------------------------------- OBTENER DIA EN ESPAÑOL -----------------------------------
    public String escribeFecha(String fecha) {
        String fechaNew = fecha.replace("-", "/");
        Date fechaDate = new Date(fechaNew);
        String dia;
        SimpleDateFormat formato = new SimpleDateFormat("EEEE");
        dia = formato.format(fechaDate);
        //System.out.println("DIA: " + fecha);
        return dia;
    }
    
    //----------------------------------- OBTENER FECHA EN FORMATO PARA TITULO -----------------------------------
    public String formatoTitulo(String fecha) {
        String fechaNew = fecha.replace("-", "/");
        Date fechaDate = new Date(fechaNew);
        String dia;
        SimpleDateFormat formato = new SimpleDateFormat("EEEE dd MMM yyyy");
        dia = formato.format(fechaDate);
        //System.out.println("DIA: " + fecha);
        return dia;
    }    
    
    public String difereciaHoras(String inicio, String fin) {
        Date fechaInicio = null;
        Date fechaFin = null;
        //Configurar el formato en que se trabajaran las fechas
        SimpleDateFormat formato = new SimpleDateFormat("HH:mm:ss");
        try {
            //Cambiar los String a objetos de tipo Date
            fechaInicio = formato.parse(inicio);
            fechaFin = formato.parse(fin);
        } catch (ParseException e) {
            System.out.println("ERROR PARSE: " + e.getMessage() + "!!!");
        } catch (Exception e) {
            System.out.println("ERROR " + e.getMessage() + "!!!");
        }

        //Crear instacion de tipo calendar
        Calendar calendarInicio = Calendar.getInstance();
        Calendar calendarFin = Calendar.getInstance();

        //Configurar la fecha del calendario con el tipo date que se genero de Parse
        calendarInicio.setTime(fechaInicio);
        calendarFin.setTime(fechaFin);

        //Converito la fechas a milisegundos
        long milisegundos1 = calendarInicio.getTimeInMillis();
        long milisegundos2 = calendarFin.getTimeInMillis();

        //Obtiene la diferencia de las fecha en milisegundos
        long diferenciaMilisegundos = milisegundos2 - milisegundos1;

        //Diferencia en segundos
        long difSegundos = Math.abs(diferenciaMilisegundos / 1000);

        //Diferenecia en minutos
        long difMinutos = Math.abs(diferenciaMilisegundos / (60 * 1000));
        long restoMinutos = difMinutos % 60;

        //Diferencia en horas
        long difHoras = (diferenciaMilisegundos / (60 * 60 * 1000));

        //Direfencia en Dias
        long difDias = Math.abs(diferenciaMilisegundos / (24 * 60 * 60 * 1000));

        //Devolver el resultado es un String
        return String.valueOf(difHoras + "H" + restoMinutos + " m");
    }

    public String diferenciaFechas(String inicio, String fin) {
        Date fechaInicio = null;
        Date fechaFin = null;
        //Configurar el formato en que se trabajaran las fechas
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //Cambiar los String a objetos de tipo Date
            fechaInicio = formato.parse(inicio);
            fechaFin = formato.parse(fin);
        } catch (ParseException e) {
            System.out.println("ERROR PARSE: " + e.getMessage() + "!!!");
        } catch (Exception e) {
            System.out.println("ERROR " + e.getMessage() + "!!!");
        }

        //Crear instacion de tipo calendar
        Calendar calendarInicio = Calendar.getInstance();
        Calendar calendarFin = Calendar.getInstance();

        //Configurar la fecha del calendario con el tipo date que se genero de Parse
        calendarInicio.setTime(fechaInicio);
        calendarFin.setTime(fechaFin);

        //Converito la fechas a milisegundos
        long milisegundos1 = calendarInicio.getTimeInMillis();
        long milisegundos2 = calendarFin.getTimeInMillis();

        //Obtiene la diferencia de las fecha en milisegundos
        long diferenciaMilisegundos = milisegundos2 - milisegundos1;

        //Diferencia en segundos
        long difSegundos = Math.abs(diferenciaMilisegundos / 1000);

        //Diferenecia en minutos
        long difMinutos = Math.abs(diferenciaMilisegundos / (60 * 1000));
        long restoMinutos = difMinutos % 60;

        //Diferencia en horas
        long difHoras = (diferenciaMilisegundos / (60 * 60 * 1000));

        //Direfencia en Dias
        long difDias = Math.abs(diferenciaMilisegundos / (24 * 60 * 60 * 1000));

        //Devolver el resultado es un String
        return String.valueOf(difHoras + "H" + restoMinutos + " m");
    }

    public int diasEntreFechas(String inicio, String fin) {
        inicio = inicio.replace("-", "/");
        fin = fin.replace("-", "/");
        Date fechaInicio = new Date(inicio);
        Date fechaFin = new Date(fin);

        //Crear instacion de tipo calendar
        Calendar calendarInicio = Calendar.getInstance();
        Calendar calendarFin = Calendar.getInstance();

        //Configurar la fecha del calendario con el tipo date que se genero de Parse
        calendarInicio.setTime(fechaInicio);
        calendarFin.setTime(fechaFin);

        //Converito la fechas a milisegundos
        long milisegundos1 = calendarInicio.getTimeInMillis();
        long milisegundos2 = calendarFin.getTimeInMillis();

        //Obtiene la diferencia de las fecha en milisegundos
        long diferenciaMilisegundos = milisegundos2 - milisegundos1;

        //Diferencia en segundos
        long difSegundos = Math.abs(diferenciaMilisegundos / 1000);

        //Diferenecia en minutos
        long difMinutos = Math.abs(diferenciaMilisegundos / (60 * 1000));
        long restoMinutos = difMinutos % 60;

        //Diferencia en horas
        long difHoras = (diferenciaMilisegundos / (60 * 60 * 1000));

        //Direfencia en Dias
        long difDias = Math.abs(diferenciaMilisegundos / (24 * 60 * 60 * 1000));

        //Devolver el resultado es un String
        return (int) difDias;
    }

    public String obtenerDia(String fecha) {
        fecha = fecha.replace("-", "/");
        Date hoy = new Date(fecha);
        String dia = null;
        SimpleDateFormat formato = new SimpleDateFormat("EEEE");
        dia = formato.format(hoy);
        return dia;
    }

    public String formatosFecha() {
        Date hoy = new Date();
        String hoyString = hoy.toString();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("STRING: " + hoyString);
        System.out.println("FORMATO: " + formato.format(hoy));
        return formato.format(hoy);
    }

    public String getFecha(String formatoString) {
        Date hoy = new Date();
        String hoyString = hoy.toString();
        SimpleDateFormat formato = new SimpleDateFormat(formatoString);
        System.out.println("FORMATO: " + formato.format(hoy));
        return formato.format(hoy);
    }
    
    public String obtenerMesEspanol(int mes){
        String mesEspanol = "";
        switch(mes){
            case 1:
                mesEspanol = "Enero";
                break;
            case 2:
                mesEspanol = "Febrero";
                break;
            case 3:
                mesEspanol = "Marzo";
                break;
            case 4:
                mesEspanol = "Abril";
                break;
            case 5:
                mesEspanol = "Mayo";
                break;
            case 6:
                mesEspanol = "Junio";
                break;
            case 7:
                mesEspanol = "Julio";
                break;
            case 8:
                mesEspanol = "Agosto";
                break;
            case 9:
                mesEspanol = "Septiembre";
                break;
            case 10:
                mesEspanol = "Octubre";
                break;
            case 11:
                mesEspanol = "Noviembre";
                break;
            case 12:
                mesEspanol = "Diciembre";
                break;
        }
        return mesEspanol;
    }
    
    public void formatosFecha(String fecha) {
        Date hoy = new Date(fecha);
        String hoyString = hoy.toString();
        SimpleDateFormat formato = new SimpleDateFormat("EEEE");
        System.out.println("STRING: " + hoyString);
        System.out.println("FORMATO: " + formato.format(hoy));
    }

    public String formatoddMMyyyyFecha(String fecha) {
        fecha = fecha.replace("-", "/");
        Date hoy = new Date(fecha);
        String hoyString = hoy.toString();
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("STRING: " + hoyString);
        System.out.println("FORMATO: " + formato.format(hoy));
        return formato.format(hoy);
    }
    
    public String sumarDiasFecha(String fecha, int dias) {
        fecha = fecha.replace("-", "/");
        Date fechaDate = new Date(fecha);
        System.out.println("Fecha Actual: " +  fecha + " dias " + dias);
        System.out.println("Sumar Dias " + fechaDate.toString());
        //SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fechaDate);
        calendar.add(Calendar.DAY_OF_YEAR, dias);//SI dias<0 se restan los dias
        fecha = formato.format(calendar.getTime());
        return fecha;
    }
    
    public Date sumarDiasFechaDate(String fecha, int dias) {
        Date fechaDate = new Date(fecha);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fechaDate);
        calendar.add(Calendar.DAY_OF_YEAR, dias);//SI dias<0 se restan los dias
        return calendar.getTime();
    }

    public Date sumarHorasFech(String fecha, int horas) {
        Date fechaDate = new Date(fecha);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fechaDate);
        calendar.add(Calendar.HOUR, horas);
        return calendar.getTime();
    }

    public void horaMayor(String hora1, String hora2) {
        Date fecha1Date = new Date(hora1);
        Date fecha2Date = new Date(hora2);
        SimpleDateFormat formato = new SimpleDateFormat("HH:mm:ss");
        Calendar calendar1 = Calendar.getInstance();
        Calendar calendar2 = Calendar.getInstance();
        calendar1.setTime(fecha1Date);
        calendar2.setTime(fecha2Date);
        long miliC1 = calendar1.getTimeInMillis();
        long miliC2 = calendar2.getTimeInMillis();
        System.out.println("HORA 1: " + miliC1);
        System.out.println("HORA 2: " + miliC2);
        if (miliC1 > miliC2) {
            System.out.println("HORA 1 MAYOR");
        }
        if (miliC1 < miliC2) {
            System.out.println("HORA 2 MAYOR");
        }
        if (miliC1 == miliC2) {
            System.out.println("HORAS IGUALES");
        }
    }

    public String obtenerHora(String fecha1) {
        Date hoy = new Date(fecha1);
        String dia = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        dia = formato.format(hoy);
        return dia;
    }

    public boolean horaMayorTime(String hora1, String hora2) {
        boolean retorno = false;
        String[] strHoraChecada = hora1.split(":");
        String[] strHoraEntrada = hora2.split(":");
        int horaChecada = Integer.parseInt(strHoraChecada[0]);
        int minChecada = Integer.parseInt(strHoraChecada[1]);
        int segChecada = Integer.parseInt(strHoraChecada[2]);
        int horaEntrada = Integer.parseInt(strHoraEntrada[0]);
        int minEntrada = Integer.parseInt(strHoraEntrada[1]);
        int segEntrada = Integer.parseInt(strHoraEntrada[2]);
        long segTotalChecada = (horaChecada * 60 * 60) + (minChecada * 60) + segChecada;
        long segTotalEntrada = (horaEntrada * 60 * 60) + (minEntrada * 60) + segEntrada;
        if (segTotalChecada >= segTotalEntrada) {
            retorno = true;
        }
        return retorno;
    }
    
    //----------------------------------- OBTENER FALTAS POR RETARDO -----------------------------------
    public int faltasXRetardos(int retardos) {
        int faltas = (int) (retardos / 3);
        return faltas;
    }
    public String[][] ordenarRegistros(String fechaInicio, String fechaFin, String[][] matriz, int longMatriz) {
        String dia;
        int encontrado = 0;
        int contandoDias = 0;
        fechaInicio = fechaInicio.replace("-", "/");
        fechaFin = fechaFin.replace("-", "/");
        String[][] matrizOrden = new String[longMatriz][5];     // 0 -- FECHA REVISADA 1 -- ENTRADA 2 -- SALIDA COMIDA 3 --ENTRADA COMIDA 4 -- SALIDA
        while (this.verificarFecha(fechaInicio, fechaFin)) {
            dia = this.obtenerDia(fechaInicio);
            System.out.println("Revisando " + dia + " " + fechaInicio);
            matrizOrden[contandoDias][0] = fechaInicio;
            for (int i = 0; i < matriz.length; i++) {
                // -------------------------------------- ENCONTRANDO DOMINGOS --------------------------------------
                if (dia.equals("domingo")) {
//                    System.out.println("ENTRADA - COMIDA - COMIDA - SALIDA");
                    matrizOrden[contandoDias][1] = "00:00";
                    matrizOrden[contandoDias][2] = "00:00";
                    matrizOrden[contandoDias][3] = "00:00";
                    matrizOrden[contandoDias][4] = "00:00";
                    i = matriz.length;
                } else {
                    // -------------------------------------- ENCONTRANDOS SABADOS --------------------------------------
                    if (dia.equals("sábado") && matriz[i][0].equals(fechaInicio)) {
                        // -------------------------------------- ENTRADA SABADOS --------------------------------------
                        if (this.horaMayorTime(matriz[i][1], "06:30:00") && this.horaMayorTime("12:30:00", matriz[i][1])) {
//                            System.out.println("ENTRADA SABADO " + matriz[i][0] + " " + matriz[i][1] + " TIEMPO RETARDO " + matriz[i][2]);
                            matrizOrden[contandoDias][1] = matriz[i][2];
                            encontrado++;
                            //i = matriz.length;
                        }
                        // -------------------------------------- SALIDA SABADOS --------------------------------------
                        if (this.horaMayorTime(matriz[i][1], "14:00:00")) {
//                            System.out.println("SALIDA  SABADO " + matriz[i][0] + " " + matriz[i][1] + " TIEMPO RETARDO " + matriz[i][2]);
                            matrizOrden[contandoDias][2] = matriz[i][2];
                            encontrado++;
                            //i = matriz.length;
                        }
                        matrizOrden[contandoDias][3] = "00:00";
                        matrizOrden[contandoDias][4] = "00:00";
                    } else {
                        // -------------------------------------- REVISANDO SEMANA INGLESA --------------------------------------
                        if (matriz[i][0].equals(fechaInicio)) {
                            // -------------------------------------- ENTRADA SEMANA INGLESA --------------------------------------
                            if (this.horaMayorTime(matriz[i][1], "06:30:00") && this.horaMayorTime("12:30:00", matriz[i][1])) {
//                                System.out.println("ENTRADA SEMANA " + matriz[i][0] + " " + matriz[i][1] + " TIEMPO RETARDO " + matriz[i][2]);
                                matrizOrden[contandoDias][1] = matriz[i][2];
                                encontrado++;
                                //i = matriz.length;
                            }
                            // -------------------------------------- SALIDA COMIDA --------------------------------------
                            if (this.horaMayorTime(matriz[i][1], "14:30:00") && this.horaMayorTime("15:15:00", matriz[i][1])) {
//                                System.out.println("SALIDA  COMIDA " + matriz[i][0] + " " + matriz[i][1] + " TIEMPO RETARDO " + matriz[i][2]);
                                matrizOrden[contandoDias][2] = matriz[i][2];
                                encontrado++;
                                //i = matriz.length;
                            }
                            // -------------------------------------- ENTRADA COMIDA --------------------------------------
                            if (this.horaMayorTime(matriz[i][1], "15:15:00") && this.horaMayorTime("17:30:00", matriz[i][1])) {
//                                System.out.println("ENTRADA COMIDA " + matriz[i][0] + " " + matriz[i][1] + " TIEMPO RETARDO " + matriz[i][2]);
                                matrizOrden[contandoDias][3] = matriz[i][2];
                                encontrado++;
                                //i = matriz.length;
                            }
                            // -------------------------------------- SALIDA SEMANA INGLESA --------------------------------------
                            if (this.horaMayorTime(matriz[i][1], "18:30:00")) {
//                                System.out.println("SALIDA  SEMANA " + matriz[i][0] + " " + matriz[i][1] + " TIEMPO RETARDO " + matriz[i][2]);
                                matrizOrden[contandoDias][4] = matriz[i][2];
                                encontrado++;
                                //i = matriz.length;
                            }
                        }
                    }
                }
            }
            contandoDias++;
            fechaInicio = this.sumarDiasFecha(fechaInicio, 1);
            //System.out.println("MATRIZ: " + matriz.length);
        }
        //System.out.println("REGISTROS: " + encontrado);
        //System.out.println("DIAS: " + contandoDias);
        // -------------------------------------- VERIFICANDO REGISTROS GUARDADOS --------------------------------------
        //for(int j = 0; j < contandoDias; j++){            
        //    System.out.println("" + matrizOrden[j][0] + " [" + matrizOrden[j][1] + "] " + "[" + matrizOrden[j][2] + "]" + " [" + matrizOrden[j][3] + "] " + "[" + matrizOrden[j][4] + "]");
        //}
        return matrizOrden;
    }

    public int[] sumarTiempoPerdido(String[][] matriz) {
        int[] resumen = new int[7];
        String dia;
        int minutos = 0;
        int segundos = 0;
        int faltas = 0;
        int retardosT = 0;
        int retardosE = 0;
        int retardosC = 0;
        for (int i = 0; i < matriz.length-1; i++) {
            dia = this.obtenerDia(matriz[i][0]);
            // -------------------------------------- VERIFICANDO DIA DOMINGO --------------------------------------
            if (dia.equals("domingo")) {
            } else {
                // -------------------------------------- VERIFICANDO DIA SABADO --------------------------------------
                if (dia.equals("sábado")) {
                    // -------------------------------------- VERIFICANDO ENTRADA --------------------------------------
                    if (matriz[i][1] == null && matriz[i][2] == null) {
                        faltas++;
                    } else {
                        String[] retardo = matriz[i][1].split(":");
                        minutos += Integer.parseInt(retardo[0]);
                        segundos += Integer.parseInt(retardo[1]);
                        if (Integer.parseInt(retardo[0]) > 5) {
                            retardosE++;
                            retardosT++;
                        }
                    }
                } else {
                    // -------------------------------------- VERIFICANDO SEMANA INGLESA --------------------------------------
                    if (matriz[i][1] == null && matriz[i][2] == null && matriz[i][3] == null && matriz[i][4] == null) {
                        faltas++;
                    } else {
                        // -------------------------------------- VERIFICANDO ENTRADA --------------------------------------
                        if (matriz[i][1] != null) {
                            String[] retardoE = matriz[i][1].split(":");
                            minutos += Integer.parseInt(retardoE[0]);
                            segundos += Integer.parseInt(retardoE[1]);
                            if (Integer.parseInt(retardoE[0]) > 5) {
                                retardosE++;
                                retardosT++;
                            }
                        } else {
                            minutos += 360;
                            retardosE++;
                            retardosT++;
                        }
                        // -------------------------------------- VERIFICANDO ENTRADA COMIDA --------------------------------------
                        if (matriz[i][3] != null) {
                            String[] retardoC = matriz[i][3].split(":");
                            minutos += Integer.parseInt(retardoC[0]);
                            segundos += Integer.parseInt(retardoC[1]);
                            if (Integer.parseInt(retardoC[0]) > 5) {
                                retardosC++;
                                retardosT++;
                            }
                        } else {
                            minutos += 150;
                            retardosC++;
                            retardosT++;
                        }
                    }
                }
            }
        }
        resumen[0] = minutos;
        resumen[1] = segundos;
        resumen[2] = faltas;
        resumen[3] = retardosT;
        resumen[4] = retardosE;
        resumen[5] = retardosC;
        //System.out.println("RESUMEN DE ENTRDAS");
        //System.out.println("TIEMPO RETARDOS: \t" + this.tiempoPerdido(minutos, segundos));
        //System.out.println("FALTAS: \t\t" + resumen[2]);
        //System.out.println("RETARDOS ENTRADA: \t" + resumen[4]);
        //System.out.println("RETARDOS COMIDA: \t" + resumen[5]);
        //System.out.println("RETARDOS TOTALTES: \t" + resumen[3]);
        return resumen;
    }
    
    public String tiempoPerdido(int minutos, int segundos) {
        String strMinutos, strSegundos, tiempoPerdido;
        int horas = 0;
        horas = (int) (minutos / 60);
        minutos = (minutos % 60) + (int) (segundos / 60);
        segundos = segundos % 60;
        strMinutos = "" + minutos;
        strSegundos = "" + segundos;
        if (minutos < 10) {
            strMinutos = "0" + minutos;
        }
        if (segundos < 10) {
            strSegundos = "0" + segundos;
        }
        return tiempoPerdido = horas + ":" + strMinutos + ":" + strSegundos;
    }
}
