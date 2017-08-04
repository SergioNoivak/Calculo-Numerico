clear
clc
//##############################Método da iteração linear#############################//
function tabela (A)
    if A<0 then mprintf ("  %1.7f",A);
    else mprintf ("   %1.7f",A);
        end;
endfunction;

deff ('y=f(x)', 'y=x^2  -3');
FUNC='y=x^2  -3';//prinf da função
x0=1.0;
posicao=0.001;
Imax=100;
i=0;
x=f(x0);
mprintf ("///////////////////Método da iteração linear///////////////////");
disp ("");
mprintf (" Para a função: %s\n Com a condição inicial: %.4f e precisão %.7f\n\n", FUNC, x0, posicao);
mprintf (" #     x0          x           f(x0)       f(x)        x-x0");
disp ("");
mprintf (" %i",i);
    tabela (x0);
    tabela (x);
    tabela (f(x0));
    tabela (f(x));
    tabela (x-x0);
    disp ("");
while (abs(x-x0)>posicao) & (i<Imax)
    i=i+1;
    x0=x;
    x=f(x0);
    mprintf (" %i",i);
    tabela (x0);
    tabela (x);
    tabela (f(x0));
    tabela (f(x));
    tabela (x-x0);
    disp ("");
end;
mprintf ("\n///////////////Raiz aproximada: %1.7f \n", x);
mprintf ("///////////Qtde. de Interações: %i", i);
disp ("");
