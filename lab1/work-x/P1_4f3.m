clc;
clear;
X1=[-5:1:5];
y1=zeros(1,11);
y2=2*y1;
subplot(2,1,1);
grid on;
subplot(2,1,1),stem(X1,y1);
subplot(2,1,2),stem(X1,y2);