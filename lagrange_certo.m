x=[0 2 4 ];
y=[1 5 17 ];

sum=0;
for i=1:length(x)
    p=1;
    for j=1:length(x)
        if j~=i
            c = poly(x(j))/(x(i)-x(j));
            p = conv(p,c);
        end
    end
    term = p*y(i);
    sum= sum + term;
end
disp(sum);


string_saida = '';
string_label = '';

grau_interface =0;

for i=length(sum):-1:2
    
     
    string_saida = strcat(string_saida, int2str(sum(i)),'.*x.^',int2str(grau_interface),' ');
    
    if(sum(i-1)>0)
    string_saida = strcat(string_saida,'+ ' );
else
        string_saida = strcat(string_saida, ' ' );
    end
 
    grau_interface=grau_interface+1;
    ans = i;
    
end

    string_saida = strcat(string_saida, int2str(sum(ans-1)),'.*x.^',int2str(grau_interface));
    string_label = strcat(string_label, int2str(sum(ans-1)),'*x^',int2str(grau_interface));
    
    
string_saida
c = inline(string_saida, 'x');
plot(x,c(x),'g-o')
title(string_saida);
ylabel(string_saida);
