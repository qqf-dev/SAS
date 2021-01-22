num1 = [100];
den1 = [1 20 0];
num2 = [15 75];
den2 = [1 12 20 50];
[num den] = parallel(num1,den1,num2,den2)
[z,p,k] = tf2zp(num,den)
sys = zpk(z,p,k)