clc;
clear;
X1=[-5:1:5];
x1=[zeros(1,5) 1 zeros(1,5)];
x2=[zeros(1,5) 2 zeros(1,5)];
y1=sin((pi/2)*x1);
y2=sin((pi/2)*x2);
y3=2*y1;
grid on;
stem(X1,y1);
hold on;
stem(X1,y2);
stem(X1,y3);