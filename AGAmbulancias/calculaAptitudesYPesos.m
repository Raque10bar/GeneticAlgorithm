%Método que calcula las aptitudes y los pesos de los individuos de los 
%conjuntos St y At en ese orden, según la función de aptitud que hayamos 
%escogido
function [aptitudes, sumaPesos] = calculaAptitudesYPesos(St, At, matrix, ...
    numNodos, funcApt, articulo)
    
    individuos = [St; At];
    sumaPesos = zeros(length(individuos), 2);
    for i=1:size(individuos,1)
        individuo = individuos{i};
        tiempoYBpvTotal = [0 0];
        
        %Calculamos los pesos totales de la ruta sumando los pesos de cada
        %arista
        fil = 1;
        for j=1:length(individuo) + 1
           if j == length(individuo) + 1
               col = numNodos - 1;
           else
               col = individuo(j) - 1;
           end
           tiempoYBpvTotal = tiempoYBpvTotal + matrix{fil, col};
           fil = col + 1;
        end
        sumaPesos(i, :) = tiempoYBpvTotal;
    end 
    
    if funcApt ~= articulo
        aptitudes = (sumaPesos(:,1) + sumaPesos(:,2))';
    else
        %Ordenamos las aptitudes según la suma de sus pesos, de menor suma a
        %mayor suma
        aptitudes = [sumaPesos sumaPesos(:,1) + sumaPesos(:,2)]; 
        [~, indx] = sort(aptitudes(:, 3));
        aptitudes = aptitudes(indx, :);

        %Tope indica la posición de la primera ruta cuya suma de los pesos es
        %mayor que la actual, miramos las rutas a partir de esa posición
        %porque las que tienen la suma menor o igual no cumplen la condición
        %seguro. La condición para contar una ruta como 'peor' es que al menos
        %uno de sus pesos sea mayor y que el otro sea como mínimo igual.

        tope = 2;
        valAptitudes = zeros(1, size(aptitudes,1));
        for i=1:size(aptitudes,1)
            contador = 0;
            aptitud = aptitudes(i, :);
            suma = aptitud(3);

            while (aptitudes(tope, 3) <= suma) && (tope < size(aptitudes,1))
                tope = tope + 1;
            end

            for j=tope:size(aptitudes,1)
                aptitud2 = aptitudes(j,:);
                if ((aptitud2(1) >= aptitud(1)) && (aptitud2(2) >= aptitud(2))) ...
                        && ~((aptitud(1) == aptitud2(1)) && (aptitud(2) == aptitud2(2)))
                    contador = contador + 1;
                end
            end
            valAptitudes(i) = contador;
        end
        aptitudes = [aptitudes valAptitudes'];

        %Ahora hacemos la cuenta al revés, contando las rutas 'mejores', solo
        %que en vez de sumar 1 por cada una, sumamos el valor de la ruta que
        %hemos calculado antes

        tope = size(aptitudes,1) - 1;
        valAptitudes = zeros(1, size(aptitudes,1));
        for i=size(aptitudes,1):-1:1
            contador = 0;
            aptitud = aptitudes(i, :);
            suma = aptitud(3);

            while (aptitudes(tope, 3) >= suma) && (tope > 1)
                tope = tope - 1;
            end

            for j=tope:-1:1
                aptitud2 = aptitudes(j,:);
                if ((aptitud2(1) <= aptitud(1)) && (aptitud2(2) <= aptitud(2))) ...
                        && ~((aptitud(1) == aptitud2(1)) && (aptitud(2) == aptitud2(2)))
                    contador = contador + aptitud2(4);
                end
            end
            valAptitudes(i) = contador;
        end

        %Colocamos las aptitudes en su orden original
        aux(indx)= valAptitudes;
        aptitudes = aux;
    end
end