num = [1 9 7 5 10];
den = [1 45 37 28 13 26];
[z,p,k] = tf2zp(num,den)
sys = zpk(z,p,k)