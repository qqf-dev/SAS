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

clear;
clf;
clc;

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

plot(linspace(10, 20, 500), x(501:end), 'b')
hold on;
plot(linspace(10, 20, 500), y(501:end), 'r')
grid on;
legend('x(t)', 'y(t)');

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
plot(linspace(10, 20, 500), x2(501:end))
hold on
plot(linspace(10, 20, 500), y2(501:end))
grid on;
legend('x_2(t)', 'y_2(t)');

title("response of sign(cos(t))", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("x_2(t) and y_2(t)", 'fontsize', 15);

%%% c)

k = 1:5;

% x2(t) = s(t)-s(t-pi)
% a_k = sin(k * pi / 2)./(pi * k) - (-1).^k .* sin(pi * k / 2)./(pi * k);

% when k is even a_k = 0


% T = 2pi
% w0 = 2pi/2pi = 1
% a0 = 1/(2*pi) integral_{-[pi]}^{pi}(1)dt = 0

k = 2.*k - 1;

apos_k = sin(k * pi / 2)./(pi * k) - (-1).^k .* sin(pi * k / 2)./(pi * k);
aneg_k = sin(-k * pi / 2)./(-pi * k) - (-1).^(-k) .* sin(pi * -k / 2)./(pi * -k);
 

s1 = apos_k(1) * exp(1j * t) + aneg_k(1) * exp(-1j * t);
s2 = apos_k(2) * exp(3j * t) + aneg_k(2) * exp(-3j * t);
s3 = apos_k(3) * exp(5j * t) + aneg_k(3) * exp(-5j * t);
s4 = apos_k(4) * exp(7j * t) + aneg_k(4) * exp(-7j * t);
s5 = apos_k(5) * exp(9j * t) + aneg_k(5) * exp(-9j * t);

s = s1 + s2 + s3 + s4 + s5;

figure(3)

plot(t, x2);
hold on;
plot(t, s);
grid on;
legend('x_2(t)','ssum(t)');

title("sum of harmonic components", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("x_2(t) and ssum(t)", 'fontsize', 15);

%%% d)


y_1 = lsim(B, A, s1, t);
y_2 = lsim(B, A, s2, t);
y_3 = lsim(B, A, s3, t);
y_4 = lsim(B, A, s4, t);
y_5 = lsim(B, A, s5, t);
y_s = lsim(B, A, s, t);

y = y_1 + y_2 + y_3 + y_4 + y_5;

figure(4)
subplot(5, 1, 1), plot(t, y_1);
title("y1", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_1(t)", 'fontsize', 15);
grid on;

subplot(5, 1, 2), plot(t, y_2);
title("y2", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_2(t)", 'fontsize', 15);
grid on;

subplot(5, 1, 3), plot(t, y_3);
title("y3", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_3(t)", 'fontsize', 15);
grid on;

subplot(5, 1, 4), plot(t, y_4);
title("y4", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_4(t)", 'fontsize', 15);
grid on;

subplot(5, 1, 5), plot(t, y_5);
title("y5", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_5(t)", 'fontsize', 15);
grid on;

figure(5)

subplot(2,1,1),plot(t, y, 'r');
grid 

title("the sum of responses of harmonic components ", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_(t)", 'fontsize', 15);

subplot(2,1,2),plot(t, y_s, 'b');
grid on;

title("response of the sum of harmonic components ", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_ssum(t)", 'fontsize', 15);

%%% e)
figure(6)
plot(t,y2,'b-');
hold on;
plot(t,y_s,'r-');
grid on;

legend('y2(t)','y_s(t)')

title("comparing of responses", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_2(t) and y_ssum(t)", 'fontsize', 15);

% E = sum( |a_k|^2) = 1
% E = sum_{-5}^{5}(|a_k|^2)

E = 0;

for li = 1:5
    E = E + abs(apos_k(li))^2 + abs(aneg_k(li))^2;    
end
E



%%% f)

ya1 = 1/(1+1i)*apos_k(1) * exp(1j * t) + 1/(1-1i)*aneg_k(1) * exp(-1j * t);
ya2 = 1/(1+3i)*apos_k(2) * exp(3j * t) + 1/(1-1i)*aneg_k(2) * exp(-3j * t);
ya3 = 1/(1+5i)*apos_k(3) * exp(5j * t) + 1/(1-1i)*aneg_k(3) * exp(-5j * t);
ya4 = 1/(1+7i)*apos_k(4) * exp(7j * t) + 1/(1-1i)*aneg_k(4) * exp(-7j * t);
ya5 = 1/(1+9i)*apos_k(5) * exp(9j * t) + 1/(1-1i)*aneg_k(5) * exp(-9j * t);


figure(7)

subplot(5, 1, 1), plot(linspace(10, 20, 500), y_1(501:end)),hold on, plot(linspace(10, 20, 500), ya1(501:end) );
title("y1", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_1(t)", 'fontsize', 15);
legend('simulated','analytically determined')
grid on;

subplot(5, 1, 2), plot(linspace(10, 20, 500), y_2(501:end)),hold on, plot(linspace(10, 20, 500), ya2(501:end) );
title("y2", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_2(t)", 'fontsize', 15);
legend('simulated','analytically determined')
grid on;

subplot(5, 1, 3), plot(linspace(10, 20, 500), y_3(501:end)),hold on, plot(linspace(10, 20, 500), ya3(501:end) );
title("y3", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_3(t)", 'fontsize', 15);
legend('simulated','analytically determined')
grid on;

subplot(5, 1, 4), plot(linspace(10, 20, 500), y_4(501:end)),hold on, plot(linspace(10, 20, 500), ya4(501:end) );
title("y4", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_4(t)", 'fontsize', 15);
legend('simulated','analytically determined')
grid on;

subplot(5, 1, 5), plot(linspace(10, 20, 500), y_5(501:end)),hold on, plot(linspace(10, 20, 500), ya5(501:end) );
title("y5", 'fontsize', 18);
xlabel("t", 'fontsize', 15);
ylabel("y_5(t)", 'fontsize', 15);
legend('simulated','analytically determined')
grid on;
