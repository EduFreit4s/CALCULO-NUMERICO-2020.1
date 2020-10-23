## INSTITUTO FEDERAL DA PARA�BA
## CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA EL�TRICA
## C�LCULO NUM�RICO 2020
## INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS

clear all, close all, clc, 

#A a=0; b=pi/4; n=445; h=(b-a)/n;     
#B a=-2; b=-1; n=69; h=(b-a)/n;         
a=-2; b=2; n=2403; h=(b-a)/n;   
   
x=a:h:b;

#A y = (1./cos(x));                     
#B y = x.^2./((x-1).^2);               
y = e.^(-x.^2./2);                  
I=0;

#A Iexato = -0.5*log(-2*sqrt(2)+3);     
#B Iexato = (12*(log(2)-log(3))+7)/6;   
Iexato = (sqrt(pi)*erf(sqrt(2))-sqrt(pi)*erf(-sqrt(2)))/sqrt(2); 

for i=1:n
  I=I+(h/2)*(y(i)+y(i+1));
end

#A ET = -((b-a)^3/(12*n^2))*(1+sin(pi/4)^2)/cos(pi/4)^3; 
#B ET = -((b-a)^3/(12*n^2))*(2*(2*(-2)+1)/((-2)-1)^4);
ET = -((b-a)^3/(12*n^2))*3/e^2;

Ir=I+ET;
E=abs(Iexato-Ir);
disp('<INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS>')
disp(' ')
fprintf("Valor exato = %f \n\n", Iexato);
fprintf("Integral Num�rica = %f\nErro Truncamento: %f\n\n",I,ET);
fprintf("Num�rica+Corre��o = %f\nErro |exato-num| = %f\n\n",Ir,E);