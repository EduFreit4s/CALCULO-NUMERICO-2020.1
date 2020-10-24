% -----------------------------------------------------
% INSTITUTO FEDERAL DA PARA�BA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA EL�TRICA
% C�LCULO NUM�RICO 2020
% INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS
% JO�O PESSOA, 24/10/2020.
% AUTOR: JOS� E F BATISTA
% -----------------------------------------------------
clear all, close all, clc, 

tol = 1E-6; 

  ######### MUDAR LIMITES AQUI #########
  
a=0; b=pi/4;
%B  a=-2; b=-1;  
%C  a=-2; b=2;

  ######### MUDAR IEXATO AQUI #########

Iexato = -0.5*log(-2*sqrt(2)+3);     
%B  Iexato = (12*(log(2)-log(3))+7)/6;   
%C  Iexato = (sqrt(pi)*erf(sqrt(2))-sqrt(pi)*erf(-sqrt(2)))/sqrt(2); 

n = 0; integral(1) = 0;

while true  
  soma = 0;
  n=n+1;
  h=(b-a)/n;
  x=a:h:b;
  
  ######### MUDAR FUN��O AQUI #########
  
y = (1./cos(x));                     
%B  y = x.^2./((x-1).^2);  
%C  y = e.^(-x.^2./2);    
  
  for i=1:n
    soma=soma+(h/2)*(y(i)+y(i+1)); 
  end
  
  ######### MUDAR ERRO DE TRUCAMENTO AQUI #########
  
ET = -((b-a)^3/(12*n^2))*(1+sin(pi/4)^2)/cos(pi/4)^3; 
%B  ET = -((b-a)^3/(12*n^2))*(2*(2*(-2)+1)/((-2)-1)^4);
%C  ET = -((b-a)^3/(12*n^2))*3/e^2;
  
  Ir=soma+ET;
  E=abs(Iexato-Ir);
  integral(n+1) = Ir;
 
  if(E < tol), 
    break; 
  else, 
    %fprintf("N = %i, Integral = %.11f, Erro: = %.11f \n", n, Ir, E); 
  end
  
end

fprintf("<INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS>\n\n")
fprintf("Toler�ncia: %.e\n", tol);
fprintf("Integral exata = %.11f \n", Iexato);
fprintf("Integral num�rica = %.11f\nErro de truncamento: %.11f\n\n",soma,ET);
fprintf("Integral composta = %.11f\nErro |exato-num�rico| = %.11f\n",Ir,E);
fprintf("N�mero de trap�zios: %i\n", n);  ## NUMERO N