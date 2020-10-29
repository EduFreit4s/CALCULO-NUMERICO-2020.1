% INSTITUTO FEDERAL DA PARAIBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELETRICA
% CALCULO NUMERICO 2020
% CALCULO DE RAIZES - METODO DA BISSECAO
% EXERCICIO 1-A
% AUTOR: ANTONIO BATISTA E EDUARDO FREITAS

clear all, close all, clc, 
a=0; 
b=2; 
Nmax=42; 
tol=1e-3; 
n=1; 
e(n) = b-a;
xi(n)=0;

# EQUAÇÃO ALGÉBRICA 
  %xi(n)^3 - 2*xi(n)^2 + 3*xi(n) -1:
  %ya = a^3-2*a^2+3*a-1; 
  %yb = b^3-2*b^2+3*b-1;

# EQUAÇÃO TRANSCENDENTE
  %xi(n)*exp(xi(n))-pi;
  ya = a*exp(a) - pi;
  yb = b*exp(b) - pi;

while(e(n)>tol && n<=Nmax)
  n=n+1;  
  xi(n)= a+(b-a)/2;
  yi(n)= xi(n)*exp(xi(n))- pi; % MUDAR EQUAÇÃO AQUI
  if (yi(n)==0), break; end
  if (ya*yi(n)<0), b=xi(n); else, a=xi(n); end
  e(n)=abs(xi(n)-xi(n-1)); 
end

N=0:n - 3;
disp('       N        XN      F(XN)       E')
disp([N' xi(3:n)' yi(3:n)' e(3:n)'])
