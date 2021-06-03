clc;
clear;
close all;
 
wc = 100*10^6;
N = 32;
x = -sqrt(2)/2+2*sqrt(2)/2*round(rand(N,1)).'+j*sqrt(2)/2*(-1+2*round(rand(N,1))).'; %random input bits
n = 0:31;  %N=32 for length of bits
figure(1)
subplot(2,1,1);stem(n,real(x));xlabel('n');ylabel('real(SymbolPilot)');
subplot(2,1,2);stem(n,imag(x));xlabel('n');ylabel('imag(SymbolPilot)');
x_n = ifft(x); %discrete time inv FT
figure(2)
subplot(2,1,1);stem(n,real(x_n));xlabel('n');ylabel('real(OFDMsymbol)');
subplot(2,1,2);stem(n,imag(x_n));xlabel('n');ylabel('imag(OFDMsymbol)');
n_cp = 4;
x_cp = [x_n(end-3:end) x_n];%add cp
 
N_cp=36;
n2 = 0:35; %N'=32+4=36
 
figure(3)
subplot(2,1,1);stem(n,real(x_n));xlabel('n');ylabel('real(OFDMsymbol)');
subplot(2,1,2);stem(n2,real(x_cp));xlabel('n');ylabel('real(OFDMPilot)');
 
R=1000; 
xp = upsample(x_cp,R);
xc = reshape(repmat(x_cp,R,1),1,[]); %0 order hold
 
dt = 10^-9; %dt=1ns
t = [0:dt:(N_cp*10^(-6)-dt)];%time axis
 
figure(4)
subplot(2,1,1);plot(t,xp);xlabel('t');ylabel('pulse');
subplot(2,1,2);plot(t,xc);xlabel('t');ylabel('pulse shaping');
 
x_send = real(xc).*cos(2*pi*wc*t) +imag(xc).*sin(2*pi*wc*t);%tr siganl
x_send_freq = fftshift(fft(x_send));%freq of sended signal
 
figure(5)
subplot(2,1,1);plot(t,x_send);xlabel('t');ylabel('OFDMPlotRF');
subplot(2,1,2);stem(abs(x_send_freq)/length(x_send_freq));xlabel('\omega');ylabel('Freq. of OFDMPlotRF');
 
hn = [0.5 zeros(1,1499) 0.4 zeros(1,999) 0.35 zeros(1,499) 0.3];
% hn=[1 zeros(1,3000)];
yn = conv(x_send,hn);
[b,a] = butter(4,wc/(1000/10^-6)*2,'low');
ly = [0:dt:(39*10^(-6)-dt)];
y_real = 2*filter(b,a,yn.*cos(2*pi*wc*ly));
y_imag = 2*filter(b,a,yn.*sin(2*pi*wc*ly));
y_real = y_real+y_imag*1i;
figure(6)
subplot(2,1,1);plot(real(y_real),'r');hold on;plot(real(xc),'b');ylabel('OFDMLpfReal*2');
hold off;
subplot(2,1,2);plot(y_imag,'r');hold on;plot(imag(xc),'b');xlabel('t');ylabel('OFDMLpfImag*2');
hold off;
 
 
 
y_intcp = zeros(1,36);
for a = 1:36
    for i = 1:1000
        y_intcp(a) = y_intcp(a) + y_real(1000*(a-1)+i)/1000;
    end
end
 
figure(8)
subplot(2,1,1);stem(n2,x_cp);xlabel('t');ylabel('real(OFDMPlot)');
subplot(2,1,2);stem(n2,y_intcp);xlabel('t');ylabel('Int');
 
y_Int = y_intcp(5:end); %remove cp
 
y_intc = y_intcp(5:36);
y_final = fft(y_intc);
h_n = y_final./x;
h_n_time=ifft(h_n);
 
figure(9)
subplot(2,1,1);stem(n,x_n);xlabel('n');ylabel('real(OFDMSymbol)');
subplot(2,1,2);stem(n,y_Int);xlabel('n');ylabel('real(OFDMRemoveCP)');
y_rec = fft(y_Int); %fft fin
 
figure(10)
subplot(2,1,1);stem(n,x,'b');xlabel('n');ylabel('dk');
subplot(2,1,2);stem(n,y_rec,'b');xlabel('n');ylabel('fft(OFDMRemoveCP)');
 
x_rec = y_rec./(fft(h_n_time));%devide chanel gain
 
figure(11)
subplot(2,1,1);stem(n,real(x));xlabel('n');ylabel('real(SymbolPilot)');
subplot(2,1,2);stem(n,real(x_rec));xlabel('n');ylabel('real(OFDMRemoveDC)');
 
error=x_rec-x;
figure(12);stem(n,error);title('error analysis');xlabel('n');ylabel('error');
