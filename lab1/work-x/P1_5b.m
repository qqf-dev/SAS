clc;
clear;
x=[0:30];
x1=[1 zeros(1,30)];
x2=[ones(1,31)];
y1=diffeqn(1,x1,0);
y2=diffeqn(1,x2,0);
grid on;
subplot(2,1,1);
subplot(2,1,1),stem(x,y1);
subplot(2,1,2),stem(x,y2);