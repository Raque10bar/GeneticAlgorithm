%Método que crea los individuos iniciales
function individuos = creaPoblacionInicial(matrix, numIndividuos, numNodos)
    individuos = num2cell(zeros(numIndividuos, 1));
    numIndiv = 1;
    for i=1:numIndividuos
        nodos = 1;
        %Para cada fila empezando por la 1, cogemos los siguientes nodos
        %posibles y escogemos uno aleatoriamente (que no haya sido elegido 
        %anteriormente) hasta que se llega al nodo de destino. Si no hay 
        %nodos siguientes posibles y no se ha llegado al nodo final, se 
        %vuelve a empezar
        while 1
            sigNodos = find(~cellfun('isempty',matrix(nodos(end), :))) + 1;
            sigNodos = sigNodos(~ismember(sigNodos, nodos));
            if isempty(sigNodos) 
                nodos = 1;
            else
                selecc = sigNodos(randi(length(sigNodos)));
                if selecc == numNodos
                    break;
                end
                nodos = [nodos selecc]; 
            end
        end
        %Eliminamos el 1 de los individuos, el último nodo tampoco aparece
        individuos{numIndiv} = nodos(2:end);
        numIndiv = numIndiv + 1;
    end
end