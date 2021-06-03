clear;
clc;
close all;

%% block 1
A = random(1,32);

X = ifft(A)*length(A);

X_cp = cpAdder(X);
%% block 3

% frequency of carrier signal
wc = 10^8;

% transmission signal
[t,S] = tran(X,wc);
%% channel

h = [0.5,0,0,0.4,0,0.35,0.3,0];
h = upsample(h,500);

% received signal
HS = conv(S,h);

%% block 4

% demodulated signal
DS = demodulator(HS,wc);

