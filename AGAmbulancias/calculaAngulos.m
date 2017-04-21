%Método que calcula los ángulos de inclinación entre los nodos que están 
%unidos y elimina las rutas que no pueden ser recorridas sin salirnos del
%rango de bpv(blood pressure variation) establecido
function matrix = calculaAngulos(a1, a2, altitudes, matrix)
    syms a y;
    
    %Como hemos eliminado una columna, cada columna se corresponde al nodo
    %siguiente, por tanto para obtener el nodo hay que sumarle 1 al índice
    %de la columna
    colOffset = 1;

    %Fórmulas que calculan el seno y tangente inversos haciendo la
    %transformación de grados a radianes
    calculaAsin(y) = vpa(asin(y) * (180/pi));
    calculaAtan(y) = vpa(atan(y) * (180/pi));
    
    %Fórmula que calcula cuál es es máximo ángulo de inclinación que puede
    %subir un vehículo llevando una aceleración máxima a. Se considera
    %positivo si la inclinación es cuesta abajo y negativo si es cuesta
    %arriba.
    maxAng(a) = vpa(calculaAsin(a/9.8));
   
    maxAngArriba = maxAng(a1);
    maxAngAbajo = maxAng(a2);
    
    %Calculamos los ángulos de inclinación entre los nodos interconectados
    %y si superan los ángulos de inclinación máximos eliminamos la unión
    %entre los nodos y sustituímos los 0s de la matriz por listas vacías.
    for i=1:size(matrix,1)
        for j=1:size(matrix,2)
            distancia = matrix{i, j}(1);
            if distancia ~= 0
                ang = double(calculaAtan((altitudes(i) - altitudes(j + ...
                    colOffset)) / distancia));
                if ang < maxAngArriba || ang > maxAngAbajo
                    matrix{i, j} = [];
                else
                    matrix{i, j} = [distancia, ang];
                end
            else 
                matrix{i, j} = [];
            end
        end
    end
end