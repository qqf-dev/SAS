%{
TODO:list

TODO:3.8
note:Intermediate Problems
done:a
done:b
item:c
item:d
item:e
item:f

TODO:3.9
note:Intermediate Problems
item:a
item:b
note:Advanced Problems
item:c
item:d
item:e
item:f

%}

%%%%3.8

clear;
clc;

%%% a)

%% System1: y[n] - 0.8y[n-1] = x[n];
%% System2: y[n] + 0.8y[n-1] = x[n];

a1 = [1 -0.8];
b1 = 1;

a2 = [1 0.8];
b2 = 1;

%%% b)

%% N = 1024

[H1, w1] = freqz(a1, b1, 1024, 'whole');
figure(1)
subplot(2,1,1),plot(w1, abs(H1))
grid on;

%% aprroach /pi, increasing, so system 1 is highpass filter

[H2, w2] = freqz(a2, b2, 1024, 'whole');
subplot(2,1,2),plot(w2, abs(H2))
grid on;
%% aprroach /pi, decreasing, so system 2 is lowpass filter

%%% c)




