%Método que crea una matriz con las distancias entre los nodos a partir del
%array de distancias. 
function matrix = creaMatrizDistancias(distancias, dimen)
    %Creamos una matriz de 1s excepto la diagonal principal, la cual tiene 0s 
    matrix = 1 - diag(ones(1, dimen));

    %{ 
      Creamos una matriz que represente las distancias entre los nodos,
      considerando que la fila es el nodo de salida y la columna es el nodo
      de llegada. Para el caso de un array de distancias de longitud 3 la
      matriz quedaría:
    
      0      d(1,2) d(1,3)
      d(1,2) 0      d(2,3)
      d(1,3) d(2,3) 0 
    %}
    matrix = matrix';
    indxu = tril(matrix) == 1;
    matrix(indxu) = distancias;
    matrix = matrix';
    matrix(indxu) = distancias;
    
    %Eliminamos la última fila y la primera columna de la matriz y la
    %convertimos a un cell
    matrix = matrix(1:end-1, 2:end);
    matrix = num2cell(matrix);
end