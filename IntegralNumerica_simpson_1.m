% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% CÁLCULO NUMÉRICO 2020
% INTEGRAÇÃO NUMÉRICA - SEGUNDA REGRA DE SIMPSON
% DATA: 30/10/2020
% AUTOR: JOSÉ E F BATISTA
clear all, close all, clc, 

% LIMITES DE INTEGRAÇÃO A/B/C
  
a=0; b=pi/4; n = 14;
##a=-2; b=-1; n=4;
##a=-2; b=2; n=30;

dx = (b-a)/n; 
x = a:dx:b;

% FUNÇÃO A/B/C

y = (1./cos(x));
##y = x.^2./((x-1).^2);  
##y = e.^(-x.^2./2); 

% INTEGRAL EXATA  A/B/C
  
Iexato = -0.5*log(-2*sqrt(2)+3);
##Iexato = (12*(log(2)-log(3))+7)/6;
##Iexato = (sqrt(pi)*erf(sqrt(2))-sqrt(pi)*erf(-sqrt(2)))/sqrt(2); 

soma = (dx/3)*y(1); 
for i=2:n
  if(mod(i,2)==0), y(i) = 4*y(i); else, y(i) = 2*y(i); end
  soma += (dx/3)*y(i);
end
soma += (dx/3)*y(n+1); 

fprintf("<INTEGRAÇÃO NUMÉRICA - PRIMEIRA REGRA DE SIMPSON>\n\n");
fprintf("NÚMERO DE N = %i\n", n);
fprintf("INTEGRAL NUMÉRICA = %.15f\n", soma);
printf("INTEGRAL EXATA = %.15f\n", Iexato);
printf("ERRO = %.15f\n", abs(Iexato-soma));