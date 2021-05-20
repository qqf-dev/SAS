clc;

clear;

clf;

load lineup.mat;

%sound(y,8192);

A = [1 zeros(1, 999) 0.5];

B = [1];

z = filter(B, A, y);

y2_t = flipud(y2);

NX = length(y2);

Ryy2 = conv(y2, y2_t);

plot([-NX + 1:NX - 1], Ryy2), title('Autp cprrelation of y2'), xlabel('n'), legend('Ryy2');

grid on;

%求出Ryy

figure(2);

[max1, index1] = max(Ryy2);

[max2, index2] = max(Ryy2(1:(index1 - 10)));

N2 = index1 - index2;

a = (y2(N2 + 1) - z(N2 + 1)) / z(1); %求出α

B1 = [1];

alpha = 1;
b1 = 1;
g = zeros(100,7000);

for li = 1:100

    a1 = [1 zeros(1, N2 - 1) alpha];

    alpha = alpha - 0.01;

    zt = filter(b1,a1,y2);


    g(li,:) = zt ;
    


end

B1 = [1];

A1 = [1 zeros(1, N2 - 1) a];

y2i = filter(B1, A1, y2);

plot(y2i, '--x'), grid on, legend('y_2i');

hold on;

%sound(y2i,8192);

figure(3);

y3_t = flipud(y3);

NX = length(y3);

Ryy3 = conv(y3, y3_t);

plot([-NX + 1:NX - 1], Ryy3), title('Autp cprrelation of y3'), xlabel('n'), legend('Ryy3');

grid on;

%求出Ryy3

figure(4);

[max31, index31] = max(Ryy3);

[max32, index32] = max(Ryy3(1:(index31 - 10)));

[max33, index33] = max(Ryy3(1:(index32 - 10)));

N31 = index31 - index32;

N32 = index31 - index33;

N32 + 1

a31 = (y3(N31 + 1) - z(N31 + 1)) / z(1);

y33 = filter(1, [1 zeros(1, N31 - 1) a31], y3);

a32 = (y33(N32 + 1) - z(N32 + 1)) / z(1);

B3 = [1];

A3 = [1 zeros(1, N31 - 1) a31 zeros(1, N32 - N31 - 1) 0.6];

y3i = filter(B3, A3, y3);

plot(y3i, '--x'), grid on, legend('y_3i');
