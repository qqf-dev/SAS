%{
TODO:list

TODO:3.9
note:Intermediate Problems
item:a
item:b
note:Advanced Problems
item:c
item:d
item:e
item:f

%}

%% H(s) = 1 / (1+RCs)
%% x(t) = cos(t)

%%% a)

t = linspace(0, 20, 1000);
RC = 1;

x = cos(t);

% H(s) = (b_0 s^0) / (a_0 s^0 + a_1 s^1)
% B = [b0] = [1]
% A = [a0 a1] = [1 1]

B = 1;
A = [1 1];

y = lsim(B, A, x, t);

figure(1)

%% 10<=t<=20

plot(linspace(10, 20, 1000), x(10 * 1000:end), 'b')
plot(linspace(10, 20, 1000), y(10 * 1000:end), 'r')

title("response of cos(t)", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("x(t) and y(t)", 'fontsize', 15);

%%% b)

%% x2 = sign(cos(t))
x2 = cos(t);
x2(x2 > 0) = ones(size(x2(x2 > 0)));
x2(x2 < 0) = -ones(size(x2(x2 < 0)));

y2 = lsim(B, A, x2, t);

figure(2)
plot(linspace(10, 20, 1000), x2(10 * 1000:end))
plot(linspace(10, 20, 1000), y2(10 * 1000:end))

title("response of sign(cos(t))", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("x_2(t) and y_2(t)", 'fontsize', 15);

%%% c)

k = 1:5;

% x2(t) = s(t)-s(t-pi)
% a_k = 2 sin(k * pi)/ (k pi)

% T = 2pi
% w0 = 2pi/2pi = 1
% a0 = 1/(2*pi) integral_{-[pi]}^{pi}(1)dt = 0

apos_k = zeros(5);
aneg_k = apos_k;

for li = k
    apos_k(li) = 2 * sin(li * pi / 2);
    aneg_k(li) = 2 * sin(-li * pi / 2);
end

s1 = apos_k(1) * exp(1j * t) + aneg_k(1) * exp(-1j * t);
s2 = apos_k(2) * exp(2j * t) + aneg_k(2) * exp(-2j * t);
s3 = apos_k(3) * exp(3j * t) + aneg_k(3) * exp(-3j * t);
s4 = apos_k(4) * exp(4j * t) + aneg_k(4) * exp(-4j * t);
s5 = apos_k(5) * exp(5j * t) + aneg_k(5) * exp(-5j * t);

s = s1 + s2 + s3 + s4 + s5;

figure(3)

plot(t, x2);
plot(t, s);

title("sum of harmonic components", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("x_2(t) and s_<1,5>(t)", 'fontsize', 15);

%%% d)

clear y;
clear y2;

y1 = lsim(B, A, s1, t);
y2 = lsim(B, A, s2, t);
y3 = lsim(B, A, s3, t);
y4 = lsim(B, A, s4, t);
y5 = lsim(B, A, s5, t);
y_s = lsim(B, A, S, t);

y = y1 + y2 + y3 + y4 + y5;

figure(4)
subplot(5, 1, 1), plot(t, y1);
title("y1", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_1(t)", 'fontsize', 15);

subplot(5, 1, 2), plot(t, y2);
title("y2", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_2(t)", 'fontsize', 15);

subplot(5, 1, 3), plot(t, y3);
title("y3", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_3t)", 'fontsize', 15);

subplot(5, 1, 4), plot(t, y4);
title("y4", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_4t)", 'fontsize', 15);

subplot(5, 1, 5), plot(t, y5);
title("y5", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_5(t)", 'fontsize', 15);

figure(5)

plot(t, y, 'r');
plot(t, y_s, 'b-');

title("response of the sum of harmonic components ", 'fontsize',18);
xlabel("t", 'fontsize', 15);
ylabel("y(t) and y_ssum(t)", 'fontsize', 15);

%%% e)
