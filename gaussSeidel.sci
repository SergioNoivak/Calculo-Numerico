clear
clc
///////////////Método de Gauss Seidel///////////////!!!!
function tabela (A)
    if A==-0.0 then
        A=0.0;
    end
    if A<0 then mprintf ("  %1.6f",A);
    else mprintf ("   %1.6f",A);
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
function IMPR (A)
    hj=length(A)
    [KEY]=check(A)
    if KEY>0 then
        for i=1:hj
            mprintf(" X%d  =", i)
            tabela10(A(i))
            mprintf("\n")
        end
    else
        for i=1:hj
            mprintf(" X%d  =", i)
            tabela(A(i))
            mprintf("\n")
        end
    end
endfunction;
function MATRIZ(A)
    hj=length(B)
    [KEY]=check(A)
    if KEY>0 then
        for i=1:hj
            for j=1:hj
                tabela10 (A(i,j))
            end
            disp("");
        end
    else
        for i=1:hj
            for j=1:hj
                tabela (A(i,j))
            end
            disp("");
        end
    end
endfunction
function vetor(C)
    hj=length(C)
    [KEY]=check(C)
    if KEY>0 then
        for i=1:hj
            tabela10 (C(i))
        end
    else
        for i=1:hj
            tabela (C(i))
        end
    end
    disp("")
endfunction c
function [KEY] = check(A)
    KEY=0;
    hj=length(A)
    if hj>length(B) then
        hj=length(B)
        for i=1:hj
            for j=1:hj
                if (A(i,j)>=10) then
                    KEY=1;
                end
            end
        end
    else
        for i=1:hj
            if (A(i)>=10) then
                KEY=1;
            end
        end
    end 
endfunction

    A=[2,1,7,4,-3,-1,4,4,7,0;
       4,2,2,3,-2,0,3,3,4,1;
       3,4,4,2,1,-2,2,1,9,-3;
       9,3,5,1,0,5,6,-5,-3,4;
       2,0,7,0,-5,7,1,0,1,6;
       1,9,8,0,3,9,9,0,0,5;
       4,1,9,0,4,3,7,-4,1,3;
       6,3,1,1,6,8,3,3,0,2;
       6,5,0,-7,7,-7,6,2,-6,1;
       1,6,3,4,8,3,-5,0,-6,0;];
       
    B=[86,45,52.5,108,66.5,90.5,139,61,-43.5,31];
    
n = length(B);
H=sqrt(length(A));
Ji=round(H)
if H~=Ji then
    mprintf("Matriz especificada incorreta...\n")
    disp(A)
    return
end
if H~=n then
    mprintf("Matriz especificada incorreta...\n")
    disp(A)
    disp(B)
    return
end
Nmax = 100;
epsilon = 0.01;//erro
for i=1:n
    X0(i)=0.0//Chute Inicial
end
X0i=X0;
X=X0;
mprintf ("///////////////////Método de Gauss Seidel///////////////////");
disp ("");
mprintf("////////////Condições iniciais:\n");
IMPR (X0i);
//inicio do laco
for k = 1:Nmax,
    for i = 1:n, 
        S = 0;
        for j = 1:n,
            if (i ~= j) S = S + A(i,j)*X(j);end
        end
        X(i)=(B(i) - S) / A(i,i);
    end
mprintf ("/////////////////////////Iteração: %i\n", k);
IMPR (X);
erro = max(abs(X - X0));
if (erro < epsilon) break; end
X0=X;
end
mprintf("\n\n///////////Qtde. de Interações: %i\n", k);
mprintf("/////////////////Vetor solução:\n");
IMPR (X);
if k==Nmax then
    mprintf("\n\n////////////////////no método de Gauss Seidel converge em situações onde a \ndiagonal principal é dominante, como esse sistema não possui \ndiagonal dominante, e mesmo por permutação de linhas não foi \npossível definir uma situação válida, o sistema, mesmo \npossuindo solução, como vista na resolução do método de Gauss, \nnão pode ser achada por esse método.\n")
end
