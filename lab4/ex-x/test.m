clc;
clear;

tau=0.5;
N=201;
x=[zeros(1,1/tau) ones(1,2/tau+1) zeros(1,N-3/tau-1)];
figure(1);
plot([1:N]*tau,x,'r-','LineWidth',2),xlabel('n'),ylabel('x');axis([0 4 0 1.2]),legend('\tau=0.5,N=201');

y=fftshift(fft(x));
X=tau*y;
lb=(1-N)*pi/N/tau;
ub=(N-1)*pi/N/tau;
step=2*pi/N/tau;
figure(2);
plot(lb:step:ub,abs(X),'r-','LineWIdth',2);
xlabel('\omega');ylabel('abs(X)');
legend('\tau=0.5,N=201');