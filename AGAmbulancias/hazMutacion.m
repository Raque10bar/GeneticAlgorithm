function St = hazMutacion(St, matrix, numNodos, probMutacion, funcApt, articulo)
    
    %Seleccionamos los índices que van a mutar, excluyendo 2 rutas óptimas,
    %y colocamos los individuos mutados en sus posiciones originales
    [aptitudes, ~] = calculaAptitudesYPesos(St, {}, matrix, numNodos, ...
        funcApt, articulo);
    [~, ordenApts] = sort(aptitudes);
    indxNoElite = ordenApts(3:end);
    StNoElite = St(indxNoElite);
    
    indicesMutacion = rand(1, size(StNoElite,1)) <= probMutacion;
    StMut = StNoElite(indicesMutacion);
    for i=1:size(StMut,1)
       StMut{i} = muta(StMut{i}, matrix, numNodos); 
    end
    
    StNoElite(indicesMutacion) = StMut;
    St(indxNoElite) = StNoElite;
end