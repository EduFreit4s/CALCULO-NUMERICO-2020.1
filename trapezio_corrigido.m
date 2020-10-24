## INSTITUTO FEDERAL DA PARA�BA
## CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA EL�TRICA
## C�LCULO NUM�RICO 2020
## INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS

clear all, close all, clc, 

Error = true; #N necess�rio para |Exato-Composto| = 0
tol = 1E-6; 

  ######### MUDAR LIMITES AQUI ###########
  
##  a=0; b=pi/4;
##  a=-2; b=-1;  
##  a=-2; b=2;

  ######### MUDAR IEXATO AQUI ###########

##  Iexato = -0.5*log(-2*sqrt(2)+3);     
##  Iexato = (12*(log(2)-log(3))+7)/6;   
##  Iexato = (sqrt(pi)*erf(sqrt(2))-sqrt(pi)*erf(-sqrt(2)))/sqrt(2); 

n = 0; integral(1) = 0;

while true  
  soma = 0;
  n=n+1;
  h=(b-a)/n;
  x=a:h:b;
  
  ######### MUDAR FUN��O AQUI ###########
  
##  y = (1./cos(x));                     
##  y = x.^2./((x-1).^2);  
##  y = e.^(-x.^2./2);    
  
  for i=1:n
    soma=soma+(h/2)*(y(i)+y(i+1)); 
  end
  
  ######### MUDAR ERRO DE TRUCAMENTO AQUI ###########
  
##  ET = -((b-a)^3/(12*n^2))*(1+sin(pi/4)^2)/cos(pi/4)^3; 
##  ET = -((b-a)^3/(12*n^2))*(2*(2*(-2)+1)/((-2)-1)^4);
##  ET = -((b-a)^3/(12*n^2))*3/e^2;
  
  Ir=soma+ET;
  E=abs(Iexato-Ir);
  integral(n+1) = Ir;
  
  if(abs(integral(i+1)-integral(i)) < tol && !Error),
    break;
  else,
    fprintf("N = %i, Integral = %.10f, Erro: = %.15f \n", n, Ir, Iexato-Ir); 
    if(E < tol), break; end
  end
end

disp("\n<INTEGRA��O NUM�RICA - REGRA DOS TRAP�ZIOS>\n\n")
fprintf("Toler�ncia: %.10f\n", tol);
fprintf("N�mero de trap�zios: %i\n", n);
fprintf("Integral exata = %.10f \n", Iexato);
fprintf("Integral num�rica = %.10f\nErro de truncamento: %.10f\n\n",soma,ET);
fprintf("Trapezio composto = %.10f\nErro |exato-num�rico| = %.10f\n\n",Ir,E);