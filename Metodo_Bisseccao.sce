clear;
clc;
///////////////Método da bissecção//////////////
function tabela (A)
    if A==-0.0 then
        A=0.0
    end
    if A<0 then mprintf ("  %1.7f",A);
    else mprintf ("   %1.7f",A);
        end;
endfunction;

deff ('y=f(x)','y= x^2 -3 ');//função
FUNC='y=e^x +x';//print da função
//Intervalo
xa=1;
xb=2;
ep=0.01;//Precisão
Nmax=100;//Número máximo de iterações
k=0;
mprintf ("///////////////////Método da Bissecção///////////////////");
disp ("");
mprintf (" Para a função: %s\n No intervalo [%.1f , %.1f] e precisão %.7f\n\n", FUNC, xa, xb, ep);
mprintf (" #      xa          xb          xm          f(xa)       f(xb)       f(xm)       xb-xa");
disp ("");
if k<10 then mprintf (" 0%i",k);
    else mprintf (" %i",k);
        end;
xm=(xa+xb)/2;
tabela (xa);
tabela (xb);
tabela (xm);
tabela (f(xa));
tabela (f(xb));
tabela (f(xm));
tabela (xb-xa);
disp ("");
while (abs(xb-xa)>ep) & (k<Nmax) & (abs(f(xb)-f(xa))>ep)
    k=k+1;
    if f(xa)*f(xm)<0 then xb=xm;
    else xa=xm;
        end;
    xm=(xa+xb)/2;
    if k<10 then mprintf (" 0%i",k);
    else mprintf (" %i",k);
        end;
    tabela (xa);
    tabela (xb);
    tabela (xm);
    tabela (f(xa));
    tabela (f(xb));
    tabela (f(xm));
    tabela (xb-xa);
    disp ("");
end;
mprintf ("\n///////////////Raiz aproximada: %1.7f \n", xm);
mprintf ("///////////Qtde. de Interações: %i", k);
disp ("");
