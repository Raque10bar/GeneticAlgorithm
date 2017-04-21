%Método que calcula la mínima y máxima aceleración que se puede tolerar
%sobre el cuerpo del paciente para mantener su variación sanguínea dentro del 
%intervalo [-maxbpv, maxbpv]. Se considera positiva la aceleración que va
%de pies a cabeza (maxa) y negativa la que va de cabeza a pies (mina)
function [mina, maxa] = aceleracionMinYMax(maxbpv)
    syms bpv;
    minbpv = -maxbpv;
    
    %Fórmula experimental de la variación sanguínea según la aceleración 
    %ejercida sobre el cuerpo 
    acelValNeg(bpv) = vpa(bpv / 3.98);
    acelValPos(bpv) = vpa((-3.98 + sqrt(3.98^2 + 4*1.5*bpv)) / 3);
    
    mina = acelValNeg(minbpv);
    maxa = acelValPos(maxbpv);   
end