clc;
clear;

A=[1 -0.8];
B=[2 0 -1];
[H Omega]=freqz(B,A,40,'whole');
%A、B中有实数whole可带可不带，因为是对称的
%A、B中有复数whole需要带上
plot(Omega,abs(H),'*-');
xlabel('\omega');
ylabel('H(e^{j\omega})');
grid;