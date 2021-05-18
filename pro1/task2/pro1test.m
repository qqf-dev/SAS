clc;
clear;

[x,fs]=audioread('C_01_01.wav');
N = 4;

x = x';

s1 = pro1(x,N,fs,20);
s2 = pro1(x,N,fs,50);
s3 = pro1(x,N,fs,100);
s4 = pro1(x,N,fs,400);
figure(2)
subplot(4,1,1),plot(s1);
subplot(4,1,2),plot(s2);
subplot(4,1,3),plot(s3);
subplot(4,1,4),plot(s4);