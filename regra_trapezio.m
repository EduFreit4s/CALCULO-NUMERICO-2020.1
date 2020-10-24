% -----------------------------------------------------
% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% CÁLCULO NUMÉRICO 2020
% INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS
% JOÃO PESSOA, 24/10/2020.
% AUTOR: JOSÉ E F BATISTA
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

n = 0;
while true  
  soma = 0;
  n=n+1;
  h=(b-a)/n;
  x=a:h:b;
  
  ######### MUDAR FUNÇÃO AQUI #########
  
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
  #fprintf("N = %i, Integral = %.11f, Erro: = %.11f \n", n, Ir, E); 
  if(E < tol), break; end
  
end

fprintf("<INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS>\n\n")
fprintf("Tolerância: %e\n", tol);
fprintf("Integral exata = %.11f \n", Iexato);
fprintf("Integral numérica = %.11f\nErro de truncamento: %.11f\n\n",soma,ET);
fprintf("Integral composta = %.11f\nErro |exato-numérico| = %.11f\n",Ir,E);
fprintf("Número de trapézios: %i\n", n); 
