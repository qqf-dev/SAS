clc;
clear;

figure(1);
X=[0:5];
x1=[1 zeros(1,5)];
x2=[0 1 zeros(1,4)];
x3=[1 2 zeros(1,4)];
x4=[0 0 1 0 0 0];
x5=[0 0 0 1 0 0];
x6=[0 1 2 0 0 0];
x7=[0 0 1 2 0 0];
w1=x1-x2-x4;
w2=x2-x4-x5;
w3=x3-x6-x7;
w4=w1+2*w2;
subplot(4,1,1),stem(X,w1);
subplot(4,1,2),stem(X,w2);
subplot(4,1,3),stem(X,w3);
subplot(4,1,4),stem(X,w4);

figure(2);
y1=cos(x1);
y2=cos(x2);
y3=cos(x3);
y4=y1+2*y2;
subplot(4,1,1),stem(X,y1);
subplot(4,1,2),stem(X,y2);
subplot(4,1,3),stem(X,y3);
subplot(4,1,4),stem(X,y4);

figure(3);
z1=X.*x1;
z2=X.*x2;
z3=X.*x3;
z4=z1+2*z2;
subplot(4,1,1),stem(X,z1);
subplot(4,1,2),stem(X,z2);
subplot(4,1,3),stem(X,z3);
subplot(4,1,4),stem(X,z4);


