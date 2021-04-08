%{
TODO:list

TODO:3.8 coding
note:Intermediate Problems
done:a
done:b
done:c
done:d
done:e
done:f

TODO:3.8 picture and writing
item:a
item:b
item:c
item:d
item:e
item:f


%}

%%%%3.8

clear;
close all;
clc;

%%% a)

%% System1: y[n] - 0.8y[n-1] = x[n];
%% System2: y[n] + 0.8y[n-1] = x[n];

a1 = [1 -0.8];
b1 = 1;

a2 = [1 0.8];
b2 = 1;

%%% b)

%% N = 1024
[H1, w1] = freqz(b1, a1, 1024, 'whole');

subplot(2, 1, 1), plot(w1, abs(H1));
xlabel('\omega','fontsize',15)
ylabel('H_1(e^{j\omega})','fontsize',15)
title('frequency resposes of System 2','FontSize',18)

grid on;

%% aprroach /pi, increasing, so system 1 is highpass filter

[H2, w2] = freqz(b2, a2, 1024, 'whole');
subplot(2, 1, 2), plot(w2, abs(H2))
grid on;
%% aprroach /pi, decreasing, so system 2 is lowpass filter

xlabel('\omega','fontsize',15)
ylabel('H_2(e^{j\omega})','fontsize',15)
title('frequency resposes of System 2','FontSize',18)


%%% c)

% shifting the negative value to another period
a_x = [0 3/4 0 0 0 0 0 0 0 -1/2 0 -1/2 0 0 0 0 0 0 0 3/4];

k = 0:19;

wk = 2 * pi / 20 * k;
figure(2)
subplot(2,1,1),stem(wk, a_x);
grid on;
xlabel('\omega_k=(2\pi/20)k','fontsize',15)
ylabel('H_1(e^{j\omega}) and H_2(e^{j\omega})','fontsize',15)
title('DTFS coefficients of x[n]','FontSize',18)
subplot(2,1,2),plot(w1,abs(H1),'r-');
hold on;
plot(w2,abs(H2),'b-');
legend('H_1','H_2');
grid on;
xlabel('\omega','fontsize',15)
ylabel('H_1(e^{j\omega}) and H_2(e^{j\omega})','fontsize',15)
title('frequency resposes of Systems','FontSize',18)

%%% d)

% invert fft
x_20 = length(a_x) * ifft(a_x);
figure(3)

% repeat for (100+20)/20 = 6 period
x = [x_20 x_20 x_20 x_20 x_20 x_20];
stem(-20:99,x);
xlabel('n','fontsize',15);
ylabel('x[n]','fontsize',15);
title('input signal','fontsize',18)
grid on;
%%% e)

% using filter
y1 = filter(b1,a1,x);
y2 = filter(b2,a2,x);

figure(4)

subplot(2,1,1),stem(-20:99,y1);
xlabel('n','fontsize',15);
ylabel('y_1[n]','fontsize',15);
title('output signal','fontsize',18)
grid on;

subplot(2,1,2),stem(-20:99,y2);
xlabel('n','fontsize',15);
ylabel('y_2[n]','fontsize',15);
title('output signal','fontsize',18)
grid on;

%%% f)

% take the value on n = 0:19
% y1(1) = y1[-20] ==> y1(21) = y1[0]
y1_20 = y1(21:40);
y2_20 = y2(21:40);

% using fft
a_y1 = fft(y1_20)/length(y1_20);
a_y2 = fft(y2_20)/length(y2_20);

figure(5)
subplot(2,1,1), stem(abs(a_y1));
grid on;
subplot(2,1,2), stem(abs(a_y2));
grid on;

