% INSTITUTO FEDERAL DA PARAIBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELETRICA
% CALCULO NUMERICO 2020
% CALCULO DE RAIZES - METODO DA SECANTE
% EXERCICIO 2
% AUTOR: EDUARDO FREITAS

clc, clear all, close all, format short,

TOL = 1E-4;     %EPSILON
K=20;           %ITERAÇÕES
a = 0; b = 2;   %PONTOS
e(1) = 0;

#MINHA EQUAÇÃO TRANSCENDENTE:     x(n)*exp(x(n)) - pi;

#f(x) = x*e^x - pi 
#f'(x) = e^x(1+x)
#f''(x) = e^x(2+x) 
 
#ESCOLHA UM PONTO ALEATÓRIO (A OU B) QUE ESSA CONDIÇÃO SEJA 
#VERDADEIRA  [f(c)*f''(c) > 0] PARA DEFINIR O PONTO FIXO 'C'

 % Fazendo c = a, temos

 # f(2) = 2*exp(2) - pi = 14.77811
 # f''(2) = exp(2)*(2+2) = 29.55622
 # f(c)*f''(c) > 0 = 14.77811*29.55622 = 436.78513 > 0, ok
 # logo c = 2, x(1) = 0

c = b; 
x(1)=a;

#TUA EQUAÇÃO COM f(ponto fixo definido acima) 
fc = c*exp(c) - pi;                             %TROCAR EQUAÇÃO AQUI

for n=1:K
  fxn = x(n)*exp(x(n)) - pi;                    %TROCAR EQUAÇÃO AQUI
  f(n) = fxn;
  x(n+1) = x(n)-fxn*(x(n)-c)/(fxn-fc);
  e(n+1) = abs(x(n+1)-x(n));
  if abs(x(n+1)-x(n))<TOL   
    break;
  endif
endfor

f(n+1)= x(n+1)*exp(x(n+1)) - pi;                %TROCAR EQUAÇÃO AQUI
disp([(0:n)' x' f' e'])
