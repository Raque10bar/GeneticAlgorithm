function [At1, pesos] = seleccionNatural(St, At, aptitudes, numIndividuos, pesos)
    
    %Copiamos a At todos los individuos de St y At cuya aptitud sea 0
    %(rutas óptimas). Si faltan individuos para llegar al nº de individuos,
    %escogemos las mejores rutas de St hasta llegar al nº de individuos
    %(sin repetir las de aptitud 0 que ya escogimos antes). Si sobran, se 
    %eliminan aleatoriamente hasta quedarnos con el nº de individuos
    
    individuos = [St; At];
    indx0 = aptitudes == 0;
    At1 = individuos(indx0);
    tam = size(At1,1);
    
    pesosAt = pesos(indx0, :);
    if tam < numIndividuos
        [~, indx] = sort(aptitudes(1:numIndividuos));
        indx(aptitudes(indx) == 0) = [];
        At1 = [At1; St(indx(1:numIndividuos - tam))];
        pesosAt = [pesosAt; pesos(indx(1:numIndividuos - tam), :)] ;
    else
        indx = randperm(tam, tam - numIndividuos);
        At1(indx) = [];
        pesosAt(indx, :) = []; 
    end
    if (size(pesos,1) > numIndividuos)
        pesos(numIndividuos+1:end, :) = pesosAt;
    else
        pesos = [pesos; pesosAt];
    end
end