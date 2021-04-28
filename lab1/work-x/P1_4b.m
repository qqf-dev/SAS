clc;
clear;
X1=[-5:1:10];
y1=[zeros(1,5) ones(1,11)];
y2=[zeros(1,4) ones(1,12)];
y3=y1+y2;
subplot(3,1,1);
grid on;
subplot(3,1,1),stem(X1,y1);
set(gca,'xtick',-5:1:10);
subplot(3,1,2),stem(X1,y2);
set(gca,'xtick',-5:1:10);
subplot(3,1,3),stem(X1,y3);
set(gca,'xtick',-5:1:10);

