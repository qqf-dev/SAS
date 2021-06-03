
clear;
clc;
close all;

x = rand (1,64);

figure(1)
stem(x);

X = IDFT(x);

T = cpAdder(X);

figure(2)
stem(abs(T));

wc = 10^8;

[t,Tr] = trans(T,wc);

figure(3)
plot(t,Tr);

[b,a] = butter(4,wc/(10^9/2));

Tt = Tr.*cos(2*pi*wc*t);

y = filter(b,a,Tt);

figure(4)
plot(t,y)

x2 = rand(1,64);

X2 = IDFT(x2);

T2 = cpAdder(X2);

[t,Tr2] = trans(T2,wc*5);

Tn = Tr + Tr2;

Ttt = Tn.*cos(2*pi*wc*t);
Ttx = Tn.*cos(2*pi*5*wc*t);


[b,a] = butter(4,wc/10^9);

y2 = filter(b,a,Ttt);
y3 = filter(b,a,Ttx);


figure(5)
plot(t,y2)
hold on
plot(t,y3)



h = [0.5,0,0,0.4,0,0.35,0.3,0];
h = upsample(h,500);

Trr = conv(Tr,h);

rt = linspace(0,10^(-9)*(length(Trr)-1),length(Trr));

[H,w] = ctft(Trr,10^9);
figure(6)
plot(w,abs(H))
hold on
[H1,w1] = ctft(Tr,10^9);
plot(w1,abs(H1))


[b,a] = butter(4,wc/10^9,'low');

Trc = Trr.*cos(2*pi*wc*rt);
Trs = Trr.*sin(2*pi*wc*rt);
y4c = filter(b,a,Trc);
y4s = filter(b,a,Trs);


figure(7)
plot(rt,y4c)
hold on
plot(rt,y4s);


