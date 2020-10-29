% ---------------------------------------------
% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% DISCIPLINA: CÁLCULO NUMÉRICO 2020
% INTERPOLACAO: MÉTODO DE LAGRANGE
% JOÃO PESSOA, 26/09/2020.
% AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA
% ---------------------------------------------

% VARIAVEIS PRINCIPAIS
% N - numero de pontos dados
% X - vetor que contem as abscissas dos pontos dados
% Y - vetor que contem as ordenadas dos pontos dados
% T - matriz tabela de dados definida por: T=[X' Y']
% x - vetor que contem as abscissas dos pontos interpolados
% y - vetor que contem as ordenadas dos pontos interpolados

clear all, close all, clc

Xd=[1940	1950	1960	1970	1980	1991	2000	2010];
Yd=[41.24	51.94	70.07	93.14	119.00	146.82	169.80	190.76];
T=[Xd' Yd']; 
x=1940:5:2010;
N=length(Xd);
NPi=length(x);

disp('INTERPOLACAO DE LAGRANGE');
disp(' '); disp('TABELA DE PONTOS')
for f=1:N, disp([f Xd(f) Yd(f)]); end
disp(' '); disp('TABELA DE RESULTADOS');    

for k=1:NPi
    y(k)=0;
    for i=1:N
        parc=1;
        for j=1:N
            if(i~=j)
                parc=parc*((x(k)-T(j,1))/(T(i,1)-T(j,1)));
            end
        end
        y(k)=y(k)+parc*T(i,2);
    end
    disp([k x(k) y(k)]);
end

% SAÍDA GRÁFICA
Fig=figure(1); 
ax=axes; 
a=plot(Xd,Yd,'ko',x,y,'r');
set(a,'MarkerSize',14,'Linewidth',4);
L(1)=legend('pontos dados (IBGE)','pontos interpolados');
title('População Brasileira')
L(2)=xlabel('ANO'); L(3)=ylabel('HAB. (milhões)');
set(L,'fontsize',35);set(ax,'fontsize',30); 
set(L(1),'Box','Off','Location','NorthWest','fontsize',25);

axis([1930 2020 30 200])
grid on
