%M�todo que calcula la m�nima y m�xima aceleraci�n que se puede tolerar
%sobre el cuerpo del paciente para mantener su variaci�n sangu�nea dentro del 
%intervalo [-maxbpv, maxbpv]. Se considera positiva la aceleraci�n que va
%de pies a cabeza (maxa) y negativa la que va de cabeza a pies (mina)
function [mina, maxa] = aceleracionMinYMax(maxbpv)
    syms bpv;
    minbpv = -maxbpv;
    
    %F�rmula experimental de la variaci�n sangu�nea seg�n la aceleraci�n 
    %ejercida sobre el cuerpo 
    acelValNeg(bpv) = vpa(bpv / 3.98);
    acelValPos(bpv) = vpa((-3.98 + sqrt(3.98^2 + 4*1.5*bpv)) / 3);
    
    mina = acelValNeg(minbpv);
    maxa = acelValPos(maxbpv);   
end