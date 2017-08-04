clear
clc
///////////////Algoritmo da Secante///////////////
function tabela3000 (A)
    if A==-0.0 then
        A=0.0;
    end
    if A<0 then 
        if A<=-10 then
            if A<=-100 then
                if A<=-1000 then
                    if A<=-10000 then
                        mprintf (" %1.6f",A);
                    else
                        mprintf ("  %1.6f",A);
                    end
                else
                    mprintf ("   %1.6f",A);
                end
            else
                mprintf ("    %1.6f",A);
            end
        else
            mprintf ("     %1.6f",A);
        end
    else 
        if A>=10 then
            if A>=100 then
                if A>=1000 then
                    if A>=10000 then
                        mprintf ("  %1.6f",A);
                    else
                        mprintf ("   %1.6f",A);
                    end
                else
                    mprintf ("    %1.6f",A);
                end
            else
                mprintf ("     %1.6f",A);
            end
        else
            mprintf ("      %1.6f",A);
        end
    end;
endfunction;
deff ('y=f(x)','y=x^2 -3');
FUNC='y=x^2 -3';//função do printf
//x0 e x1
xa=1;
xb=2;
ep=0.01;//ERRO 
Nmax=100;
k=0;
mprintf ("///////////////////Método da Secante///////////////////\n\n");
mprintf (" Para a função: %s\n No intervalo [%.1f , %.1f] e precisão %.7f\n\n", FUNC, xa, xb, ep);
mprintf (" #         xa            xb            xm            f(xa)         f(xb)         f(xm)         xb-xa");
disp ("");
mprintf (" 0%i",k);
xm=(xa*f(xb)-xb*f(xa))/(f(xb)-f(xa));
tabela3000 (xa);
tabela3000 (xb);
tabela3000 (xm);
tabela3000 (f(xa));
tabela3000 (f(xb));
tabela3000 (f(xm));
tabela3000 (xb-xa);
disp ("");
while (abs(xb-xa)>ep) &(k<Nmax)
    k=k+1;
    xa=xb;
    xb=xm;
    xm=(xa*f(xb)-xb*f(xa))/(f(xb)-f(xa));
    if k<10 then mprintf (" 0%i",k);
    else mprintf (" %i",k);
        end;
    tabela3000 (xa);
    tabela3000 (xb);
    tabela3000 (xm);
    tabela3000 (f(xa));
    tabela3000 (f(xb));
    tabela3000 (f(xm));
    tabela3000 (xb-xa);
    disp ("");
end;
disp ("");
mprintf ("///////////////Raiz aproximada: %1.7f \n", xm);
mprintf ("///////////Qtde. de Interações: %i", k);
disp ("");
