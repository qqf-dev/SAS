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
clf;

%% samples of signal y(t) = x(t-5) = yp(t)

tau = 0.01;
T = 10;
t = 0:tau:(T - tau);

%% y(t) = x(t-5) = e^(-2t+10)u(t-5) + e^(2t-10)u(-t+5)
%% in t = [0:tau:5] y(t) = e^(2t-10)
%% in t = [5+tau:tau:T-tau] y(t) = e^(-2t+10)

y = [exp(2 * (0:tau:5) - 10), exp(-2 * (5 + tau:tau:(T - tau)) + 10)];

figure(1);
plot(t, y);
xlabel("t", "fontsize", 15);
ylabel("y(t)", "fontsize", 15);

N = length(y);

%%% c)

Y = fftshift(tau * fft(y));

lb = (1 - N) * pi / N / tau;
ub = (N - 1) * pi / N / tau;
step = 2 * pi / N / tau;
figure(2)
plot(lb:step:ub, abs(Y), 'r-', 'LineWidth', 2);
xlabel('\omega', 'FontSize', 15);
ylabel('abs(Y)', 'FontSize', 15);
legend('\tau=0.5,N=1000', 'FontSize', 12)

%%% d)

w = -(pi / tau) + (0:N - 1) * (2 * pi / (N * tau));

%%% e)

%% Y = e^(5jw)X
%% X = e^(-5jw)Y

X = exp(-5j*w) .* Y;
figure(3)
plot(w,X);
xlabel('\omega', 'FontSize', 15);
ylabel('abs(X)', 'FontSize', 15);

figure(4)
plot(w,real(X));
hold on
plot(w,real(Y))
xlabel('\omega', 'FontSize', 15);
ylabel('Re(X)', 'FontSize', 15);
legend('X','Y','FontSize', 12)

figure(5)
plot(w,imag(X));
hold on
plot(w,imag(Y))
xlabel('\omega', 'FontSize', 15);
ylabel('Im(X)', 'FontSize', 15);
legend('X','Y','FontSize', 12)

%%% f)
