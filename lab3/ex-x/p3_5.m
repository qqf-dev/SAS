clc;
clear;
clf;

%b
a=[1 2*exp(-(pi/2)*1i) exp((pi/4)*1i) exp(-(pi/4)*1i) 2*exp((pi/2)*1i)];

%c
figure(1);
x=5*ifft(a);
subplot(2,1,1),stem(0:4,real(x)),grid on,xlabel('n'),ylabel('x[n]'),title('real');
subplot(2,1,2),stem(0:4,imag(x)),grid on,xlabel('n'),ylabel('x[n]'),title('imag');

%d
figure(2);
X=[0:63];
N1=8;
N2=16;
N3=32;
x1=[ones(1,8)];
x11=[x1 x1 x1 x1 x1 x1 x1 x1];
x2=[ones(1,8) zeros(1,8)];
x22=[x2 x2 x2 x2];
x3=[ones(1,8) zeros(1,24)];
x33=[x3 x3];
subplot(3,1,1),stem(X,x11),grid on,xlabel('n'),ylabel('x1[n]'),title('x1[n]');
subplot(3,1,2),stem(X,x22),grid on,xlabel('n'),ylabel('x2[n]'),title('x2[n]');
subplot(3,1,3),stem(X,x33),grid on,xlabel('n'),ylabel('x3[n]'),title('x3[n]');

%e
figure(3);
a1=fft(x1)/64;
a2=fft(x2)/64;
a3=fft(x3)/64;
subplot(3,1,1),stem([1:8],abs(a1)),grid on,xlabel('n'),ylabel('a1'),title('the DTFS coefficient of x1[n]');
subplot(3,1,2),stem([1:16],abs(a2)),grid on,xlabel('n'),ylabel('a2'),title('the DTFS coefficient of x2[n]');
subplot(3,1,3),stem([1:32],abs(a3)),grid on,xlabel('n'),ylabel('a3'),title('the DTFS coefficient of x3[n]');

%fg
figure(4);
x3=[ones(1,8) zeros(1,24)];
n=0:31;
a33=fft(x3)*1/32;
x3_2=zeros(1,32);
x3_8=zeros(1,32);
x3_12=zeros(1,32);
x3_all=zeros(1,32);
for j=-2:2
    if j<0
        k=32+j;
        x3_2=x3_2+a33(k+1)*exp(2*pi/32*n*k*1i);
    else
        x3_2=x3_2+a33(j+1)*exp(2*pi/32*n*j*1i);
    end
end
for j=-8:8
    if j<0
        k=32+j;
        x3_8=x3_8+a33(k+1)*exp(2*pi/32*n*1i*k);
    else
        x3_8=x3_8+a33(j+1)*exp(2*pi/32*n*1i*j);
    end
end
for j=-12:12
    if j<0
        k=32+j;
        x3_12=x3_12+a33(k+1)*exp(2*pi/32*n*1i*k);
    else
        x3_12=x3_12+a33(j+1)*exp(2*pi/32*n*1i*j);
    end
end
for j=-15:16
    if j<0
        k=32+j;
        x3_all=x3_all+a33(k+1)*exp(2*pi/32*n*1i*k);
    else
        x3_all=x3_all+a33(j+1)*exp(2*pi/32*n*1i*j);
    end
end
subplot(4,1,1),stem(n,real(x3_2)),grid on,xlabel('n'),ylabel('x3_2[n]');
subplot(4,1,2),stem(n,real(x3_8)),grid on,xlabel('n'),ylabel('x3_8[n]');
subplot(4,1,3),stem(n,real(x3_12)),grid on,xlabel('n'),ylabel('x3_12[n]');
subplot(4,1,4),stem(n,real(x3_all)),grid on,xlabel('n'),ylabel('x3_all[n]');

%h
figure(5);
subplot(2,1,1),stem(n,real(x3_all)),grid on,xlabel('n'),ylabel('x3_all[n]');
subplot(2,1,2),stem(n,x3),grid on,xlabel('n'),ylabel('x3[n]');