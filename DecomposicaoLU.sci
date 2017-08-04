clear;
clc;
///////////////Método da decomposição LU///////////////!!!!
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
///////////////////////////////////////////////////////////////////////////////////////////////////////SÓ SE PREOCUPE DAQUI PRA BAIXO, PRA CIMA EU JÁ ME PREOCUPEI!!!!
mprintf ("//////////////////////Método da Fatoração LU//////////////////////");
disp ("");
//Entrada A [n,n] e b[n,1]. Saída X[n,1]!!!!
    A=[3,6,-3,9;1,3,-2,4;-2,-2,4,-2;1,1,2,5];
    B=[-3,-1,6,1];
    //Decomposição de A em L
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
    l=zeros(n,n);//Zerar matrizes L e U
    u=zeros(n,n);
    for i=1:n//Diagonal de L igual a 1
        l(i,i)=1;
    end
    // cálculo dos elementos de L e U para j=1
    j=1;
    mprintf("\n////////Cálculo dos elementos de L e U para j=1\n\n")
    for i=1:n
        if i<=j then
            u(i,j)=A(i,j);
        else
            l(i,j)=A(i,j)/u(j,j);
        end
        mprintf("////Iteração: %d\n\n//////////Matriz L:\n",i)
            MATRIZ(l);
            mprintf("\n")
            mprintf("//////////Matriz U:\n")
            MATRIZ(u)
    end
    // cálculo dos elementos de L e U para j>1
    mprintf("\n////////Cálculo dos elementos de L e U para j>1\n\n")
    for i=1:n
        for j=2:n
            SumLU=0;
            for k=1:j-1
                SumLU=SumLU+l(i,k)*u(k,j);
            end
            if i<=j then
                u(i,j)=A(i,j)-SumLU;
            else
                l(i,j)=(A(i,j)-SumLU)/u(j,j);
            end
        end
        mprintf("////Iteração: %d\n\n//////////Matriz L:\n",i)
            MATRIZ(l);
            mprintf("\n")
            mprintf("//////////Matriz U:\n")
            MATRIZ(u)
    end
//Substituição progressiva LY=B
y=zeros(n,1);
y(1)=B(1);
for i=2:n
    SumLY=0;
    for j=1:i-1
        SumLY=SumLY+l(i,j)*y(j);
    end
    y(i)=B(i)-SumLY;
    mprintf("Vetor Y; I=%d\n", i)
    vetor(y)
end
//Substituição retroativa UX=Y
X=zeros(n,1);
X(n)=y(n)/u(n,n);
for i=n-1:-1:1
    SumUX=0;
    for j=i+1:n
        SumUX=SumUX+u(i,j)*X(j);
    end
    X(i)=(y(i)-SumUX)/u(i,i);
    mprintf("Vetor X; I=%d\n", i)
    vetor(X)
end
mprintf("/////////////////Vetor solução:\n");
IMPR(X);
