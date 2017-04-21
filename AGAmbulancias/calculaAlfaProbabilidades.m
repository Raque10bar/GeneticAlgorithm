function alfaProbabilidades = calculaAlfaProbabilidades(aptitudes, decimales)
    
    %Hallamos las aptitudes teniendo en cuenta que queremos minimizar la
    %función de aptitud
    aptitudesInversas = 1 ./ (aptitudes + 1);
    totalAptsInvs = sum(aptitudesInversas);
    
    %Hallamos las probabilidades y las elevamos al nº de decimales al que 
    %queremos redondear para convertirlas en números enteros
    probabilidades = (aptitudesInversas./totalAptsInvs).*10^decimales;
    
    %Redondeamos hacia el nº entero anterior
    alfaProbabilidades = floor(probabilidades);
    
    %Hallamos las diferencias en decimales entre los valor originales y los
    %redondeados, y las ordenamos de mayor a menor, guardando el orden de
    %índices que tendrían en el array redondeado sin ordenar
    [diferencias, indices] = sort(probabilidades - alfaProbabilidades, 'descend');
    
    %Redondeamos la suma de las diferencias que será lo que tenemos que 
    %sumar para que se iguale a la suma original y cogemos ese número de 
    %índices del array de índices
    indices = indices(1:round(sum(diferencias)));
    
    %Sumamos 1 a esos índices y los dejamos multiplicados para calcular las
    %casillas en la ruleta más fácilmente
    alfaProbabilidades(indices) = alfaProbabilidades(indices) + 1;
   
end