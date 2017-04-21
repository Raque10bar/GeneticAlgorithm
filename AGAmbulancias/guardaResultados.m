function registroGeneraciones = guardaResultados(St, At, aptitudes, numIndividuos, pesos, registroGeneraciones, generacion, funcApt, articulo)    
    
    %Seleccionamos las rutas óptimas según la función de aptitud que
    %hayamos utilizado
    if funcApt == articulo
        indxOpt = aptitudes(numIndividuos+1:end) == 0;   
    else
        [~, indxOpt] = sort(aptitudes(numIndividuos+1:end));
    end
    
    %Cogemos las no repetidas, en caso de que hayamos usado la aptitud como
    %suma, cogemos las 3 primeras no repetidas
    rutasOptimas = At(indxOpt);
    rutasOptimasSt = cellfun(@(x)(mat2str(x)),rutasOptimas,'uniformoutput',false);
    [~, indxOptUniq, ~] = unique(rutasOptimasSt, 'stable');
    
    if funcApt ~= articulo && length(indxOptUniq) > 3
        indxOptUniq = indxOptUniq(1:3);
    end

    %Cogemos los pesos de esas rutas
    pesosOpt = pesos(numIndividuos+1:end, :);
    pesosOpt = pesosOpt(indxOpt, :);
    optimas = [rutasOptimas(indxOptUniq), num2cell(pesosOpt(indxOptUniq,:))];
      
    %Cogemos la ruta de menor tiempo y la de menor bpv
    individuos = [St; At];
    [~, indxMinT] = min(pesos(:,1));
    [~, indxMinBpv] = min(pesos(:,2));
    mejort = [individuos(indxMinT), num2cell(pesos(indxMinT,:))];
    mejorbpv = [individuos(indxMinBpv), num2cell(pesos(indxMinBpv,:))];
    
    %Cogemos la media de los pesos de las rutas de la generación
    mediaPesos = [(sum(pesos(:,1) / size(pesos,1))) , (sum(pesos(:,2) / size(pesos,1)))];
    
    %Guardamos todo en el registro
    registroGeneraciones{generacion, 1} = optimas;
    registroGeneraciones{generacion, 2} = mejort;
    registroGeneraciones{generacion, 3} = mejorbpv;
    registroGeneraciones{generacion, 4} = mediaPesos;
    
end