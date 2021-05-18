clc;
clear;

%5.1
figure(1);
[y1,fs]=audioread('C_01_01.wav');
[y2,fs]=audioread('C_01_02.wav');
y1=y1';
y2=y2';
N=length(y1);
noise=1-2*rand(1,N);
sig=repmat(y1,1,10);
[Pxx,w] =pwelch(sig,[],[],512,fs);
b = fir2(3000,w/(fs/2),sqrt(Pxx/max(Pxx)));
[h,wh] = freqz(b,1,128); %check frequency response here
ssn= filter(b,1,noise);
[Pyy,w1]= periodogram(ssn,[],512,fs);
subplot(2,1,1),plot(w,20*log10(Pxx));
grid on;
title('power spectra density of the speech signal in dB expression'),xlabel('w'),ylabel('pxx/dB');
subplot(2,1,2),plot(w,Pxx);
grid on;
title('power spectra density of the speech signal'),xlabel('w'),ylabel('pxx');

figure(2)
subplot(3,1,1),plot(wh,20*log10(abs(h)));
grid on;
title('frequency response of the filter in dB expression'),xlabel('\omega'),ylabel('|H(jw)|/dB');
subplot(3,1,2),plot(wh,abs(h));
grid on;
title('frequency response of the filter'),xlabel('\omega'),ylabel('|H(jw)|');
subplot(3,1,3),plot(wh,unwrap(angle(h)));
grid on;
title('frequency response of the filter'),xlabel('\omega'),ylabel('phase angle of |H(jw)|');

figure(3)
subplot(2,1,1),plot(w1,20*log10(Pyy));
grid on;
title('power spectra density of SSN in dB expression'),xlabel('w'),ylabel('pyy/dB');
subplot(2,1,2),plot(w1,Pyy);
grid on;
title('power spectra density of SSN'),xlabel('w'),ylabel('pyy');

%5.2
snr=-5;
ssn1=ssn/(norm(ssn)*(10^(snr/20)))*norm(y1);%find ssn
SNR=20*log10(norm(y1)/norm(ssn1));
y=y1+ssn1;%use function to find y
yy=y*norm(y1)/norm(y);%Energy normalization
nSSN=norm(ssn)
nSSN1=norm(ssn1)
A=norm(y1)/(10^(-0.25))

%5.3a
% fs=16000;
[b1,a1]=butter(2,100/(fs/2)); 
[b2,a2]=butter(2,200/(fs/2));
[b3,a3]=butter(2,300/(fs/2));
[b4,a4]=butter(6,200/(fs/2));
y1=filter(b1,a1,abs(y));
y2=filter(b2,a2,abs(y));
y3=filter(b3,a3,abs(y));
y4=filter(b4,a4,abs(y));

[h1,f1]=freqz(b1,a1,512,fs);%check
[h2,f2]=freqz(b2,a2,512,fs);%check
[h3,f3]=freqz(b3,a3,512,fs);%check
[h4,f4]=freqz(b4,a4,512,fs);%check
figure(4)
plot(f1,20*log10(abs(h1))); 
hold on,grid on;
plot(f2,20*log10(abs(h2)));
plot(f3,20*log10(abs(h3)));
plot(f4,20*log10(abs(h4)));
title('frequency response of filters'),xlabel('w'),ylabel('|H(jw)|');
axis([0 500 -50 5]),legend('f1','f2','f3','f4');

figure(5)
subplot(3,1,1),plot(y1);
grid on;
title('envelope for f_{cut}=100');
subplot(3,1,2),plot(y2);
grid on;
title('envelope for f_{cut}=200');
subplot(3,1,3),plot(y3);
grid on;
title('envelope for f_{cut}=300');
 
 
figure(6)
subplot(2,1,1),plot(y2);
grid on;
title('envelope for 2nd order');
xlim([0,length(y)-45000]);
subplot(2,1,2),plot(y4);
grid on;
title('envelope for 6th order');
xlim([0,length(y)-45000]);