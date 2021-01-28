%{
TODO:list
note:1. 1.4 on book
done:Basic problems:a and b
done:Intermediate problems:c and d
item:Advaced Problems: e and f

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
