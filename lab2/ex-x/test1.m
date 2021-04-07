clc;
clear;
figure(1);
x=[1 2 3 4 0 0 1 3 2 1 0 0 0];
A=1;
B=[0 0.8:-0.2:0.4];
y=filter(B,A,x);
subplot(3,1,1),stem(x);
subplot(3,1,2),stem(y);
h=[0 0.8 0.6 0.4];
y1=conv(x,h);
subplot(3,1,3),stem(y1);

figure(2);
A2 = [0.8:-0.2:0.4];
B2 = 1;
z = filter(B2, A2, y);
subplot(2,1,1), stem(x);
subplot(2,1,2), stem(z);