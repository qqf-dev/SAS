clear;
clc;
close all;

fs = 16000;

F = [0 4000 5000 6000 8000] / (fs / 2);
A = [0 0 1 0 0];

N = 720;
[b, a] = TriFilter(N, F);

[H, w] = freqz(b, a, 512);

[s, fs] = audioread('C_01_01.wav');
s = s';

ym2 = melVocoder(s, 32, fs, 50);

Ryy = conv(ym2, flip(ym2));
Ryy0 = max(Ryy);

for la = 1:100
    a = la * 0.01
    A = [1 zeros(1, N - 1), a];
    yt = filter(1, A, ym2);
    Rxx = conv(yt, flip(yt));

    t = sqrt(1 - Ryy0 / max(Rxx))
end

function [b, a] = TriFilter(N, F)

    A = [0 0.05 1.4 0.05 0];

    [b, a] = fir2(N, F, A, bartlett(N + 1));
end
