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

y = x0 .^ 3;

y(1,:)
