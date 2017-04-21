function St1 = hazCrossover(At, numIndividuos, probCrossover)
    St1 = At;
    
    %Hallamos los índices lógicos de los individuos que van a ser
    %emparejados, y si son impares cambiamos un 1 por 0 o al revés
    %aleatoriamente
    indices = rand(1,numIndividuos) <= probCrossover;
    if mod(sum(indices), 2) ~= 0
        indice = randi(numIndividuos);
        indices(indice) = ~indices(indice);
    end
    
    %Cogemos los individuos que marcan esos índices y formamos las parejas
    grupoCrossover = St1(indices);
    ordenParejas = randperm(sum(indices));
    [~,pairIndex] = sort(ordenParejas);
    
    %Vamos cruzando los individuos en el orden dado y vamos sustituyendo a
    %los anteriores por los nuevos en el grupo de crossover
    for i = 1:2:sum(indices)
        grupoCrossover(pairIndex(i:i+1)) = singlePointCrossover(grupoCrossover{pairIndex(i)}, ...
           grupoCrossover{pairIndex(i + 1)}); 
    end
    St1(indices) = grupoCrossover;
end