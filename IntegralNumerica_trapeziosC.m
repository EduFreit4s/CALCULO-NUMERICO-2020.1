## INSTITUTO FEDERAL DA PARAÍBA
## CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
## CÁLCULO NUMÉRICO 2020
## INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS
## AUTOR: JOSÉ E F BATISTA
clear all, close all, clc, 

Precisao = 6;
 
  ######### MUDAR LIMITES AQUI ###########
  
a=0; b=pi/4;
%a=-2; b=-1;  
%a=-2; b=2;

n = 0; integral(1) = 0;
Epsilon = 10^-Precisao;

while true  
  
  soma = 0;
  n=n+1;
  h=(b-a)/n;
  x=a:h:b;
  
  ######### MUDAR FUNÇÃO AQUI ###########
  
y = (1./cos(x));                     
%y = x.^2./((x-1).^2);  
%y = e.^(-x.^2./2);    
  
  for i=1:n
    soma=soma+(h/2)*(y(i)+y(i+1)); 
  end
  
  integral(n+1) = soma;
  fprintf("N = %i, Integral = %.15f, Erro: = %.15f \n", n, soma, abs(integral(i+1)-integral(i)));
  if(abs(integral(i+1)-integral(i)) < Epsilon),  break; end
  
end

disp("\n<INTEGRAÇÃO NUMÉRICA - REGRA DOS TRAPÉZIOS>\n\n")
fprintf("Precisão de casas decimais: %.e\n", Epsilon);
fprintf("Número de trapézios: %i\n", n);
fprintf("Integral numérica = %.15f\n",soma);
