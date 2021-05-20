clear;
clc;
close all;

[y fs] = audioread("C_01_01.wav");

[pxx, w] = pwelch(y, [], [], 512, fs);

F = [0 4000 5000 6000 8000] / (fs / 2);
A = [0 0 1 0 0];

N = 720;
b = fir2(N, F, A, bartlett(N + 1));

[H w] = freqz(b, 1, 512);

figure(1);
plot(w, abs(H));

[b1, a1] = butter(4, [4000 6000] / (fs / 2));
[H1 w1] = freqz(b1, a1, 512);
hold on;
plot(w1, abs(H1));

function [b, a] = TriFilter(F)

    A = [0 0 1 0 0];

    N = 720;
    [b, a] = fir2(N, F, A, bartlett(N + 1));
end
