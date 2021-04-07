function y = diffeqn(a,x,yn1)
n=length(x);
for i=1:n
    if i==1
        y(i)=a*yn1+x(i);
    else
        y(i)=a*y(i-1)+x(i);
    end
end
end
