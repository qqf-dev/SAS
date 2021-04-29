%{
TODO:list
note:Basic Problems
item:a
item:b
item:c
item:d
item:e
item:f
item:g

%}

%%%%4.2

%%% a)

%% g(t) = e^(-2t)u(t)
%% x(t) = g(t) + g(-t) = e^(-2t)u(t) + e^(2t)u(-t)
%% X(jw) = \frac{1}{2+jw} + \frac{1}{2-jw}

%%% b)

clear;
clc;
close all;

%% samples of signal y(t) = x(t-5) = yp(t)

tau = 0.01;
T = 10;
t = 0:tau:(T - tau);

%% y(t) = x(t-5) = e^(-2t+10)u(t-5) + e^(2t-10)u(-t+5)
%% in t = [0:tau:5] y(t) = e^(2t-10)
%% in t = [5+tau:tau:T-tau] y(t) = e^(-2t+10)

y = [exp(2 * (0:tau:5) - 10), exp(-2 * (5 + tau:tau:(T - tau)) + 10)];
figure(11)
plot(t,y)

xlabel("t", "fontsize", 15);
ylabel("y(t)", "fontsize", 15);
title("signal y(t)", "fontsize", 18)

N = length(y);

%%% c)

Y = fftshift(tau * fft(y));

lb = (1 - N) * pi / N / tau;
ub = (N - 1) * pi / N / tau;
step = 2 * pi / N / tau;

figure(12) 
plot(lb:step:ub,abs(Y))

xlabel("\omega", "fontsize", 15);
ylabel("abs(Y)", "fontsize", 15);
title("fft of signal y(t)", "fontsize", 18)

%%% d)

w = -(pi / tau) + (0:N - 1) * (2 * pi / (N * tau));

%%% e)

%% Y = e^(5jw)X
%% X = e^(-5jw)Y

X = exp(-5j*w) .* Y;

%%% f)
figure(1);
title("CTFT of signal x(t) by fft", "fontsize", 18);
subplot(211),plot(w, abs(X));
xlabel("\omega", "fontsize", 15);
ylabel("abs(X)", "fontsize", 15); 
title("CTFT of signal x(t) by theory", "fontsize", 18);
subplot(212),plot(w, unwrap(angle(X)));
xlabel("\omega", "fontsize", 15);
ylabel("phase(X)", "fontsize", 15);

X_ =1./(2+1j.*w)+1./(2-1j.*w);

figure(2)
subplot(211),plot(w, abs(X_));
xlabel("\omega", "fontsize", 15);
ylabel("abs(X(j\omega))", "fontsize", 15);
title("CTFT of signal x(t) by theory", "fontsize", 18);
subplot(212),plot(w, unwrap(angle(X_)));
xlabel("\omega", "fontsize", 15);
ylabel("phase(X(j\omega))", "fontsize", 15);

figure(3)
semilogy(w,abs(X));
hold on
semilogy(w,abs(X_));
xlabel("\omega", "fontsize", 15);
ylabel("log(abs(X(j\omega)))", "fontsize", 15);
title("different of CTFT of signal x(t)", "fontsize", 18);
legend("X","X(j\omega)");

%%% g)

figure(4)
subplot(211),plot(w,abs(Y));
xlabel("\omega", "fontsize", 15);
ylabel("abs(Y)", "fontsize", 15);
subplot(212),plot(w,unwrap(angle(Y)));
xlabel("\omega", "fontsize", 15);
ylabel("phase(Y)", "fontsize", 15);

figure(5)
semilogy(w,abs(Y));
hold on
semilogy(w,abs(X));
xlabel("\omega", "fontsize", 15);
ylabel("log(abs(X(j\omega)))", "fontsize", 15);
title("different of X and Y", "fontsize", 18);

legend("Y","X");
