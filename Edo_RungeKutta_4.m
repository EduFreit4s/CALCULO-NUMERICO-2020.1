% ---------------------------------------------
% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% DISCIPLINA: CÁLCULO NUMÉRICO 2020
% EDO: CIRCUITO RLC SÉRIE - RUNGE-KUTTA DE 4° ORDEM
% JOÃO PESSOA, 21/11/2020.
% AUTOR: ANTÔNIO, EDUARDO, GABRIEL E TAYNARA
% ---------------------------------------------
clear all, close all, clc,

A=0; B=0.2; H=0.001; M=(B-A)/H;                              
T(1)=A; X(1)=0; Y(1)=0;       

function L=FP(T,X,Y);
L = Y;
end

function R=GP(T,X,Y);
R=5000-500*Y-5000*X;
end

for J=1:M
  K1=H*FP(T(J),X(J),Y(J));    
  L1=H*GP(T(J),X(J),Y(J));    
  K2=H*FP(T(J)+0.5*H,X(J)+0.5*K1,Y(J)+0.5*L1);
  L2=H*GP(T(J)+0.5*H,X(J)+0.5*K1,Y(J)+0.5*L1);
  K3=H*FP(T(J)+0.5*H,X(J)+0.5*K2,Y(J)+0.5*L2);
  L3=H*GP(T(J)+0.5*H,X(J)+0.5*K2,Y(J)+0.5*L2);
  K4=H*FP(T(J)+H,X(J)+K3,Y(J)+L3);
  L4=H*GP(T(J)+H,X(J)+K3,Y(J)+L3);
  T(J+1)=T(J)+H;
  X(J+1)=X(J)+(1/6)*(K1+2*(K2+K3)+K4);
  Y(J+1)=Y(J)+(1/6)*(L1+2*(L2+L3)+L4);
end
X=X.*100;

%SAÍDA GRÁFICA
a=plot(T,X,'k',T,Y,'r'); set(a,'LineWidth',2);
title("CIRCUITO RLC SÉRIE - Runge-Kutta de 4° ordem",'fontsize',20);
legend('CARGA','CORRENTE','Location','NorthWest');
xlabel('TEMPO'), axis([A B 0 100]), grid on

%SAÍDA JANELA DE COMANDO
fprintf("CIRCUITO RLC SÉRIE - Runge-Kutta de 4° ordem\n\n");
fprintf("\tTempo\tCarga\tCorrente\n\n");
disp([T' X' Y']); 
