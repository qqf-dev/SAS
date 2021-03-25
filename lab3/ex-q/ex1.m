%%%% ex1

%{
using freqz

%}

%%% y[n] - 0.8 y[n-1] = 2 x[n] - x[n-2]

% A = [1 -0.8 0]
% B = [2 0 -1]


clear;
clc;

A = [1 -0.8 0];
B = [2 0 -1];

[H, Omega] = freqz(B, A, 40, 'whole');
plot(Omega, abs(H), '*-');
xlabel("\omega",'fontsize',15);
ylabel("H(e^{j\omega})",'fontsize',15);
grid on
