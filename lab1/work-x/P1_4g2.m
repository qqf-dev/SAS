clc;
clear;
X1=[-5:1:5];
y1=[zeros(1,7) ones(1,4)];
y2=[zeros(1,6) ones(1,5)];
subplot(2,1,1);
grid on;
subplot(2,1,1),stem(X1,y1);
subplot(2,1,2),stem(X1,y2);