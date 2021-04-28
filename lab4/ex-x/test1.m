clc;
clear;
clf;
a=[1 3];
b=3;
w=linspace(0,4*pi,100);
H=freqs(b,a,w);
subplot(2,1,1),plot(w,abs(H));
subplot(2,1,2),plot(w,angle(H));

