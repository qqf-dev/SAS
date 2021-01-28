%{
TODO:list
note:1. 1.4 on book
item:basic problems:a and b
item:Intermediate problems:c and d

note:2. 1.5 on book
item: ...
    %}

% work1.4
% a)

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

% b)
clear;
clc;
Nmin = -50;
Nmax = 50;

n = Nmin:Nmax;
y = zeros(length(n));

for li = 1:50
    y = y + sin(li) * delta(Nmin, Nmax, li - 30);
end

figure(2);
stem(n, y)
