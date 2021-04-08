clc;
clear;

figure(1);
X=[0:19];
x1=[1 zeros(1,19)];
A=[1 -0.6];
B=[1];
h1=filter(B,A,x1);
h2(1)=1;
for i=1:19
    h2(i+1)=(3/5)^(i)*h2(i)+x1(i+1);
end;
subplot(2,1,1),stem(X,h1);
grid on;
subplot(2,1,2),stem(X,h2);
grid on;

figure(2);
x2=[ones(1,20)];
s1=filter(B,A,x2);
s2(1)=1;
for i=1:19
    s2(i+1)=(3/5)^(i)*s2(i)+x2(i+1);
end;
subplot(2,1,1),stem(X,s1);
grid on;
subplot(2,1,2),stem(X,s2);
grid on;

figure(3);
u=[ones(1,20)];
nu=0:19;
nv=0:19;
nw=(nu(1)+nv(1)):(nu(end)+nv(end));
z1=conv(h1,u);
z2=conv(h2,u);
for k=1:20
    Z1(k)=z1(k);
    Z2(k)=z2(k);
end
subplot(2,1,1),stem(nu,Z1);
subplot(2,1,2),stem(nu,Z2);

figure(4);
stem(nu,Z1);
hold on;
stem(X,s1,'r-v');
grid on;

figure(5);
stem(nu,Z2);
hold on;
stem(X,s2,'r-<');
grid on;
