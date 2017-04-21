%M�todo que calcula los �ngulos de inclinaci�n entre los nodos que est�n 
%unidos y elimina las rutas que no pueden ser recorridas sin salirnos del
%rango de bpv(blood pressure variation) establecido
function matrix = calculaAngulos(a1, a2, altitudes, matrix)
    syms a y;
    
    %Como hemos eliminado una columna, cada columna se corresponde al nodo
    %siguiente, por tanto para obtener el nodo hay que sumarle 1 al �ndice
    %de la columna
    colOffset = 1;

    %F�rmulas que calculan el seno y tangente inversos haciendo la
    %transformaci�n de grados a radianes
    calculaAsin(y) = vpa(asin(y) * (180/pi));
    calculaAtan(y) = vpa(atan(y) * (180/pi));
    
    %F�rmula que calcula cu�l es es m�ximo �ngulo de inclinaci�n que puede
    %subir un veh�culo llevando una aceleraci�n m�xima a. Se considera
    %positivo si la inclinaci�n es cuesta abajo y negativo si es cuesta
    %arriba.
    maxAng(a) = vpa(calculaAsin(a/9.8));
   
    maxAngArriba = maxAng(a1);
    maxAngAbajo = maxAng(a2);
    
    %Calculamos los �ngulos de inclinaci�n entre los nodos interconectados
    %y si superan los �ngulos de inclinaci�n m�ximos eliminamos la uni�n
    %entre los nodos y sustitu�mos los 0s de la matriz por listas vac�as.
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