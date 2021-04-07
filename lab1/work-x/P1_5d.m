clc;
clear;
x=[0:30];
x1=[ones(1,31)];
y1=diffeqn(0.5,x1,0);
y2=diffeqn(0.5,x1,0.5);

figure(1)
stem(x,y1);

figure(2)
stem(x,y2);

figure(3)
stem(x,y1);
hold on;
stem(x,y2);