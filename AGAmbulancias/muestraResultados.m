function respuesta = muestraResultados(registro, parar, numGens, decimales)
    
    %Mostramos el n� de decimales deseado
    formato = sprintf('%%.%df', decimales);
    
    %Decimos si el algoritmo ha parado seg�n las condiciones puestas o no
    if parar
        respuesta = sprintf(['El algoritmo se ha enfriado en la generaci�n '...
           '%d.\r\n'], numGens);
    else
        respuesta = sprintf(['El algoritmo no se ha enfriado, se han realizado '...
            '%d generaciones.\r\n'], numGens);
    end
    
    %Mostramos las rutas �ptimas de la �ltima generaci�n y sus pesos
    respuesta = [respuesta, sprintf('Las rutas �ptimas encontradas son:\r\n')];
    
    rutas = registro{numGens};
    rutas = [cellfun(@(x)(mat2str(x)),rutas(:,1),'uniformoutput',false), ...
        rutas(:, 2:3)];
    
    formatoRuta = ['- %s, con un tiempo total de ', formato, 's y una bpv de ',...
        formato, 'mmHg*s.\n'];
    for i=1:size(rutas,1)
        respuesta = [respuesta, sprintf(formatoRuta, rutas{i, :})];
    end
    
    medias = cell2mat(registro(1:numGens, 4));
    f1 = medias(:,1)';
    f2 = medias(:,2)';
    
    %Mostramos y formateamos una gr�fica  
    plot(1:numGens, f1 + f2, '--k');
    hold on;
    plot(1:numGens, f1, 'b');
    hold on;
    plot(1:numGens, f2, 'r');
    hold on;
    
    title('Evoluci�n de la media de los pesos de cada generaci�n');
    xlabel('Generaciones');
    ylabel('Media de los pesos');
     
    xlim([1 numGens]); 
    legend('Total (suma de t y bpv)', 'Media de tiempo de las rutas',...
        'Media de bpv de las rutas','Location','southeast');
    
    hold off;
end