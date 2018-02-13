/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;

/**
 *
 * @author REDES
 */
public class generarReporte {

    public String obtenerSQL(int mes, int anio) {
        String sql = "";
        if (mes > 0 && mes <= 4) {
            sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_enero as objetivoMes1, inc.bal_enero as incurridoMes1, ind.bal_febrero as objetivoMes2, inc.bal_febrero as incurridoMes2, ind.bal_marzo as objetivoMes3, inc.bal_marzo as incurridoMes3, ind.bal_abril as objetivoMes4, inc.bal_abril as incurridoMes4, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind,bal_incurridos inc WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo = 1 AND inc.bal_anio = " + anio;
            //"SELECT ind.idIndicador, ind.indicador, ind.enero as objetivoMes1, inc.enero as incurridoMes1, ind.febrero as objetivoMes2, inc.febrero as incurridoMes2, ind.marzo as objetivoMes3, inc.marzo as incurridoMes3, ind.abril as objetivoMes4, inc.abril as incurridoMes4, ind.idArea, ind.idDepartamento, ind.puntosOptimos, ind.operacion, ind.medida, ind.objGlobal FROM indicador ind, incurridos inc WHERE ind.idIndicador = inc.idIncurrido AND ind.activo = 1 AND inc.anio = " + anio;
        }
        if (mes >= 5 && mes <= 8) {
            sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_mayo as objetivoMes1, inc.bal_mayo as incurridoMes1, ind.bal_junio as objetivoMes2, inc.bal_junio as incurridoMes2, ind.bal_julio as objetivoMes3, inc.bal_julio as incurridoMes3, ind.bal_agosto as objetivoMes4, inc.bal_agosto as incurridoMes4, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo = 1 AND inc.bal_anio= " + anio;
            //"SELECT ind.idIndicador, ind.indicador, ind.mayo as objetivoMes1, inc.mayo as incurridoMes1, ind.junio as objetivoMes2, inc.junio as incurridoMes2, ind.julio as objetivoMes3, inc.julio as incurridoMes3, ind.agosto as objetivoMes4, inc.agosto as incurridoMes4, ind.idArea, ind.idDepartamento, ind.puntosOptimos, ind.operacion, ind.medida, ind.objGlobal FROM indicador ind, incurridos inc WHERE ind.idIndicador = inc.idIncurrido AND ind.activo = 1 AND inc.anio = " + anio;
        }
        if (mes >= 9 && mes <= 12) {
            sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_septiembre as objetivoMes1, inc.bal_septiembre as incurridoMes1, ind.bal_octubre as objetivoMes2, inc.bal_octubre as incurridoMes2, ind.bal_noviembre as objetivoMes3, inc.bal_noviembre as incurridoMes3, ind.bal_diciembre as objetivoMes4, inc.bal_diciembre as incurridoMes4,ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind,bal_incurridos inc WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo = 1 AND inc.bal_anio= " + anio;
            //sql = "SELECT ind.idIndicador, ind.indicador, ind.septiembre as objetivoMes1, inc.septiembre as incurridoMes1, ind.octubre as objetivoMes2, inc.octubre as incurridoMes2, ind.noviembre as objetivoMes3, inc.noviembre as incurridoMes3, ind.diciembre as objetivoMes4, inc.diciembre as incurridoMes4,ind.idArea, ind.idDepartamento, ind.puntosOptimos, ind.operacion, ind.medida, ind.objGlobal FROM indicador ind, incurridos inc WHERE ind.idIndicador = inc.idIncurrido AND ind.activo = 1 AND inc.anio = " + anio;
        }
        return sql;
    }

    public String obtenerSQLXDepartamento(int mes, int anio, String identificaDepartamento, String empresa) {
        String sql = "";
        if (mes > 0 && mes <= 4) {
            sql = "SELECT ind.bal_idIndicador, ind.bal_identificaIndicador, ind.bal_indicador, ind.bal_enero as objetivoMes1, inc.bal_enero as incurridoMes1, ind.bal_febrero as objetivoMes2, inc.bal_febrero as incurridoMes2, ind.bal_marzo as objetivoMes3, inc.bal_marzo as incurridoMes3, ind.bal_abril as objetivoMes4, inc.bal_abril as incurridoMes4, bal_area.bal_area, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal, ind.bal_operaAcumulado FROM bal_indicador ind, bal_incurridos inc, bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1 AND bal_area.bal_identificaArea = ind.bal_identificaArea AND inc.bal_anio = " + anio + " AND ind.bal_identificaDepartamento = '" + identificaDepartamento + "' AND inc.bal_incurridoEmpresa = '" + empresa + "' ORDER BY ind.bal_identificaArea, ind.bal_idIndicador";
            //sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_enero as objetivoMes1, inc.bal_enero as incurridoMes1, ind.bal_febrero as objetivoMes2, inc.bal_febrero as incurridoMes2, ind.bal_marzo as objetivoMes3, inc.bal_marzo as incurridoMes3, ind.bal_abril as objetivoMes4, inc.bal_abril as incurridoMes4, bal_area.bal_area, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc, bal_areas bal_area WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo = 1 AND bal_area.bal_idArea = ind.bal_idArea AND inc.bal_anio = " + anio + " AND ind.bal_idDepartamento = " + idDepartamento;
        }
        if (mes >= 5 && mes <= 8) {
            sql = "SELECT ind.bal_idIndicador, ind.bal_identificaIndicador, ind.bal_indicador, ind.bal_mayo as objetivoMes1, inc.bal_mayo as incurridoMes1, ind.bal_junio as objetivoMes2, inc.bal_junio as incurridoMes2, ind.bal_julio as objetivoMes3, inc.bal_julio as incurridoMes3, ind.bal_agosto as objetivoMes4, inc.bal_agosto as incurridoMes4, bal_area.bal_area, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal, ind.bal_operaAcumulado FROM bal_indicador ind, bal_incurridos inc, bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1 AND bal_area.bal_identificaArea = ind.bal_identificaArea AND inc.bal_anio = " + anio + " AND ind.bal_identificaDepartamento = '" + identificaDepartamento + "' AND inc.bal_incurridoEmpresa = '" + empresa + "' ORDER BY ind.bal_identificaArea, ind.bal_idIndicador";
            //sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_mayo as objetivoMes1, inc.bal_mayo as incurridoMes1, ind.bal_junio as objetivoMes2, inc.bal_junio as incurridoMes2, ind.bal_julio as objetivoMes3, inc.bal_julio as incurridoMes3, ind.bal_agosto as objetivoMes4, inc.bal_agosto as incurridoMes4, bal_area.bal_area, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc, bal_areas bal_area WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo = 1 AND bal_area.bal_idArea = ind.bal_idArea AND inc.bal_anio = " + anio + " AND ind.bal_idDepartamento = " + idDepartamento;
        }
        if (mes >= 9 && mes <= 12) {
            sql = "SELECT ind.bal_idIndicador, ind.bal_identificaIndicador, ind.bal_indicador, ind.bal_septiembre as objetivoMes1, inc.bal_septiembre as incurridoMes1, ind.bal_octubre as objetivoMes2, inc.bal_octubre as incurridoMes2, ind.bal_noviembre as objetivoMes3, inc.bal_noviembre as incurridoMes3, ind.bal_diciembre as objetivoMes4, inc.bal_diciembre as incurridoMes4, bal_area.bal_area, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal, ind.bal_operaAcumulado FROM bal_indicador ind, bal_incurridos inc, bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1 AND bal_area.bal_identificaArea = ind.bal_identificaArea AND inc.bal_anio = " + anio + " AND ind.bal_identificaDepartamento = '" + identificaDepartamento + "' AND inc.bal_incurridoEmpresa = '" + empresa + "' ORDER BY ind.bal_identificaArea, ind.bal_idIndicador";
            //sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_septiembre as objetivoMes1, inc.bal_septiembre as incurridoMes1, ind.bal_octubre as objetivoMes2, inc.bal_octubre as incurridoMes2, ind.bal_noviembre as objetivoMes3, inc.bal_noviembre as incurridoMes3, ind.bal_diciembre as objetivoMes4,bal_area.bal_area, bal_area.bal_diciembre as incurridoMes4, ind.bal_area ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc, bal_areas bal_area WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo = 1 AND bal_area.bal_idArea = ind.bal_idArea AND inc.bal_anio = " + anio + " AND ind.bal_idDepartamento = " + idDepartamento;
        }
        
        return sql;
    }
    
    public String obtenerSQLXDepartamentoAcum(int mes, int anio, String identificaDepartamento, String empresa) {
        String sql = "";
        System.out.println("balance acumulado dos");

        sql = "SELECT ind.bal_idIndicador, ind.bal_identificaIndicador, ind.bal_indicador, ind.bal_enero as objetivoMes1, inc.bal_enero as incurridoMes1, ind.bal_febrero as objetivoMes2, inc.bal_febrero as incurridoMes2, ind.bal_marzo as objetivoMes3, inc.bal_marzo as incurridoMes3, ind.bal_abril as objetivoMes4, inc.bal_abril as incurridoMes4, ind.bal_mayo as objetivoMes5, inc.bal_mayo as incurridoMes5, ind.bal_junio as objetivoMes6, inc.bal_junio as incurridoMes6, ind.bal_julio as objetivoMes7, inc.bal_julio as incurridoMes7, ind.bal_agosto as objetivoMes8, inc.bal_agosto as incurridoMes8, ind.bal_septiembre as objetivoMes9, inc.bal_septiembre as incurridoMes9, ind.bal_octubre as objetivoMes10, inc.bal_octubre as incurridoMes10, ind.bal_noviembre as objetivoMes11, inc.bal_noviembre as incurridoMes11, ind.bal_diciembre as objetivoMes12, inc.bal_diciembre as incurridoMes12, bal_area.bal_area, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal, ind.bal_operaAcumulado FROM bal_indicador ind, bal_incurridos inc, bal_areas bal_area WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1 AND bal_area.bal_identificaArea = ind.bal_identificaArea AND inc.bal_anio = '" + anio + "' AND ind.bal_identificaDepartamento = '" + identificaDepartamento + "' AND inc.bal_incurridoEmpresa = '" + empresa + "' ORDER BY ind.bal_identificaArea, ind.bal_idIndicador";
        System.out.println("obtener sql x depto BSCI acum: " + sql);
        return sql;
    }

    public String obtenerSQLIcurridoCapturado(int mes, int anio, String identificaIndicador, String empresa) {
        procesosFecha objFecha = new procesosFecha();
        String mesEspanol = "enero";
        mesEspanol = objFecha.obtenerMesEspanol(mes);
        String sql = "";
        sql = "SELECT bal_idIncurrido, bal_identificaIndicador, bal_incurridoEmpresa, bal_" + mesEspanol.toLowerCase() + " as incurridoCapturado, bal_" + mesEspanol.toLowerCase() + "Acumulado as acumuladoCapturado FROM bal_acumuladosCapturados WHERE bal_identificaIndicador = '" + identificaIndicador + "' AND bal_anio = " + anio + " AND  bal_incurridoEmpresa = '" + empresa + "'";
        return sql;
    }

    public ArrayList<balance> genenrarBalance(int bal_mesGenerar, int bal_Anio) {
        utilBalance utilBalance = new utilBalance();
        String sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_enero, inc.bal_enero, ind.bal_febrero, inc.bal_febrero, ind.bal_idarea, ind.bal_indicador, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo =1";
        //"SELECT ind.idIndicador, ind.indicador, ind.enero, inc.enero, ind.febrero, inc.febrero, ind.area, ind.indicador, ind.idArea, ind.idDepartamento, ind.puntosOptimos, ind.operacion, ind.medida, ind.objGlobal FROM indicador ind, incurridos inc WHERE ind.idIndicador = inc.idIncurrido AND ind.activo = 1";
        int mesCuatrimestre = 1;
        ArrayList<balanceCuatrimestral> arrayincurridos = new ArrayList<balanceCuatrimestral>();
        ArrayList<balance> arrayBalance = new ArrayList<balance>();
        incurridos objincurrido = new incurridos();

        balanceCuatrimestral balanceCuatrimestral = new balanceCuatrimestral();
        sql = obtenerSQL(bal_mesGenerar, bal_Anio);

        arrayincurridos = balanceCuatrimestral.balCuatrimestral(sql);

        if (arrayincurridos.size() > 0) {
            for (int i = 0; i < arrayincurridos.size(); i++) {
                int bal_idIndicador = arrayincurridos.get(i).getBal_idIndicador();
                String bal_indicador = arrayincurridos.get(i).getBal_Indicador();
                Double bal_objCuatrimestre = 0.0;
                Double bal_incCuatrimestre = 0.0;

                Double bal_objAcumulado = 0.0;
                Double bal_incAcumulado = 0.0;
                if (bal_mesGenerar == 1 || bal_mesGenerar == 5 || bal_mesGenerar == 9) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes1();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes1();

                    bal_objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1();
                    bal_incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1();
                    mesCuatrimestre = 1;
                }
                if (bal_mesGenerar == 2 || bal_mesGenerar == 6 || bal_mesGenerar == 10) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes2();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes2();

                    bal_objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1() + arrayincurridos.get(i).getBal_objetivoMes2();
                    bal_incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1() + arrayincurridos.get(i).getBal_incurridoMes2();
                    mesCuatrimestre = 2;
                }
                if (bal_mesGenerar == 3 || bal_mesGenerar == 7 || bal_mesGenerar == 11) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes3();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes3();

                    bal_objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1() + arrayincurridos.get(i).getBal_objetivoMes2() + arrayincurridos.get(i).getBal_objetivoMes3();
                    bal_incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1() + arrayincurridos.get(i).getBal_incurridoMes2() + arrayincurridos.get(i).getBal_incurridoMes3();
                    mesCuatrimestre = 3;
                }
                if (bal_mesGenerar == 4 || bal_mesGenerar == 8 || bal_mesGenerar == 12) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes4();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes4();

                    bal_objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1() + arrayincurridos.get(i).getBal_objetivoMes2() + arrayincurridos.get(i).getBal_objetivoMes3() + arrayincurridos.get(i).getBal_objetivoMes4();
                    bal_incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1() + arrayincurridos.get(i).getBal_incurridoMes2() + arrayincurridos.get(i).getBal_incurridoMes3() + arrayincurridos.get(i).getBal_incurridoMes4();
                    mesCuatrimestre = 4;
                }
                Double puntosOptimos = arrayincurridos.get(i).getBal_puntosOptimos();
                String bal_area = arrayincurridos.get(i).getBal_area();
                int bal_idArea = arrayincurridos.get(i).getBal_idArea();
                int bal_idDepartamento = arrayincurridos.get(i).getBal_idDepartamento();
                String operacion = arrayincurridos.get(i).getBal_Operacion();
                String medida = arrayincurridos.get(i).getBal_medida();
                Double bal_objAnual = arrayincurridos.get(i).getBal_objGlobal();
                Double bal_cumCuatrimestre = 0.0;
                Double bal_cumAcumulado = 0.0;
                Double bal_puntosObtenidos = 0.0;
                medida = medida.replace(" ", "");
                System.out.println("ID: " + bal_idIndicador + " " + bal_indicador + " {" + medida + "}");
                if (!medida.equals("$")) {
                    System.out.println("ID" + bal_idIndicador);
                    bal_objAcumulado = bal_objAcumulado / mesCuatrimestre;
                    bal_incAcumulado = bal_incAcumulado / mesCuatrimestre;
                }

                bal_cumAcumulado = utilBalance.calcularCumplimientoAcumulado(bal_incAcumulado, bal_objAcumulado, operacion);
                bal_puntosObtenidos = utilBalance.calcularPuntosObtenidos(bal_cumAcumulado, puntosOptimos);
                balance objBalance = new balance();
                objBalance.setBal_Area(bal_area);
                objBalance.setBal_Indicador(bal_indicador);
                objBalance.setBal_IdIndicador(bal_idIndicador);
                objBalance.setBal_IdArea(bal_idArea);
                objBalance.setBal_IdDepartamento(bal_idDepartamento);
                objBalance.setBal_Anio(bal_Anio);
                objBalance.setBal_Mes(bal_mesGenerar);
                objBalance.setBal_ObjAnual(bal_objAnual);
                objBalance.setBal_ObjCuatrimestre(bal_objCuatrimestre);
                objBalance.setBal_IncCuatrimestre(bal_incCuatrimestre);
                objBalance.setBal_CumCuatrimestre(bal_cumCuatrimestre);
                objBalance.setBal_ObjAcumulado(bal_objAcumulado);
                objBalance.setBal_IncAcumulado(bal_incAcumulado);
                objBalance.setBal_CumAcumulado(bal_cumAcumulado);
                objBalance.setBal_PuntosObtenidos(bal_puntosObtenidos);
                objBalance.setBal_PuntosOptimos(puntosOptimos);
                objBalance.setBal_Medida(medida);
                objBalance.setBal_Operacion(operacion);

                arrayBalance.add(objBalance);
                objBalance = null;
            }
        }
        return arrayBalance;
    }

    public ArrayList<balance> genenrarBalanceXDepartamento(int mesGenerar, int Anio, String identificaDepartamento, String empresa) {
        utilBalance utilBalance = new utilBalance();
        String sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_enero, inc.bal_enero, ind.bal_febrero, inc.bal_febrero, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1";
        //String sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_enero, inc.bal_enero, ind.bal_febrero, inc.bal_febrero, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc WHERE ind.bal_idIndicador = inc.bal_idIncurrido AND ind.bal_activo = 1";
        int mesCuatrimestre = 1;
        ArrayList<balanceCuatrimestral> arrayincurridos = new ArrayList<balanceCuatrimestral>();
        ArrayList<balance> arrayBalance = new ArrayList<balance>();
        incurridos objincurrido = new incurridos();
        utilMath utilMath = new utilMath();

        balanceCuatrimestral balanceCuatrimestral = new balanceCuatrimestral();
        sql = obtenerSQLXDepartamento(mesGenerar, Anio, identificaDepartamento, empresa);

        arrayincurridos = balanceCuatrimestral.balCuatrimestral(sql);

        if (arrayincurridos.size() > 0) {
            for (int i = 0; i < arrayincurridos.size(); i++) {
                int bal_idIndicador = arrayincurridos.get(i).getBal_idIndicador();
                String bal_indicador = arrayincurridos.get(i).getBal_Indicador();
                String bal_identificaIndicador = arrayincurridos.get(i).getBal_identificaIndicador();
                int idArea = arrayincurridos.get(i).getBal_idArea();
                String area = arrayincurridos.get(i).getBal_area();
                String operaAcumulado = arrayincurridos.get(i).getBal_operaAcumulado();
                Double bal_objCuatrimestre = 0.0;
                Double bal_incCuatrimestre = 0.0;

                Double objAcumulado = 0.0;
                Double incAcumulado = 0.0;
                if (mesGenerar == 1 || mesGenerar == 5 || mesGenerar == 9) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes1();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes1();

                    objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1();
                    incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1();
                    mesCuatrimestre = 1;
                }
                if (mesGenerar == 2 || mesGenerar == 6 || mesGenerar == 10) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes2();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes2();

                    objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1() + arrayincurridos.get(i).getBal_objetivoMes2();
                    incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1() + arrayincurridos.get(i).getBal_incurridoMes2();
                    mesCuatrimestre = 2;
                }
                if (mesGenerar == 3 || mesGenerar == 7 || mesGenerar == 11) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes3();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes3();

                    objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1() + arrayincurridos.get(i).getBal_objetivoMes2() + arrayincurridos.get(i).getBal_objetivoMes3();
                    incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1() + arrayincurridos.get(i).getBal_incurridoMes2() + arrayincurridos.get(i).getBal_incurridoMes3();
                    mesCuatrimestre = 3;
                }
                if (mesGenerar == 4 || mesGenerar == 8 || mesGenerar == 12) {
                    bal_objCuatrimestre = arrayincurridos.get(i).getBal_objetivoMes4();
                    bal_incCuatrimestre = arrayincurridos.get(i).getBal_incurridoMes4();

                    objAcumulado = arrayincurridos.get(i).getBal_objetivoMes1() + arrayincurridos.get(i).getBal_objetivoMes2() + arrayincurridos.get(i).getBal_objetivoMes3() + arrayincurridos.get(i).getBal_objetivoMes4();
                    incAcumulado = arrayincurridos.get(i).getBal_incurridoMes1() + arrayincurridos.get(i).getBal_incurridoMes2() + arrayincurridos.get(i).getBal_incurridoMes3() + arrayincurridos.get(i).getBal_incurridoMes4();
                    mesCuatrimestre = 4;
                }
                Double puntosOptimos = arrayincurridos.get(i).getBal_puntosOptimos();
                String operacion = arrayincurridos.get(i).getBal_Operacion();
                String medida = arrayincurridos.get(i).getBal_medida();
                Double objAnual = arrayincurridos.get(i).getBal_objGlobal();
                Double cumCuatrimestre = 0.0;
                Double cumAcumulado = 0.0;
                Double puntosObtenidos = 0.0;
                medida = medida.replace(" ", "");
                /*
                if (!medida.equals("$")) {
                    objAcumulado = objAcumulado / mesCuatrimestre;
                    incAcumulado = incAcumulado / mesCuatrimestre;

                }
                 */
                if (operaAcumulado.equals("prom")) {
                    objAcumulado = objAcumulado / mesCuatrimestre;
                    incAcumulado = incAcumulado / mesCuatrimestre;
                }
                if (operaAcumulado.equals("cap")) {
                    String[] retorno = null;
                    objAcumulado = bal_objCuatrimestre;
                    bal_incCuatrimestre = 0.0;
                    sql = obtenerSQLIcurridoCapturado(mesGenerar, Anio, bal_identificaIndicador, empresa);
                    incurridosCapturados objIncurridoC = new incurridosCapturados();
                    retorno = objIncurridoC.consultarIncurridos(sql);
                    try {
                        bal_incCuatrimestre = Double.parseDouble(retorno[0]);
                    } catch (Exception e) {
                        System.out.println("No se pudo convertir el incurrido capturado " + retorno[0]);
                    }
                    try {
                        incAcumulado = Double.parseDouble(retorno[1]);
                    } catch (Exception e) {
                        System.out.println("No se pudo convertir el incurrdo acumuldo " + retorno[1]);
                    }
                }
                cumCuatrimestre = utilBalance.calcularCumplimientoAcumulado(bal_incCuatrimestre, bal_objCuatrimestre, operacion);
                cumAcumulado = utilBalance.calcularCumplimientoAcumulado(incAcumulado, objAcumulado, operacion);
                puntosObtenidos = utilBalance.calcularPuntosObtenidos(cumAcumulado, puntosOptimos);
                puntosObtenidos = utilMath.redondear(puntosObtenidos, 0);
//                if(bal_idIndicador == 188){
//                    System.out.println(i +".- " + bal_indicador + "\t OBJ Mes" + bal_objCuatrimestre + " | INC mes " + bal_incCuatrimestre + " | CUM mes " + cumCuatrimestre + " | OBJ Acum " + objAcumulado + " | INC Acum " + incAcumulado + " | CUM Acum " + cumAcumulado);
//                }
                balance objBalance = new balance();
                objBalance.setBal_IdIndicador(bal_idIndicador);
                objBalance.setBal_Indicador(bal_indicador);
                objBalance.setBal_IdArea(idArea);
                objBalance.setBal_Area(area);
                objBalance.setBal_identificaDepartamento(identificaDepartamento);
                objBalance.setBal_Anio(Anio);
                objBalance.setBal_Mes(mesGenerar);
                objBalance.setBal_ObjAnual(objAnual);
                objBalance.setBal_ObjCuatrimestre(bal_objCuatrimestre);
                objBalance.setBal_IncCuatrimestre(bal_incCuatrimestre);
                objBalance.setBal_CumCuatrimestre(cumCuatrimestre);
                objBalance.setBal_ObjAcumulado(objAcumulado);
                objBalance.setBal_IncAcumulado(incAcumulado);
                objBalance.setBal_CumAcumulado(cumAcumulado);
                objBalance.setBal_PuntosObtenidos(puntosObtenidos);
                objBalance.setBal_PuntosOptimos(puntosOptimos);
                objBalance.setBal_Medida(medida);
                objBalance.setBal_Operacion(operacion);

                arrayBalance.add(objBalance);
                objBalance = null;

            }
        }
        return arrayBalance;

    }

    public ArrayList<balance> genenrarBalanceXDepartamentoAcum(int mesGenerar, int Anio, String identificaDepartamento, String empresa) {
        utilBalance utilBalance = new utilBalance();
        System.out.println("Balance Acumuladoooo");
        //String sql = "SELECT ind.bal_idIndicador, ind.bal_indicador, ind.bal_enero, inc.bal_enero, ind.bal_febrero, inc.bal_febrero, ind.bal_idArea, ind.bal_idDepartamento, ind.bal_puntosOptimos, ind.bal_operacion, ind.bal_medida, ind.bal_objGlobal FROM bal_indicador ind, bal_incurridos inc WHERE ind.bal_identificaIndicador = inc.bal_identificaIndicador AND ind.bal_activo = 1";

        String sql = "";
        
        int mesCuatrimestre = 1;
        ArrayList<balanceCuatrimestral> arrayincurridos = new ArrayList();
        ArrayList<balance> arrayBalance = new ArrayList();
        incurridos objincurrido = new incurridos();
        utilMath utilMath = new utilMath();

        balanceCuatrimestral balanceCuatrimestral = new balanceCuatrimestral();
        sql = obtenerSQLXDepartamentoAcum(mesGenerar, Anio, identificaDepartamento, empresa);

        arrayincurridos = balanceCuatrimestral.balCuatrimestralAcum(sql);

        if (arrayincurridos.size() > 0) {
            for (int i = 0; i < arrayincurridos.size(); i++) {
                int bal_idIndicador = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_idIndicador();
                String bal_indicador = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_Indicador();
                String bal_identificaIndicador = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_identificaIndicador();
                int idArea = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_idArea();
                String area = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_area();
                String operaAcumulado = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_operaAcumulado();
                Double bal_objCuatrimestre = Double.valueOf(0.0D);
                Double bal_incCuatrimestre = Double.valueOf(0.0D);

                Double objAcumulado = Double.valueOf(0.0D);
                Double incAcumulado = Double.valueOf(0.0D);

                if (mesGenerar == 1) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes1());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes1());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 2) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes2());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes2());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 3) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes3());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes3());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 4) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes4());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes4());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 5) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes5());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes5());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 6) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes6());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes6());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 7) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes7());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes7());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 8) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes8());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes8());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 9) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes9());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes9());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 10) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes10());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes10());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 11) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes11());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes11());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                } else if (mesGenerar == 12) {
                    bal_objCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes12());
                    System.out.println("Objetico cuatrimestral:" + bal_objCuatrimestre);
                    bal_incCuatrimestre = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes12());
                    System.out.println("Incurrido Cuatrimestral: " + bal_incCuatrimestre);
                }

                objAcumulado = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes1() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes2() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes3() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes4() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes5() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes6() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes7() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes8() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes9() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes10() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes11() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes12());
                incAcumulado = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes1() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes2() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes3() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes4() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes5() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes6() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes7() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes8() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes9() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes10() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes11() + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_incurridoMes12());
                mesCuatrimestre = 4;
                System.out.println("objetivo 1:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes1());
                System.out.println("objetivo 2:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes2());
                System.out.println("objetivo 3:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes3());
                System.out.println("objetivo 4:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes4());
                System.out.println("objetivo 5:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes5());
                System.out.println("objetivo 6:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes6());
                System.out.println("objetivo 7:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes7());
                System.out.println("objetivo 8:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes8());
                System.out.println("objetivo 9:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes9());
                System.out.println("objetivo 10:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes10());
                System.out.println("objetivo 11:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes11());
                System.out.println("objetivo 1:" + ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objetivoMes12());
                System.out.println("Obj Acumulado:" + objAcumulado);
                System.out.println("IncAcumulado:" + incAcumulado);

                Double puntosOptimos = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_puntosOptimos());
                String operacion = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_Operacion();
                String medida = ((balanceCuatrimestral) arrayincurridos.get(i)).getBal_medida();
                Double objAnual = Double.valueOf(((balanceCuatrimestral) arrayincurridos.get(i)).getBal_objGlobal());
                Double cumCuatrimestre = Double.valueOf(0.0D);
                Double cumAcumulado = Double.valueOf(0.0D);
                Double puntosObtenidos = Double.valueOf(0.0D);
                medida = medida.replace(" ", "");

                if (operaAcumulado.equals("prom")) {
                    objAcumulado = Double.valueOf(objAcumulado.doubleValue() / 12);
                    incAcumulado = Double.valueOf(incAcumulado.doubleValue() / 12);
                }
                if (operaAcumulado.equals("cap")) {
                    String[] retorno = null;
                    objAcumulado = bal_objCuatrimestre;
                    bal_incCuatrimestre = Double.valueOf(0.0D);
                    sql = obtenerSQLIcurridoCapturado(mesGenerar, Anio, bal_identificaIndicador, empresa);
                    incurridosCapturados objIncurridoC = new incurridosCapturados();
                    retorno = objIncurridoC.consultarIncurridos(sql);
                    try {
                        bal_incCuatrimestre = Double.valueOf(Double.parseDouble(retorno[0]));
                    } catch (Exception e) {
                        System.out.println("No se pudo convertir el incurrido capturado " + retorno[0]);
                    }
                    try {
                        incAcumulado = Double.valueOf(Double.parseDouble(retorno[1]));
                    } catch (Exception e) {
                        System.out.println("No se pudo convertir el incurrdo acumuldo " + retorno[1]);
                    }
                }
                cumCuatrimestre = utilBalance.calcularCumplimientoAcumulado(bal_incCuatrimestre, bal_objCuatrimestre, operacion);
                cumAcumulado = utilBalance.calcularCumplimientoAcumulado(incAcumulado, objAcumulado, operacion);
                puntosObtenidos = utilBalance.calcularPuntosObtenidos(cumAcumulado, puntosOptimos);
                puntosObtenidos = Double.valueOf(utilMath.redondear(puntosObtenidos.doubleValue(), 0));

                balance objBalance = new balance();
                objBalance.setBal_IdIndicador(bal_idIndicador);
                objBalance.setBal_Indicador(bal_indicador);
                objBalance.setBal_IdArea(idArea);
                objBalance.setBal_Area(area);
                objBalance.setBal_identificaDepartamento(identificaDepartamento);
                objBalance.setBal_Anio(Anio);
                objBalance.setBal_Mes(mesGenerar);
                objBalance.setBal_ObjAnual(objAnual);
                objBalance.setBal_ObjCuatrimestre(bal_objCuatrimestre);
                objBalance.setBal_IncCuatrimestre(bal_incCuatrimestre);
                objBalance.setBal_CumCuatrimestre(cumCuatrimestre);
                objBalance.setBal_ObjAcumulado(objAcumulado);
                objBalance.setBal_IncAcumulado(incAcumulado);
                objBalance.setBal_CumAcumulado(cumAcumulado);
                objBalance.setBal_PuntosObtenidos(puntosObtenidos);
                objBalance.setBal_PuntosOptimos(puntosOptimos);
                objBalance.setBal_Medida(medida);
                objBalance.setBal_Operacion(operacion);

                arrayBalance.add(objBalance);
                objBalance = null;
            }
        }

        return arrayBalance;
    }

    public static double redondear(double numero, int decimales) {
        return Math.round(numero * Math.pow(10, decimales)) / Math.pow(10, decimales);

    }
}
