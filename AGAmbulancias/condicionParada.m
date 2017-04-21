function parar = condicionParada(gen, gensParada, porcentaje, registro)
    %Comprobamos si las últimas medias se incrementan al menos en porcentaje, 
    %si no paramos
    if gen < gensParada
        parar = false;
    else
        medias = cell2mat(registro(gen - (gensParada-1):gen, 4));
        medias = medias(:,1) + medias(:,2);
        medias = medias';
        porcentajes = ((medias(2:end) * 100) ./ medias(1:end-1)) - 100;  
        if min(porcentajes) > -porcentaje
            parar = true;
        else
            parar = false;
        end
    end
end