clear;
clc;
//###############################Método da falsa posição#############################################//
function tabela (A)
    if A<0 then mprintf ("  %1.7f",A);
    else mprintf ("   %1.7f",A);
        end;
endfunction;
deff ('y=f(x)','y=x^2 -3');//Função
FUNC='x^2 -3';//printf da lei de formação da função
xa=1.0;
xb=2.0;
ep=0.01;
Nmax=100;
k=0;
mprintf ("///////////////////Método da Falsa posição///////////////////");
disp("");
xm=(xa*f(xb)-xb*f(xa))/(f(xb)-f(xa));
mprintf (" Para a função: %s\n No intervalo [%.1f , %.1f] e precisão %.7f\n\n", FUNC, xa, xb, ep);
mprintf (" #      xa          xb          xm          f(xa)       f(xb)       f(xm)       xa-xb");
disp ("");
mprintf (" 0%i",k);
tabela (xa);
tabela (xb);
tabela (xm);
tabela (f(xa));
tabela (f(xb));
tabela (f(xm));
tabela (xa-xb);
disp ("");
while (abs(f(xm))>ep) &(k<Nmax)
    k=k+1;
    if f(xa)*f(xm)<0 then xb=xm;
    else xa=xm;
        end;
    xm=(xa*f(xb)-xb*f(xa))/(f(xb)-f(xa));
    if k<10 then mprintf (" 0%i",k);
    else mprintf (" %i",k);
        end;
    tabela (xa);
    tabela (xb);
    tabela (xm);
    tabela (f(xa));
    tabela (f(xb));
    tabela (f(xm));
    tabela (xa-xb);
    disp ("");
end;
mprintf ("\n///////////////Raiz aproximada: %1.7f \n", xm);
mprintf ("///////////Qtde. de Interações: %i", k);
disp ("");
