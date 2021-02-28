%{
TODO:list
note:1. 1.4 on book
done:Basic problems:a and b
done:Intermediate problems:c and d
item:Advaced Problems:e and f

note:2. 1.5 on book
item: ...
    %}

%%% work1.4

%% a)

% y[n] = sin( (pi/2) x[n] )
% signals x_1[n] = \delta[n] and x_2[n] = 2\delta[n]

clear;
clc;
Nmin = -5; % set start point
Nmax = 5;
n = Nmin:Nmax; % define the variable n

x1 = delta(Nmin, Nmax, 0);

y1 = sin((pi / 2) * x1);
x2 = 2 .* x1;
y2 = sin((pi / 2) * x2);
figure(1);
stem(n, y2, 'b+');
hold on
stem(n, y1, 'ro');
hold off

%% b)
clear;
clc;
Nmin = -5;
Nmax = 9;

n = Nmin:Nmax;
x1 = stage(Nmin, Nmax, 0);
x2 = stage(Nmin, Nmax, 1);

y = x1 + x2;

figure(2);
stem(n, y)

%% c)
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
hold off

%% d)
clear;
clc;
Nmin = -5; % set start point
Nmax = 5;
n = Nmin:Nmax; % define the variable n

x1 = delta(Nmin, Nmax, 0);
y1 = sin((pi / 2) * x1);
x2 = 5 .* x1;
y2 = sin((pi / 2) * x2);
figure(4);
stem(n, y2, 'b+');
hold on
stem(n, y1, 'ro');
hold off

%% e)
clear;
clc;
Nmin = -5;
Nmax = 5;
n = Nmin:Nmax;

x00 = n;
x10 = delta(Nmin, Nmax, 0);
x20 = 2 * n;
x30 = n.^2;

x01 = sin(x00);
x02 = cos(x00);
x03 = exp(x00);
x04 = log(x00);

x11 = sin(x10);
x12 = cos(x10);
x13 = exp(x10);
x14 = log(x10);

x21 = sin(x20);
x22 = cos(x20);
x23 = exp(x20);
x24 = log(x20);

x31 = sin(x30);
x32 = cos(x30);
x33 = exp(x30);
x34 = log(x30);

x0 = [x00; x01; x02; x03; x04];
x1 = [x10; x11; x12; x13; x14];
x2 = [x20; x21; x22; x23; x24];
x3 = [x30; x31; x32; x33; x34];

s = ["ro" "go" "bo" "mo" "ko" "r+" "g+" "b+" "m+" "k+"];

y = x0.^3;

figure(5);
hold on;

for li = 1:5
    subplot(3, 2, li)
    stem(n, y(li, :), s(li));
end

% stem(n, y(2));
% stem(n, y(3));
% stem(n, y(4));
% stem(n, y(5));

% %% f)
% clear;
% clc;
% Nmin = -5;
% Nmax = 5;
% n = Nmin:Nmax;

% x = n;
% y = n .* x;

% figure(6);
% stem(n, y);

% %% g)
% clear;
% clc;
% Nmin = -5;
% Nmax = 5;
% n = Nmin:Nmax;

% x = 2 * n;
% y = x;
% figure(7);
% stem(n, y);
