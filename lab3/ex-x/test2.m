clc;
clear;
x=[zeros(1,20) ones(1,20)];
stem(0:39,x);
xlim([0 39]);
ylim([0 1.2]);

A=fft(x)/length(x);
B=fftshift(A);
figure(2);
subplot(2,1,1),stem(abs(A));
subplot(2,1,2),stem(-20:19,abs(fftshift(A)));

figure(3);
subplot(2,1,1),stem(0:length(x)-1,real(A),'*-');
subplot(2,1,2),stem(0:length(x)-1,imag(A),'*-');

figure(4);
A1=[A(1) zeros(1,39)];
A2=[A(1) A(2) zeros(1,37) A(40)];
A3=[A(1) A(2:15) zeros(1, 11) A(27:40)];
subplot(2,2,1),stem(1:40,ifft(A1)*40,'r');
subplot(2,2,2),stem(1:40,ifft(A2)*40,'g');
subplot(2,2,3),stem(1:40,ifft(A3)*40,'b');
subplot(2,2,4),stem(1:40,x,'k');
figure(5);
stem(1:40,ifft(A),'*-');

figure(6);
plot(1:40,ifft(A1)*40, 'r', 1:40,ifft(A2)*40, 'g', 1:40,ifft(A3)*40, 'b', 1:40,x, 'k');