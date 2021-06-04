clear;
clc;
close all;
a = 1;

wc = 10^8;

hn = [0.5, 0, 0, 0.4, 0, 0.35, 0.3, 0];
h = upsample(hn, 500);

% get the real signal
A = 【;

figure(1)
stem(A)
title("Original Signal",'fontsize',18)

X = ifft(A) .* length(A);

S = trans(X, wc);

HS = conv(S, h);

%%% RF front-end

% for T = 500ns dt = 1ns
dt = 10^(-9);
T = 1000;

%% real part
[ydemR,ydemI] = demodulator(HS, wc);
c = T - mod(length(ydemR), T);
ydemR = [ydemR, zeros(1, c)];
ydemI = [ydemI, zeros(1, c)];

th = linspace(0, (length(ydemR) - 1) * 10^(-9), length(ydemR));
figure(2)
subplot(211),plot(th, ydemR);
grid on
ylabel("OFDMLpfReal*2")
title("demodelated signal",'fontsize',18)
subplot(212),plot(th, ydemI);
grid on
ylabel("OFDMLpfImag*2")

% part of ADC2
[ygr, yintR] = ADC2(ydemR, T);
[ygi, yintI] = ADC2(ydemI, T);

figure(3)
subplot(211),plot(th, yintR);
grid on
title("the recived power", "FontSize", 18)
ylabel("Real part")
subplot(212),plot(th, yintI);
grid on
ylabel("Imagine part")

figure(4);
subplot(211),stem(ygr)
title("the signal after intergral and sampling", "FontSize", 18)
ylabel("Real part")
subplot(212),stem(ygi)
ylabel("Imagine part")



