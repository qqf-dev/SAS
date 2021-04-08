clc;
clear;
clf;

%b\c
N=8;
x=(0.9).^[0:N-11]; % create one period of xCn1 
tic;
X=dtfs([1 2 3 4],0); % Store the DTFS of x [n] in X 
toc;
c = t; % Store the time of operations in c