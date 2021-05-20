clear;
clc;
close all;

%(a)
figure(1)
X1=0:9;
X2=0:4;
x1=[ones(1,5) zeros(1,5)];
h1=[1 -1 3 0 1];
h2=[0 2 5 4 -1];
subplot(3,1,1),stem(X1,x1),grid on,xlabel('n'),ylabel('x_1[n]'),title('x[n]');
subplot(3,1,2,'r'),stem(X2,h1),grid on,xlabel('n'),ylabel('h_1[n]'),title('h_1[n]');
subplot(3,1,3),stem(X2,h2),grid on,xlabel('n'),ylabel('h_2[n]'),title('h_2[n]');

%(b)
y1=conv(x1,h1);
y2=conv(h1,x1);
xx=(X1(1)+X2(1)):(X1(end)+X2(end));
subplot(2,1,1),stem(xx,y1),grid on,xlabel('n'),ylabel('y[n]'),title('x_1[n]*h_1[n]');
subplot(2,1,2),stem(xx,y2,'r'),grid on,xlabel('n'),ylabel('y[n]'),title('h_1[n]*x_1[n]');

%(c)
y3=conv(x1,h1)+conv(x1,h2);
y4=conv(x1,h1+h2);
subplot(2,1,1),stem(xx,y3),grid on,xlabel('n'),ylabel('y[n]'),title('y_1[n]=x_1[n]*h_1[n]+x_1[n]*h_2[n]');
subplot(2,1,2),stem(xx,y4,'r'),grid on,xlabel('n'),ylabel('y[n]'),title('y_2[n]=x_1[n]*(h_1[n]+h_2[n])');

%(d)
xh1=conv(x1,h1);
y5=conv(xh1,h2);
h1h2=conv(h1,h2);
y6=conv(x1,h1h2);
xx2=(X1(1)+X2(1)+X2(1)):(X1(end)+X2(end)+X2(end));
subplot(2,1,1),stem(xx2,y5),grid on,xlabel('n'),ylabel('y[n]'),title('y_{d1}[n]=(x_1[n]*h_1[n])*h_2[n]');
subplot(2,1,2),stem(xx2,y6,'r'),grid on,xlabel('n'),ylabel('y[n]'),title('y_{d2}[n]=x_1[n]*(h_1[n]*h_2[n])');

%(e)
h1=[1 -1 3 0 1 0 0 0 0];
x1=[ones(1,5) zeros(1,5)];
h2=[0 0 1 -1 3 0 1];
x2=[0 0 ones(1,5) 0];
ye1=conv(x2,h1);
ye2=conv(x1,h2);
X1=[0:15];
stem(X1,ye1);
hold on;
stem(X1,ye2,'r-x'),grid on,xlabel('n'),ylabel('y[n]'),title('y_{e1}[n-2]andy_{e2}[n]');
legend('y_{e1}[n-2]','y_{e2}[n]=x_1[n]*h_1[n-2]');

%(f)
nx = 0:9;
nh = 0:8;
w=(nx+1).*x1;
nyf1=nx(1)+nh(1):nx(end)+nh(end);
nyf2=nx(1)+nh(1)*2:nx(end)+nh(end)*2;
yf1=conv(w,h1);
hf1=(nh+1).*(nh==0);
hf2=h1;
hseries=conv(hf1,hf2);
yf2=conv(x1,hseries);
figure(6)
stem(nyf1,yf1,'-rx');
hold on;
stem(nyf2,yf2,'bo');
hold off;
legend('conv by series', 'conv by impulse responses');
title('2.4 (f) "Verify Associative Property of The System"');
xlabel('n');
ylabel('y[n]');
ylim([0,20]);
print('-dpng','Lab2 2.4(f).png');

%(g)
xg=2*(nh==0);
yga=xg.^2;
hg2=h2;
ygb=conv(xg,hg2);
ng1=nh(1)*2:nh(end)*2;
yg1=[yga zeros(1,4)]+ygb;
hg1=(nh==0).^2;
hparallel=hg1+hg2;
yg2=conv(xg,hparallel);
ng2=ng1;
stem(ng1,yg1,'-rx');
hold on;
stem(ng2,yg2,'bo');
hold off;
legend('parallel connection', 'sum up impulse responses');
title('2.4 (g) "Verify Distributive Property of The System"');
xlabel('n');
ylabel('y[n]');
xlim([-1,8])
ylim([0,11]);
print('-dpng','Lab2 2.4(g).png');
