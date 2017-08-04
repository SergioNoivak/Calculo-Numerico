clear
clc
//==========Método de Thomas TDMA================//

function vetor(C)
    hj=length(C)
    [KEY]=check(C)
    if KEY>0 then
        for i=1:hj
            tabela10 (C(i))
            //mprintf("\n")
//inserir essa formatacao se o vetor ficar muito grande
        end
    else
        for i=1:hj
            tabela (C(i))
            mprintf("\n")//inserir essa formatacao se o vetor ficar muito grande
        end
    end
    disp("")
endfunction
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
mprintf ("//////////////////////Método de Thomas TDMA//////////////////////");
disp ("");
//Definição das diagonais principais!!!!
A = [-1,-1,-1,-1,-1,-1,-1,-1]; //Diagonal em cima da principal
B = [2,2,2,2,2,2,2,2,2,2];//Diagonal principal
C = [-1,-1,-1,-1,-1,-1,-1,-1];//Diagonal em baixo da principal
D = [4,4,2,2,1,2,2,4,4];//vetor
n = length(A)-1;
C(1) = C(1) / B(1);
D(1) = D(1) / B(1);
mprintf("////////////////////////////////K = 1\n")
mprintf("//////////Vetor C em K=1\n")
    vetor(C)
    mprintf("//////////Vetor D em K=1\n")
    vetor(D)
for i = 2:n-1
    temp = B(i) - A(i) * C(i-1);
    C(i) = C(i) / temp;
    D(i) = (D(i) - A(i) * D(i-1))/temp;
    mprintf("////////////////////////////////K = %d\n", i)
    mprintf("//////////Vetor C\n")
    vetor(C)
    mprintf("//////////Vetor D\n")
    vetor(D)
end
disp(C)
mprintf("B(n)=%f - A(n)=%f - C(n-1)=%f - %f\n\n", B(n), A(n), C(n-1),( (B(n) - A(n)) * C(n-1)))
D(n) = (D(n) - A(n) * D(n-1))/(B(n) - A(n) * C(n-1));
//Retrosubstituição
mprintf("\naaaaaaaaaaaaaa----\n")
vetor(D)
mprintf("\naaaaaaaaaaaaaa----\n")
mprintf("\n//////Retrosubstituição\n\n")
X(n) = D(n);
mprintf("//////////Vetor em K=%d\n", n)
vetor(X)
for i = n-1:-1:1
    X(i) = D(i) - C(i) * X(i + 1);
    mprintf("//////////Vetor em K=%d\n", i)
    vetor(X)
end
mprintf("/////////////////Vetor solução:\n\n");
vetor(X);
