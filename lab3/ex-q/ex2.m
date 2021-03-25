%%% ex2

%{
using lsim generate sampled output
%}

%%% o.3 y(t) + dy(t)/dt = 3 x(t)

% A = [1 0.3];
% B = [3];

clear;
clc;

A = [1 0.3];
B = 3;

t = 0:0.1:2 * pi;
x = cos(t);
y = lsim(B, A, x, t);
subplot(2, 1, 1), plot(t, x);
xlim([0 2*pi]);
grid on
subplot(2, 1, 2), plot(t, y);
xlim([0 2*pi]);
grid on
