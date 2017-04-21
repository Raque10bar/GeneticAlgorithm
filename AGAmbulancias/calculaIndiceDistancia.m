%Método que calcula qué posición le corresponde en el índice de distancias
%a la distancia entre el nodo1 y el nodo2
function pos = calculaIndiceDistancia(nodo1, nodo2, numNodos)
    syms k;
    pos = int64(symsum(k, k, numNodos - nodo1 + 1, numNodos - 1)) + (nodo2 - nodo1); 
end