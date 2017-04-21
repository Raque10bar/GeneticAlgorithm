%Método que comprueba que haya al menos una ruta que una los nodos inicial
%y final
function ruta = hayAlgunaRuta(matrix, numNodos)
    
    %Hacemos un backtracking pero sin perder las filas que ya hemos
    %recorrido al volver atrás
    function backtracking(matrix, fila, numNodos)
        if ruta ~= true
            sigNodos = find(~cellfun('isempty',matrix(fila, :))) + 1;
            filRecorridas = [filRecorridas fila];
            if sum(sigNodos == numNodos) >= 1
                ruta = true;
                return;
            end
            for i = 1:length(sigNodos) 
                if ~(sum(filRecorridas == sigNodos(i)) >= 1) 
                    backtracking(matrix, sigNodos(i), numNodos);
                end
            end
        end
    end

    ruta = false;
    filRecorridas = [];
    backtracking(matrix, 1, numNodos); 
end