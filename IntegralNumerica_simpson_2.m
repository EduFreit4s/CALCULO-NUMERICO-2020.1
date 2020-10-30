% INSTITUTO FEDERAL DA PARA�BA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA EL�TRICA
% C�LCULO NUM�RICO 2020
% INTEGRA��O NUM�RICA - SEGUNDA REGRA DE SIMPSON
% DATA: 30/10/2020
% AUTOR: JOS� E F BATISTA
clear all, close all, clc, 

% LIMITES DE INTEGRA��O A/B/C
 
a=0; b=pi/4; n=18;          
##a=-2; b=-1; n=6;          
##a=-2; b=2; n=39;          

dx = (b-a)/n; 
x = a:dx:b;

% FUN��O  A/B/C

y = (1./cos(x));             
##y = x.^2./((x-1).^2);     
##y = e.^(-x.^2./2);        
 
% INTEGRAL EXATA  A/B/C

Iexato = -0.5*log(-2*sqrt(2)+3);  
##Iexato = (12*(log(2)-log(3))+7)/6;
##Iexato = (sqrt(pi)*erf(sqrt(2))-sqrt(pi)*erf(-sqrt(2)))/sqrt(2); 

soma = (3*dx/8)*y(1); 
for i=2:n
  if(mod(i-1,3)==0), y(i) = 2*y(i); else, y(i) = 3*y(i); end
  soma += (3*dx/8)*y(i);
end
soma += (3*dx/8)*y(n+1);

fprintf("<INTEGRA��O NUM�RICA - SEGUNDA REGRA DE SIMPSON>\n\n");
fprintf("N�MERO DE N = %i\n", n);
fprintf("INTEGRAL NUM�RICA = %.15f\n", soma);
printf("INTEGRAL EXATA = %.15f\n", Iexato);
printf("ERRO = %.15f\n", abs(Iexato-soma));