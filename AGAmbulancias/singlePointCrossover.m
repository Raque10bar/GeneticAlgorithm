function hijos = singlePointCrossover(padre1, padre2)
    
    %Calculamos los nodos comunes en los padres, y excluimos aquellos que
    %al hacer el cruce puedan provocar repetición de nodos en los hijos
    [comunes, indxp1, indxp2] = intersect(padre1, padre2);
    for i=1:length(comunes)
        pos1 = indxp1(i);
        pos2 = indxp2(i);
        
        if ~isempty(intersect(padre1(1:pos1-1), padre2(pos2+1:end))) || ...
                ~isempty(intersect(padre2(1:pos2-1), padre1(pos1+1:end)))
            comunes(i) = 0;
            indxp1(i) = 0;
            indxp2(i) = 0;
        end
    end
    comunes(comunes == 0) = [];
    indxp1(indxp1 == 0) = [];
    indxp2(indxp2 == 0) = [];
    
    %Si no tenemos nodos para hacer el cruce, devolvemos a los padres, sino
    %realizamos el crossover y devolvemos a los hijos
    if isempty(comunes)
        hijos = {padre1; padre2};
    else
        indxNodo = randi(length(comunes));        
        pos1 = indxp1(indxNodo);
        pos2 = indxp2(indxNodo);
        hijo1 = [padre1(1:pos1) padre2(pos2+1:end)];
        hijo2 = [padre2(1:pos2) padre1(pos1+1:end)];
        hijos = {hijo1; hijo2};
    end      
end