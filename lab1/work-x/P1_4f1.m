clc;
clear;
X1=[-5:1:5];
n1=X1;
n2=[-6:1:4];
y1=n2.*X1;
y2=n2.*n2;
grid on;
stem(X1,y1);
hold on;
stem(X1,y2);