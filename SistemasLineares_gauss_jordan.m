%============================================================== 
% IFPB, JOÃO PESSOA, 13/09/2020
% CURSO SUPERIOR DE ENGNEHARIA ELÉTRICA
% GAUSS-JORDAN
% AUTOR: EDUARDO FREITAS E ANTONIO BATISTA
%==============================================================

clear all;
clc;
disp('MATRIZ AUMENTADA');
%A=[[9 -2 100];[-2 4 0];]; N=2;
A=[[12 -2 3 18];[1 10 -2 16];[3 1 15 52];]; N=3;
A
pause

for K=1:N
  A(K,:) = A(K,:)/A(K,K);
    for J = K+1:N
      A(J,:) = A(J,:)- A(K,:)*A(J,K);
      J = J+1;
      A
      pause
    end
  K = K+1;
  A
  pause
end

for K=N:-1:2
  for J=K-1:-1:1
    A(J,:) = A(J,:) - (A(K,:)*A(J,K));
    J = J-1;
    A
    pause
  end
  K=K-1;
end

disp('MATRIZ ESCALONADA PELO METODO GAUSS-JORDAN: ');
A
pause
  
