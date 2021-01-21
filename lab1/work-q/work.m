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
n = -5:5; % define the variable n
x1 = zeros(length(n));
x1((length(n)+1)/2) = 1;
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
n = -5:5;
x = zeros(length(n));
for index = n
    if index > 0;
        x(index+6) = 1;
    end
end 

figure(2);
stem(n,x)
