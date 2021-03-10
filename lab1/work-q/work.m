%{
TODO:list
note:1. 1.4 on book
done:Basic problems:a and b
done:Intermediate problems:c and d
done:Advanced Problems:e and f

note:2. 1.5 on book
done:Advanced problems:a, b, c and d
%}

%%% work1.4

%% a)
% show y[n] = sin((pi/2)x[n]) is not linear;
% use x_1[n] = delta[n];
% use x_2[n] = 2 delta[n];

clear;
clc;
Nmin = -5; % set start point
Nmax = 5;
n = Nmin:Nmax; % define the variable n

x1 = delta(Nmin, Nmax, 0);
y1 = sin((pi / 2) * x1);
x2 = 2 .* x1;
y2 = sin((pi / 2) * x2);
figure(1)
stem(n, y2, 'b+');
hold on
stem(n, y1, 'ro');
grid on
hold off
grid on

%% b)
% show y[n] = x[n] + x[n+1] is not causal;
% use x[n] = stage[n]

clear;
clc;
xNmin = -5;
xNmax = 9;
yMin = -6;
yMax = 9;

xn = xNmin:xNmax;
x1 = stage(Nmin, Nmax, 0);
x2 = stage(Nmin, Nmax, 1);

yn = yNmin:yNmax;
y = x1 + x2;
y = y[1,2:];

figure(2);
subplot(2,1,1)
stem(, y)
grid on
grid on

%% c)
% show y[n] = log(x[n]) is not stable

clear;
clc;
Nmin = 0;
Nmax = 10;

t = linspace(0, 10, 100);
n = Nmin:Nmax;

y1 = log(t);
y2 = log(n);

figure(3);
plot(t, y1);
hold on
stem(n, y2);
grid on
hold off
grid on

%% d)
% system in a) y[n] = sin((pi/2)x[n]) is not invertible;

clear;
clc;
Nmin = -5; % set start point
Nmax = 5;
n = Nmin:Nmax; % define the variable n

x1 = delta(Nmin, Nmax, 0);
y1 = sin((pi / 4) * x1);
x2 = 3 .* x1;
y2 = sin((pi / 4) * x2);
figure(4);
stem(n, y2, 'b+');
grid on
hold on
stem(n, y1, 'ro');
grid on
hold off
grid on

%%% give conunter-argument of oriperties: linear, time-invariant, causal, stable and invertible

%% e)
% y[n] = x^3[n]

clear;
clc;
Nmin = -5;
Nmax = 5;
n = Nmin:Nmax;
figure(5);
hold on;

% linear: False
% x_1[n] = n
% x_2[n] = 2n
% 2 * y_1[n] should equal y_2[n] if linear

x1 = n;
y1 = x1.^3;
x2 = 2 .* n;
y2 = x2.^3;

stem(n, 2 .* y1, 'ro');
stem(n, y2, 'b+')
grid on

% time-invariant: True

% causal: True

% stable: True

% invertible: True

%% f)
% y[n] = n x[n]

clear;
clc;
Nmin = -5;
Nmax = 5;
n = Nmin:Nmax;
figure(6);

% linear: True

% time-invariant: False
% x_1[n] = n
% x_2[n] = x[n - 1] = n - 1
% y_1[n] = n^2
% y_2[n] = n^2 - n
% y_1[n - 1] = (n - 1)^2 != y_2[n]

x1 = n;
x2 = n - 1;
y1 = n .* x1;
y2 = n .* x2;
y1_ = (n - 1) .* x2;

subplot(3, 1, 1);
stem(n, 2 .* y1, 'ro');
hold on
stem(n, y2, 'b+');
stem(n, y1_, 'bo');
grid on

hold off
grid on

% causal: True

% stable: False
% x[n] = stage[n] bounded in [0, 1]
% y[n] = n stage[n] is not bounded. [0, Infinity)
x = stage(Nmin, Nmax, 0);
y = n .* x;

subplot(3, 1, 2);
stem(n, y, 'ro');
grid on

hold off
grid on

% invertible: False
% x_1[n] = delta[n]
% x_2[n] = 2 delta[n]
% y[n] = 0

x1 = delta(Nmin, Nmax, 0);
x2 = 2 .* x1;
y1 = n .* x1;
y2 = n .* x2;

subplot(3, 1, 3);
stem(n, y1, 'ro');
hold on
stem(n, y2, 'b+');
grid on

hold off
grid on

%% g)
% y[n] = x[2n]

clear;
clc;
Nmin = -5;
Nmax = 5;
n = Nmin:Nmax;
figure(7)

% linear: True

% time-invariant: False
% x_1[n] = n
% x_2[n] = x_1[n-1] = n=1
% y_1[n] = x_1[2n] = 2n
% y_2[n] = x_2[2n] = x_1[2n-1] = 2n-1
% y_1[n-1] = x_1[2(n-1)] = 2n-2

x1 = n;
x2 = n - 1;
y1 = 2 .* x1;
y2 = 2 .* n - 1;
y1_ = 2 .* (n - 1);

subplot(3, 1, 1);
stem(n, y1, 'ro');
hold on
stem(n, y2, 'bo');
stem(n, y1_, 'b+');
grid on

hold off
grid on

% causal: False
% x[n] = stage[n - 1]
% y[n] = stage[2n - 1]
% y[1] = x[2]

x = stage(Nmin, Nmax, 1);
y = stage(Nmin, Nmax, 0.5);
subplot(3, 1, 2);
stem(n, x, 'ro');
hold on
stem(n, y, 'bo');
grid on

% stable: True

% invertible: False
% x_1[n] = cos(pi * n)
% x_2[n] = 1

x1 = cos(pi * n);
x2 = ones(1, Nmax - Nmin + 1);
y1 = cos(pi * 2 * n);
y2 = x2;
subplot(3, 1, 3);
stem(n, y1, 'ro');
hold on
stem(n, y2, 'b+');
grid on

hold off
grid on

%%% work1.5

% y[n] = a * y[n-1] + x[n]

%% a)
% y = diffeqn(a, x, yn1)
% see file diffeqn.m

%% b)
% a = 1, yn1 = -1, 0 <= n <= 30
% x1[n] = delta[n]
% x2[n] = stage[n]

clear;
clc;

a = 1;
yn1 = -1;
n = 0:30;
x1 = delta(0, 30, 0);
x2 = stage(0, 30, 0);
y1 = diffeqn(a, x1, yn1);
y2 = diffeqn(a, x2, yn1);

figure(8)
subplot(2, 1, 1);
stem(n, y1, 'ro');
grid on
hold on;

hold off
grid on

subplot(2, 1, 2);
stem(n, y2, 'bo');
grid on

hold off
grid on

%% c)
% a = 1, yn1 = -1, 0 <= n <= 30
% x_1[n] = stage[n]
% x_2[n] = 2 * stage[n]
% stem 2*y_1[n] - y_2[n]

clear;
clc;

a = 1;
yn1 = -1;
n = 0:30;

x1 = stage(0, 30, 0);
x2 = 2 * x1;

y1 = diffeqn(a, x1, yn1);
y2 = diffeqn(a, x2, yn1);
y3 = 2 * y1 - y2;

figure(9);
subplot(3, 1, 1);
stem(n, y1, 'ro');
grid on
hold on

hold off
grid on

subplot(3, 1, 2);
stem(n, y2, 'go');

hold off
grid on

subplot(3, 1, 3);
stem(n, y3, 'bo');
grid on

hold off
grid on

%% d)
% a = 1/2, x[n] = stage[n], 0 <= n <= 30;
% yn1 = 0, 1/2;

clear;
clc;

a = 1/2;
n = 0:30;
x = stage(0, 30, 0);
yn11 = 0;
yn12 = 1/2;
y1 = diffeqn(a, x, yn11);
y2 = diffeqn(a, x, yn12);

figure(10);
subplot(2, 1, 1);
stem(n, y1, 'ro');
grid on
hold on
grid on
subplot(2, 1, 2);
stem(n, y2, 'bo');

hold off
grid on
