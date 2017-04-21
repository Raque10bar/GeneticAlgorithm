function [At1, pesos] = seleccionRuleta(St, At, aptitudes, numIndividuos,... 
decimales, pesos)
    
    alfaProbabilidades = calculaAlfaProbabilidades(aptitudes, decimales);
    individuos = [St; At];
    
    %Calculamos las casillas de la ruleta calculando el máximo nº hasta el
    %que se "cae" en la casilla, haciendo la suma de los máximos anteriores
    casillas = zeros(1, length(alfaProbabilidades));
    for i = 1:length(alfaProbabilidades)
        casillas(i) = sum(alfaProbabilidades(1:i));
    end
    
    %Hacemos un array de aleatorios de tantos individuos como tengamos, 
    %ordenados de menor a mayor
    tiradas = sort(randi([1,10^decimales], 1, numIndividuos));
    
    %Miramos en que casilla cae cada tirada, como están ordenadas de menor
    %a mayor, cada vez que la tirada sea mayor avanzamos el índice de las
    %casillas, y "seleccionamos" al individuo al que corresponde la casilla
    pesosAt1 = pesos(numIndividuos+1:end, :);
    
    At1 = cell(size(At));
    indice = 1;
    for i = 1:length(tiradas)
        while tiradas(i) > casillas(indice)
            indice = indice + 1;
        end
        At1(i,:) = individuos (indice,:);
        pesosAt1(i, :) = pesos(indice, :);
    end
    
    if (size(pesos,1) > numIndividuos)
        pesos(numIndividuos+1:end, :) = pesosAt1;
    else
        pesos = [pesos; pesosAt1];
    end
    
end