function matrix = calculaMatrizPesos(mina, maxa, minvel, maxvel, matrix)
    syms a1 a2 x1 x3 g ang t y v a;
    vg = 9.8;
    
    %Fórmula que calcula el seno de un ángulo transformándolo primero a
    %radianes
    calculaSin(y) = vpa(subs(sin(y), y, y * (pi/180))); 
    
    %Fórmulas que calculan el mínimo tiempo que se tarda en alcanzar la
    %velocidad máxima desde la velocidad mínima y viceversa, según el ángulo
    %de inclinación y la aceleración
    calculaT1(a1, x1, x3, g, ang) = vpa((x1 - x3) / (-a1 + g * calculaSin(ang)));
    calculaT3_T2(a2, x1, x3, g, ang) = vpa((x3 - x1) / (-a2 + g * calculaSin(ang)));
    
    %Ecuación del MRUA
    calculaDistancia(v, a, t, g, ang) = vpa(v*t + 1/2*(-a + g*calculaSin(ang))*t^2);

    %Cojo las posiciones de la matriz que representan conexiones entre los
    %nodos
    aristas = find(~cellfun('isempty',matrix));
    matrixAristas = matrix(aristas);
    
    %Calculamos a qué modelo pertenece cada arista según su ángulo de
    %inclinación y su distancia y calculamos sus pesos (tiempo y bpv) según
    %el modelo al que pertenezca
    for i=1:length(aristas)
        arista = matrixAristas{i}; 
        vang = arista(2);
        t1 = calculaT1(mina, maxvel, minvel, vg, vang);
        t3_t2 = calculaT3_T2(maxa, maxvel, minvel, vg, vang);
        minDistancia = calculaDistancia(minvel, mina, t1, vg, vang) + ...
            calculaDistancia(maxvel, maxa, t3_t2, vg, vang);
        
        if arista(1) > minDistancia
            %Modelo 1, le da tiempo a alcanzar la velocidad máxima y a
            %mantenerla (los valores coinciden con los del modelo, ya les
            %tengo calculados)
            modelo = [t1, t3_t2, minDistancia];
        else
            %Modelo 2, no hay distancia suficiente para que alcance y
            %mantenga la velocidad máxima
            modelo = [];
        end
        [tiempo, bpv] = calculaPesos(mina, maxa, minvel, maxvel, modelo, arista);
        matrixAristas{i} = [tiempo, bpv];
    end
    %Colocamos los valores de las aristas en sus posiciones originales en
    %la matriz
    matrix(aristas) = matrixAristas;
end