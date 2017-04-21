
function [registroGeneraciones, respuesta] = algoritmoGenetico(numIndividuos,...
    numGeneraciones, gensParada, porcentaje, probCrossover, probMutacion,...
    matrix, funcApt, funcSel, decimales)

    numNodos = 55;
    articulo = 0;
    
    if sum(isnan([gensParada, porcentaje])) >= 1
        condicion = false;
        parar = false;
    else
        condicion = true;
    end
    
    St = creaPoblacionInicial(matrix, numIndividuos, numNodos);
    registroGeneraciones = cell(numGeneraciones, 4);
    At = {};
    
    for i=1:numGeneraciones
        
        [aptitudes, pesos] = calculaAptitudesYPesos(St, At, matrix, ...
            numNodos, funcApt, articulo);
        
        if funcSel ~= articulo
            [At, pesos] = seleccionRuleta(St, At, aptitudes, numIndividuos,...
                decimales, pesos);
        else
            [At, pesos] = seleccionNatural(St, At, aptitudes, numIndividuos,...
                pesos);
        end

        registroGeneraciones = guardaResultados(St, At, aptitudes, ...
            numIndividuos, pesos, registroGeneraciones, i, funcApt, articulo);
        
        if condicion
            parar = condicionParada(i, gensParada, porcentaje, registroGeneraciones);
        end
        
        if i == numGeneraciones || parar
            break;
        end
        St = hazCrossover(At, numIndividuos, probCrossover);
        St = hazMutacion(St, matrix, numNodos, probMutacion, funcApt, articulo);
    end
    registroGeneraciones = registroGeneraciones(1:i, :);
    respuesta = muestraResultados(registroGeneraciones, parar, i, decimales);
end

    