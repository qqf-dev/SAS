clc;
clear;
num1 = [15];
den1 = conv([1,0],[1,5])
num2 = [3 1];
den2 = [1 6 15 19];
[num den] = series(num1,den1,num2,den2)
[z,p,k] = tf2zp(num,den)
sys = zpk(z,p,k)