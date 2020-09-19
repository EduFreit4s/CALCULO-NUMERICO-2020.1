% INSTITUTO FEDERAL DA PARAÍBA
% CURSO SUPERIOR DE BACHARELADO EM ENGENHARIA ELÉTRICA
% CÁLCULO NUMÉRICO 2020.1
% EQUAÇÕES TRANSCENDENTES E ALGÉBRICAS
% CALCULO DE RAÍZES - MÉTODO DE NEWTON
% AUTOR:  ANTONIO BATISTA E EDUARDO FREITAS
 
clear all, close all, clc, 

#[0, 2]

TOL=1E-3;
Nmax=42;
x(1)=2;    
n=1;
e(1)=1;

#EQUAÇÃO ALGÉBRICA
 
  % NUMERADOR - x(n-1)^3-2*x(n-1)^2 + 3*x(n-1)-1;
  % DENOMINADOR - 3*x(n-1)^2 - 2*x(n-1) + 3;
  
    #f(x) = b^3-2*b^2+3*b-1 | f(0) = -1, f(2) = 5 
    #f'(x) = 3b^2 - 2b + 3
    #f''(x) = 6b - 2 | f(0) = -2, f(2) = 10

    #f(a)*f''(a) > 0, x0 = -1*-2 = 2>0, x0 = 0
    #f(b)*f''(b) > 0, x0 = 5*10 = 50 > 0, x0 = 2
    #Obs: escolhendo o x0 maior, o resultado será mais preciso e vai convergir mais rápido 

#EQUAÇÃO TRANSCENDENTE

  % NUMERADOR = x(n-1)*exp(x(n-1))-pi;
  % DENOMINADOR = exp(x(n-1))*(2+x(n-1));
 
    #f(x) = x*e^x - pi | f(0) = -pi, f(2) = 11.63651 
    #f'(x) = e^x(1+x)
    #f''(x) = e^x(2+x) | f(0) = 2, f(2) = 29.55622
    
    #f(b)*f''(b) > 0, x0 = 11.63651*29.55622 = 343,93124 > 0, x0 = 2
 
while(e(n)>TOL &&n<=Nmax)
  n=n+1;
  numerador = x(n-1)*exp(x(n-1))-pi;     % MUDAR EQUAÇÃO AQUI
  denominador = exp(x(n-1))*(2+x(n-1));  % MUDAR EQUAÇÃO AQUI
  x(n)=x(n-1)- (numerador/denominador);
  e(n)=abs(x(n)-x(n-1));
end
X=[(0:length(x)-1)' x' e']; 
disp('   -----------------------------')
disp(X)
disp(['   TOL = ' num2str(TOL)]); 
disp(['   Iteraçöes: ' num2str(n-1)])
disp('   -----------------------------')