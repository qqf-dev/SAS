clear;
clc;

%%%%% ex 1.1

% see Selector for "if" logic
% Selector(18) % +5 if input > 10
% should output 23
% Selector(7) % +10 else
% should outpur 17

%%%%% ex 1.2
% see Accumulator for "for" loop logic
% Accumulator(5) % sum to 5
% should output 15

%%%%% Logical operators
%%% == Equal to
%%% ~= Not equal to
%%% < Strictly smaller
%%% > Strictly greater
%%% <= Smaller or equal to
%%% >= Greater or equal to
%%% & And
%%% | or
%%% ~ not

%%%%% function

% function [output_1, output_2, ... ,output_n] = function_name%also filename%(input_1, input_2, ... ,input_n)
% function code
% %for out, output_i = ...
% end

%%%%% figure

x = linspace(0, 4 * pi, 100);
y = sin(x);
% figure(1);
% plot(y);
% figure(2);
% plot(x, y);

%%%%
% x = linspace(0, 4 * pi, 100);
% y = sin(x);
% figure(1);
% plot(x, y);
% y1 = exp(-x / 3);
% figure(2);
% plot(x, y1);
% y2 = y .* y1;
% figure(3);
% plot(x,y2);

%%% stem and plot
% figure(4);
% plot(y);
% figure(5);
% stem(y);

%%% label
% xlabel("x");
% ylabel("sin(x)");

%%% line types ,plot symbols and colors
% plot(x, y, 'r--o', 'linewidth', 2);
% hold on
% plot(x, y + 1, 'k--', 'linewidth', 2);
% legend('wave1', 'wave2')
