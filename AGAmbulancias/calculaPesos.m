function [tiempo, bpv] = calculaPesos(mina, maxa, minvel, maxvel, modelo, arista)

    syms a1 a2 x1 x2 x3 t1 t2 t3_t2 t3 b g ang md d y dis;
    vg = 9.8;
    digits(6);
    calculaSin(y) = vpa(subs(sin(y), y, y * (pi/180))); 
    
    %Modelo 1 del artículo, el vehículo alcanza la velocidad máxima y la
    %mantiene
    calculaX2(md, d, x1) = vpa ((d - md) / x1);
    calculaT2(t1, x2) = vpa(t1 + x2);
    calculaT3_1(t2, t3_t2) = vpa(t2 + t3_t2);
    
    %Modelo 2 del artículo, el vehículo no tiene tiempo para llegar y
    %mantener la velocidad máxima
    calculaB(a1, a2, x3, g, ang, dis) = vpa( ((-a2 + g * calculaSin(ang)) * x3 + sqrt(x3^2 * ...
    (a2 - a1)^2 + 2 * dis * (-a1 + g * calculaSin(ang)) * (-a2 + g * calculaSin(ang)) * ...
    (a1 - a2))) / (-a1 + g * calculaSin(ang)) );
    calculaT1_2(a1, a2, x3, b) = vpa((x3 - b) / (a1 - a2));
    calculaT3_2(a2, x3, b, g, ang) = vpa((x3 - b) / (-a2 + g * calculaSin(ang)));
    
    %Fórmulas para el cálculo del bpv según el ángulo de la pendiente y el
    %modelo
    calculaY_1_pos(t1, t2, t3, a1, a2, g, ang) = vpa(abs(3.98*a1*t1) + ...
        (abs(1.5*(g*calculaSin(ang))^2 + 3.98*g*calculaSin(ang))*(t2-t1))...
        + (abs(1.5*a2^2+3.98*a2))*(t3 - t2));
    calculaY_1_neg(t1, t2, t3, a1, a2, g, ang) = vpa(abs(3.98*a1*t1) + ...
        (abs(3.98*g*calculaSin(ang))*(t2-t1))...
        + (abs(1.5*a2^2+3.98*a2))*(t3 - t2));
    calculaY_2 (t1, t3, a1, a2) = vpa(abs(3.98*a1*t1) + (abs(1.5*a2^2+3.98*a2))*(t3 - t1));
    
    %Modelo 1
    if ~isempty(modelo)
        vt1 = modelo(1);
        vt2 = calculaT2(vt1, calculaX2(modelo(3), arista(1), maxvel));
        vt3= calculaT3_1(vt2, modelo(2));
        tiempo = double(vt3);
        if arista(2) >= 0
            bpv = double(calculaY_1_pos(vt1, vt2, vt3, mina, maxa, vg, arista(2)));
        else
            bpv = double(calculaY_1_neg(vt1, vt2, vt3, mina, maxa, vg, arista(2)));
        end
    %Modelo 2    
    else
        vb = calculaB(mina, maxa, minvel, vg, arista(2), arista(1));
        vt1 = calculaT1_2(mina, maxa, minvel, vb);
        vt3 = calculaT3_2(maxa, minvel, vb, vg, arista(2));
        tiempo = double(vt3);
        bpv = double(calculaY_2(vt1, vt3, mina, maxa));
    end
    
end