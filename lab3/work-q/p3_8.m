clc;
clear;
clf;

%(a)
A1=[1 -0.8];
B1=1;
A2=[1 0.8];
B2=1;

%(b)
[H1 Omega1]=freqz(B1,A1,1024,'whole');
[H2 Omega2]=freqz(B2,A2,1024,'whole');
figure(1);
plot(Omega1,abs(H1)),grid on,xlabel('\omega'),ylabel('H_1{j\omega}'),title('frequcency of system 1');
figure(2);
plot(Omega2,abs(H2)),grid on,xlabel('\omega'),ylabel('H_2{j\omega}'),title('frequcency of system 2');

%c
figure(3);
a_x=[0 0.75 zeros(1,7) -0.5 0 -0.5 zeros(1,7) 0.75 ];
stem(0:19,a_x),grid on,xlabel('{\omega}_k=(2\pi/20)k'),ylabel('a_k');

%d
figure(4);
x_20=20*ifft(a_x);
x=[x_20 x_20 x_20 x_20 x_20 x_20];
stem(-20:99,x,'r'),xlabel('n'),ylabel('x[n]');

%e
figure(5);
x=[x_20 x_20 x_20 x_20 x_20];
y1=filter(B1,A1,x);
y2=filter(B2,A2,x);
subplot(2,1,1),stem(0:99,y1),grid on,xlabel('n'),ylabel('y1');
subplot(2,1,2),stem(0:99,y2),grid on,xlabel('n'),ylabel('y2');

%f
figure(6);
y1_20=y1(1:20);
y2_20=y2(1:20);
a_y1=fft(y1_20)/20;
a_y2=fft(y2_20)/20;
subplot(2,1,1),stem(-10:9,fftshift(abs(a_y1))),grid on,xlabel('k'),ylabel('a_{y_1}');
subplot(2,1,2),stem(-10:9,fftshift(abs(a_y2))),grid on,xlabel('k'),ylabel('a_{y_2}');
