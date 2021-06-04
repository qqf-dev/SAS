clear;
clc;
close all;

a = 1;
%% block 1
A = rand(1, 32);

figure(a);
stem(A);
a = a + 1;

X = ifft(A) * length(A);

X_cp = cpAdder(X);
%% block 3

% frequency of carrier signal
wc = 10^8;

% transmission signal
[S, t] = trans(X_cp, wc);
%% channel

hn = [0.5, 0, 0, 0.4, 0, 0.35, 0.3, 0];
h = upsample(hn, 500);

% received signal
HS = conv(S, h);

%% block 4

% demodulated signal
DS = demodulator(HS, wc);

figure(a);
plot(linspace(0, (length(DS) - 1) * (10^(-9)), length(DS)), DS);
a = a + 1;


[Hh,w] = ctft(DS,10^9);
figure(a);
plot(w,abs(Hh));
a = a + 1;

SN = ADC(DS, 500);

figure(a);
stem(SN);
a = a + 1;

DS = SN(9:9+63);
DS = downsample(DS, 2);

y = fft(DS) ./ length(DS);

figure(a);
stem(y);
a = a + 1;

% get information of Hn
% giving test signal [1 ... 1]

TA = ones(1, length(A));

TX = ifft(TA) .* length(TA);
TX_cp = cpAdder(TX);
[TS, tt] = trans(TX_cp, wc);
TH = conv(TS, h);
TDS = demodulator(TH, wc);
TSN = ADC(TDS, 500);
TSNA = TSN(9:9+64-1);
TSNB = downsample(TSNA, 2);

RN = fft(TSNB)./length(TSNB);

Hn = RN./TA;

figure(a);
stem(Hn);
a = a + 1;


AS = y./Hn;

figure(a);
stem(AS);
hold on;
stem(A);
a = a + 1;

