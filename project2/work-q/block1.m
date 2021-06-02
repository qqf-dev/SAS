clear;
clc;
close all;

A = random(1,64);

X = ifft(A)*length(A);

cp = X(end-3:end);

X_emmiter = [cp X];

