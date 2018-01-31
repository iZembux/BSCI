/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author REDES
 */
public class utilBalance {

    public Double calcularCumplimientoAcumulado(Double incAcumulado, Double objAcumulado, String operacion) {
        Double cumAcumulado = 0.0;
        Double cumAcumulado2 = 0.0;

        
            if (operacion.equals("mas")) {
                if (objAcumulado != 0) {
                    cumAcumulado = ((incAcumulado - objAcumulado) / objAcumulado);
                    cumAcumulado = (1 + cumAcumulado) * 100;
                } else {
                    cumAcumulado = 100.0;
                }
            } else
                if  (operacion.equals("menos")) {
                if ( incAcumulado != 0) {
                    cumAcumulado = ((incAcumulado - objAcumulado)/ objAcumulado);
                    if (cumAcumulado > 1 )
                    {                       
                       cumAcumulado = cumAcumulado2;
                    }
                    else{
                    cumAcumulado = (1 - cumAcumulado) * 100;
                    }
                } else {
                    cumAcumulado = 100.0;
                }
            }
            else 
                if  (operacion.equals("pos")) {
                if ( incAcumulado < objAcumulado ) { 
                    cumAcumulado = 100.0;
                   
                } else {
                     cumAcumulado = (incAcumulado - objAcumulado)/ 10;
                     cumAcumulado = 1 - cumAcumulado;
                     cumAcumulado = cumAcumulado * 100;
                     
                }
            }else
                     if  (operacion.equals("dias")) {
                if ( incAcumulado != 0) {
                    cumAcumulado = ((incAcumulado - objAcumulado)/ objAcumulado);
                    if (cumAcumulado > 1 )
                    {                       
                       cumAcumulado = cumAcumulado2;
                    }
                    else if (cumAcumulado < 0)
                            {
                    cumAcumulado = (1 + cumAcumulado) * 100;
                    }
                    else  {
                     cumAcumulado = (1 - cumAcumulado) * 100;
                }
                }   else {
                        cumAcumulado = 100.0;
                        }
            
                     }
            
        
        
        return cumAcumulado;
    }

    public Double calcularPuntosObtenidos(Double cumAcumulado, Double puntosOptimos) {
        Double puntosObtenidos = 0.0;
        double aux = (cumAcumulado / 100) * puntosOptimos;
        if (aux < 0) {
            puntosObtenidos = 0.0;
        } else {
            if (aux > puntosOptimos) {
                puntosObtenidos = puntosOptimos;
            } else {
                puntosObtenidos = aux;
            }
        }
        return puntosObtenidos;
    }
}

//function calcular_puntosObtenidos($cum_acumulado, $puntos_optimos) {
//    $aux = ($cum_acumulado / 100) * $puntos_optimos;
//    if ($aux < 0)
//        $puntos_obtenidos = 0;
//    else {
//        if ($aux > $puntos_optimos)
//            $puntos_obtenidos = $puntos_optimos;
//        else {
//            $puntos_obtenidos = $aux;
//        }
//    }
//    return $puntos_obtenidos;
