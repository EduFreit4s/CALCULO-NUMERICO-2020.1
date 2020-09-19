% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% CÁLCULO NUMÉRICO 2020
% EQUACÖES TRANSCENDENTES E ALGÉBRICAS
% CALCULO DE RAÍZES - MÉTODO GRÁFICO
% EXEMPLO 3.14, PÁGINA 100 LIVRO-TEXTO
% AUTOR: PROF. PAULO HENRIQUE DA FONSECA SILVA

clear all, close all, clc

CARGA = -1.602176634e-19
TEMPERATURA = 25 + 273.15
BOLTZMANN = 1.3807e-23
VT = abs(BOLTZMANN*TEMPERATURA/CARGA)
CORRENTE_SATURACAO = 5e-3

x = -1.5:.0001:2.5; 
N=length(x);
y=(1.5-x)-(CORRENTE_SATURACAO*(exp(x/VT)-1));
csi=fzero(@(x) (1.5-x)-(CORRENTE_SATURACAO*(exp(x/VT)-1)), -1.5);
g=1.5-x; 
h=CORRENTE_SATURACAO*(exp(x/VT)-1);
x1=[csi csi]; 
y1=[0 1.5-csi];
x2=[-1.5 csi]; 
y2=[1.5-csi 1.5-csi];
ax=axes; 
set(ax,'Fontsize',18);
plot(x,g,'b','Linewidth',4,x,h,'r','Linewidth',4,...
x1,y1,'k--',x2,y2,'k--',csi,1.5-csi,'ko')
L(1)=xlabel('V');L(2)=ylabel('mA');
set(L,'FontSize',24); 
axis([0 1.5 0 3])
grid on, box on

fprintf('CORRENTE: %f A \n', y1(2))
fprintf('TENSÃO: %f V \n', csi)



