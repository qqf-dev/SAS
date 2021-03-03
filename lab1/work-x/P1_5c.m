clc;
clear;
x=[0:30];
x1=[ones(1,31)];
x2=2*[ones(1,31)];
y1=diffeqn(1,x1,-1);
y2=diffeqn(1,x2,-1);
y3=2*y1-y2;

figure(1)
stem(x,y1);

figure(2)
stem(x,y2);

figure(3)
stem(x,y3);