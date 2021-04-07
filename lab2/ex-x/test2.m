clc;
clear;
t=[0:0.5:10];
x=[0 0 0 ones(1,length(t)-3)];
b=1;
a=[1 2];
s=lsim(b,a,x,t);
plot(t,s,'b--');