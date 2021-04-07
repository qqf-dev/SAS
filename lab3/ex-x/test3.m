clear;clc;
n=1:32;
x1=ones(1,8);
x2=[ones(1,8),zeros(1,8)];
x3=[ones(1,8),zeros(1,24)];
a1=1/length(x1)*fft(x1);
a2=1/length(x2)*fft(x2);
a3=1/length(x3)*fft(x3);
 
x3_2=zeros(1,32);
x3_8=zeros(1,32);
x3_12=zeros(1,32);
x3_all=zeros(1,32);
for k=[0:2 30 31]
x3_2(n)=x3_2(n)+a3(k+1)*exp(j*k*2*pi/32*(n-1));
end
for k=[0:8 24:31]
x3_8(n)=x3_8(n)+a3(k+1)*exp(j*k*2*pi/32*(n-1)); 
end
for k=[0:12 20:31]
x3_12(n)=x3_12(n)+a3(k+1)*exp(j*k*2*pi/32*(n-1));
end
for k=[0:16 17:31]
x3_all(n)=x3_all(n)+a3(k+1)*exp(j*k*2*pi/32*(n-1));
end
subplot(511);stem(0:31,real(x3_2));xlabel('n');ylabel('x3_2[n]');
subplot(512);stem(0:31,real(x3_8));xlabel('n');ylabel('x3_8[n]');
subplot(513);stem(0:31,real(x3_12));xlabel('n');ylabel('x3_12[n]');
subplot(514);stem(0:31,real(x3_all));xlabel('n');ylabel('x3_all[n]');
subplot(515);stem(0:31,real(x3));xlabel('n');ylabel('x3');