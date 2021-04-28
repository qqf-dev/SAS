clc;
clear;
clf;
u=randn(1,40);
nu=1:40;
v=u(end:-1:1);
nv=-40:-1;
w=conv(u,v);
nw=(nu(1)+nv(1)):(nu(end)+nv(end));
stem(nw,w);

figure(2);
NX=100;
x=randn(1,NX);
N=50;
alpha=0.9;
y=filter([1 zeros(1,N) alpha],1,x);
Ryy=conv(y,fliplr(y));
plot([-NX+1:NX-1],Ryy);