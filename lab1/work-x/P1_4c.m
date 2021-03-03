clc;
clear;
X1=[0:1:6];
x2=linspace(0,6,200);
y1=log(X1);
y2=log(x2);
grid on;
stem(X1,y1);
hold on;
plot(x2,y2);
set(gca,'xtick',-5:1:10);
set(gca,'xticklabel',-5:1:10);