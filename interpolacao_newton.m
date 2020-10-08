% ---------------------------------------------
% INSTITUTO FEDERAL DA PARA�BA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA EL�TRICA
% DISCIPLINA: C�LCULO NUM�RICO 2020
% INTERPOLACAO: M�TODO DE NEWTON
% JO�O PESSOA, 08/10/2020.
% AUTOR: JOS� EDUARDO F BATISTA
% ---------------------------------------------

% VARIAVEIS PRINCIPAIS
% abscissa - Retorna a imagem do polin�mio interpolado 
% x - vetor que contem as abscissas dos pontos dados
% y - vetor que contem as ordenadas dos pontos dados
% fx - vetor que contem as abscissas dos pontos interpolados
% dominio - vetor que contem as ordenadas dos pontos interpolados

clear all, close all, clc

% DADOS
abscissa = 25;
x =[0 8 20 30 45];
y =[0.000 52.032 160.450 275.961 370.276];
passo = 0:0.01:45;
ordenada=0;

% N�O MEXER
size = length(x);
fator = 1;
dx = length(passo);

% SCRIPT
for k=1:size-1
  delta(k, 1) = (y(k+1)-y(k))/(x(k+1)-x(k)); 
end

for p=1:dx  
  imagem = y(1);
  for j=2:size 
    if j < size
      for k=1:size-j
        delta(k, j) = (delta(k+1, j-1)-delta(k,j-1))/(x(k+j)-x(k));
      end
    end
    fator(j) = (passo(p) - x(j-1))*fator(j-1);
    imagem = imagem + delta(1, j-1)*fator(j);
  end
  if(passo(p)==abscissa) ordenada = imagem; end
  dominio(p) = passo(p);
  fx(p) = imagem;
  it(p) = p; 
end

format short
% SA�DA NA JANELA DE COMANDO
%-------------------------------------------------------------
fprintf("%s \n\n\n", '        INTERPOLACAO DE NEWTON');
fprintf("%s \n\n", '        TABELA DE PONTOS');
disp([x' y']);
fprintf("\n    F(%.2f) =  %.2f\n\n",abscissa,ordenada);
fprintf("%s \n\n", '         TABELA DE RESULTADOS ');
fprintf("%s \n\n", '     ITERA��O     DOM�NIO    IMAGEM');
disp([it' dominio' fx']);

% SA�DA NO GR�FICO
%-------------------------------------------------------------
Fig=figure(1);
ax=axes;
a=plot(x,y,'ko',dominio,fx,'b');
set(a,'MarkerSize',14,'Linewidth',4);
L(1)=legend('pontos dados ','pontos interpolados');
title('Velocidade do foguete')
L(2)=xlabel('Tempo (s)'); L(3)=ylabel('Velocidade (m/s)');
set(L,'fontsize',35);set(ax,'fontsize',30);
set(L(1),'Box','Off','Location','NorthWest','fontsize',15);
axis([min(x) max(x) min(fx) max(fx)])
grid on