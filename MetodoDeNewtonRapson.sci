clear
clc
//#############################Algoritmo de Newton-Raphson###########################################3//
function tabela (A)
    if A<0 then mprintf ("  %1.7f",A);
    else mprintf ("   %1.7f",A);
        end;
endfunction;
function tabela10 (A)
    if A==-0.0 then
        A=0.0;
    end
    if A<0 then 
        if A<=-10 then
            mprintf ("  %1.6f",A);
        else
            mprintf ("   %1.6f",A);
        end
    else 
        if A>=10 then
            mprintf ("   %1.6f",A);
        else
            mprintf ("    %1.6f",A);
        end
    end;
endfunction;
deff ('y=f(x)','y=x^2 -3');//Função 
deff ('y=fl(x)','y=2*x');//Derivada
deff ('y=psi(x)','y=x-f(x)/fl(x)');
x0=1;//por 1 se divisão por zero
ep=0.01;//erro
Nmax=100;
k=0;
x=psi(x0);
mprintf ("///////////////////Método de Newton Raphson///////////////////");
disp ("");
mprintf (" #       x0          x           f(x0)       f(x)        x-x0");
disp ("");
mprintf (" 0%i",k);
tabela10 (x0);
tabela10 (x);
tabela10 (f(x0));
tabela10 (f(x));
tabela10 (x-x0);
disp ("");
while (abs(x-x0)>ep) & (k<Nmax)
    k=k+1;
    x0=x;
    x=psi(x0);
    if k<10 then mprintf (" 0%i",k);
    else mprintf (" %i",k);
        end;
    tabela10 (x0);
    tabela10 (x);
    tabela10 (f(x0));
    tabela10 (f(x));
    tabela10 (x-x0);
    disp ("");
end;
mprintf ("\n///////////////Raiz aproximada: %1.7f \n", x);
mprintf ("///////////Qtde. de Interações: %i", k);
disp ("");
