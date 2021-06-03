clear;
clc;
close all;
a = 1;

wc = 10^8;

hn = [0.5, 0, 0, 0.4, 0, 0.35, 0.3, 0];
h = upsample(hn, 500);

Hn = ChT(32, h, 4, wc, 250,1000);

figure(a);
stem(Hn);
a = a + 1;

A = rand(1, 32);
X = ifft(A) .* length(A);
X_cp = cpAdder(X);
[S, t] = trans(X_cp, wc);
HS = conv(S, h);
DS = demodulator(HS, wc);
SN = ADC(DS, 500);
SNA = SN(8+1:end-8);
SNA = downsample(SNA, 2);

YN = fft(SNA) ./ length(SNA);

YA = YN ./ Hn;

figure(a);
stem(YA);
hold on
stem(A);
a = a + 1;
