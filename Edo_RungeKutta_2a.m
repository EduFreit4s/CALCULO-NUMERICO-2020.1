% ---------------------------------------------
% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% DISCIPLINA: CÁLCULO NUMÉRICO 2020
% EDO: EXEMPLO 1 - RUNGE-KUTTA DE 2° ORDEM
% JOÃO PESSOA, 22/11/2020.
% AUTOR: JOSE E F BATISTA
% ---------------------------------------------
clear all,close all, clc

%y' = 1/2*(x-1/y)
%y(0) = 0.9

% DADOS DO PVI
a=0; b=1; h=0.1; m=(b-a)/h; x(1)=0; y(1)=0.9; 
 
for j=1:m
  K1=0.5*(x(j)-(1/y(j)));
  K2=0.5*((x(j)+h/2)-(1/y(j)+h/2*K1));
  y(j+1)=y(j)+h*K2;
  x(j+1)=x(j)+h;
  fprintf("K1=%.6f\tK2=%.6f\tY(j)=%.6f\tX(j)=%.6f\t\n",K1,K2,y(j+1),x(j+1));
end
fprintf("\n\t####### EXEMPLO1 - RK2 - EULER MODIFICADO #######\n\n");
fprintf("\t\ty' = 1/2*(x-1/y)\n\t\ty(0) = 0.9\n\n\t\th = 0.1 e intervalo = [0;1]\n\n");
fprintf("\t\tj\txj\tyj\n\n");

for j=0:m
  fprintf('\t\t%d\t%.2f\t%.6f\n',j,x(j+1),y(j+1));
end
