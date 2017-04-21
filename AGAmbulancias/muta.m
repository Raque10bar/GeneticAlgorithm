function individuo = muta(individuo, matrix, numNodos)

    %Escogemos el índice del nodo que va a mutar aleatoriamente, y cogemos 
    %el nodo anterior y el siguiente a ese índice
    indxNodo = randi(length(individuo));
    
    inicio = 1;
    fin = numNodos;
    if indxNodo > 1
        inicio = individuo(indxNodo - 1);
    end
    if indxNodo < length(individuo)
        fin = individuo(indxNodo + 1);
    end
    
    %Generamos una nueva ruta que una esos nodos, no repitiendo los que ya
    %tiene el individuo
    nodos = inicio;
    visitados = [individuo(1:indxNodo-1), individuo(indxNodo+2:end)]; 
    while 1
        if nodos(end) == numNodos
            nodos = inicio;
            visitados = [individuo(1:indxNodo-1), individuo(indxNodo+2:end)];
        end
        sigNodos = find(~cellfun('isempty',matrix(nodos(end), :))) + 1;
        sigNodos = sigNodos(~ismember(sigNodos, visitados));
        if isempty(sigNodos) 
            nodos = inicio;
            visitados = [individuo(1:indxNodo-1), individuo(indxNodo+2:end)];
        else
            selecc = sigNodos(randi(length(sigNodos)));
            if selecc == fin
                break;
            end
            nodos = [nodos selecc];
            visitados = [visitados selecc];
        end
    end
    
    %Sustituímos el nodo seleccionado para mutar por la nueva ruta que une
    %los nodos anterior y siguiente
    individuo = [individuo(1:indxNodo-1), nodos(2:end), individuo(indxNodo+1:end)];
end