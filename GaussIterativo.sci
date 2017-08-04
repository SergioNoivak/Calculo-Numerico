clear
clc
//################################Algoritmo Eliminação Gauss########################//
function tabela (A)
    if A==-0.0 then
        A=0.0;
    end
    if A==0 then
        mprintf ("   %1.6f",A);
        return
    end
    if A<0 then 
        if A>-0.000001 then
            J=string(A)
            mprintf("  %s", J)
        else
            mprintf ("  %1.6f",A);
        end
    else
        if A<0.000001 then
            J=string(A)
            mprintf("  %s", J)
        else
            mprintf ("   %1.6f",A);
        end
    end;
endfunction;
function tabela10 (A)
    if A==-0.0 then
        A=0.0;
    end
    if A==0.0 then
        mprintf("   %.6f", A)
        return
    end
    if A<0 then 
        if A<=-10 then
            mprintf ("  %1.6f",A);
        else
            if A>-0.000001 then
                J=string(A)
                mprintf("  %s", J)
            else
                mprintf ("  %1.6f",A);
            end
        end
    else 
        if A>=10 then
            mprintf ("   %1.6f",A);
        else
            if A<0.000001 then
                J=string(A)
                mprintf("  %s", J)
            else
                mprintf ("   %1.6f",A);
            end
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

A=[3,6,-3,9;1,3,-2,4;-2,-2,4,-2;1,1,2,5];
B=[-3,-1,6,7];
n=length(B);
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
mprintf ("/////////////////Método da Eliminação de Gauss/////////////////");
disp("");
//Triangularização
mprintf("//////Triangularização\n\n")
for k=1:n-1,
    for i=k+1:n,
        m=A(i,k)/A(k,k);
        A(i,k)=0;
        for j=k+1:n,
            A(i,j)=A(i,j)-A(k,j)*m;
        end;
        B(i)=B(i)-B(k)*m;
        mprintf("//////////Matriz em K=%d e I=%d\n", k, i)
        MATRIZ(A);
    end;
end;
//Retrosubstituição
mprintf("\n//////Retrosubstituição\n\n")
X(n)=B(n)/A(n,n);
mprintf("//////////Vetor em K=%d\n", n)
vetor(X)
for k=n-1:-1:1,
    soma=0;
    for j=k+1:n,
        soma=soma+A(k,j)*X(j);
    end;
    X(k)=(B(k)-soma)/A(k,k);
    mprintf("//////////Vetor em K=%d\n", k)
    vetor(X)
end;
//Apresentação
mprintf("/////////////////Vetor solução:\n");
IMPR (X);
