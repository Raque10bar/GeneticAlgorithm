function alfaProbabilidades = calculaAlfaProbabilidades(aptitudes, decimales)
    
    %Hallamos las aptitudes teniendo en cuenta que queremos minimizar la
    %funci�n de aptitud
    aptitudesInversas = 1 ./ (aptitudes + 1);
    totalAptsInvs = sum(aptitudesInversas);
    
    %Hallamos las probabilidades y las elevamos al n� de decimales al que 
    %queremos redondear para convertirlas en n�meros enteros
    probabilidades = (aptitudesInversas./totalAptsInvs).*10^decimales;
    
    %Redondeamos hacia el n� entero anterior
    alfaProbabilidades = floor(probabilidades);
    
    %Hallamos las diferencias en decimales entre los valor originales y los
    %redondeados, y las ordenamos de mayor a menor, guardando el orden de
    %�ndices que tendr�an en el array redondeado sin ordenar
    [diferencias, indices] = sort(probabilidades - alfaProbabilidades, 'descend');
    
    %Redondeamos la suma de las diferencias que ser� lo que tenemos que 
    %sumar para que se iguale a la suma original y cogemos ese n�mero de 
    %�ndices del array de �ndices
    indices = indices(1:round(sum(diferencias)));
    
    %Sumamos 1 a esos �ndices y los dejamos multiplicados para calcular las
    %casillas en la ruleta m�s f�cilmente
    alfaProbabilidades(indices) = alfaProbabilidades(indices) + 1;
   
end