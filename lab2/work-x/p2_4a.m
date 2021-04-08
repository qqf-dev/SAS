clc;
clear;

figure(1)
X1=0:9;
X2=0:4;
x1=[ones(1,5) zeros(1,5)];
h1=[1 -1 3 0 1];
h2=[0 2 5 4 -1];
subplot(3,1,1),stem(X1,x1);
subplot(3,1,2),stem(X2,h1);
subplot(3,1,3),stem(X2,h2);

figure(2);
y1=conv(x1,h1);
y2=conv(h1,x1);
xx=(X1(1)+X2(1)):(X1(end)+X2(end));
subplot(2,1,1),stem(xx,y1);
subplot(2,1,2),stem(xx,y2);

figure(3);
y3=conv(x1,h1)+conv(x1,h2);
y4=conv(x1,h1+h2);
subplot(2,1,1),stem(xx,y3);
subplot(2,1,2),stem(xx,y4);

figure(4);
xh1=conv(x1,h1);
y5=conv(xh1,h2);
h1h2=conv(h1,h2);
y6=conv(x1,h1h2);
xx2=(X1(1)+X2(1)+X2(1)):(X1(end)+X2(end)+X2(end));
subplot(2,1,1),stem(xx2,y5);
subplot(2,1,2),stem(xx2,y6);