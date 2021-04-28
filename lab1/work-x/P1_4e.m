clc;
clear;
X1=[-5:1:5];
y1=2*X1.^3;
y2=(2*X1).^3;
grid on;
stem(X1,y1);
hold on;
stem(X1,y2);