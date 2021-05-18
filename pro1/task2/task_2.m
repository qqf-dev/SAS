clc;
clear;

[s,fs]=audioread('C_01_01.wav');
N=4;
s=s';
%算出200和700HZ下的耳蜗模拟距离
d_200=log10(200/165.4+1)/0.06;
d_7000=log10(7000/165.4+1)/0.06;
d=(d_7000-d_200)/N;
%求cut-off frequency为20HZ的情况
s_20=zeros(1,length(s));
%循环求解
for i=1:4
    f1=164.5*(10^(0.06*(d_200+d*(i-1)))-1);%小的频率
    f2=164.5*(10^(0.06*(d_200+d*i))-1);%大的频率
    f_middle = 165.4*(10^(0.06*(d_200+d*(i-1)+d*0.5))-1);%中间的频率
    [b,a]=butter(4,[f1 f2]/(fs/2));%求出第i个bandpass
    y=filter(b,a,s);
    [b1,a1]=butter(4,20/(fs/2));%求出低通滤波器
    y1=filter(b1,a1,abs(y));%用低通滤波器提取包络
    dt=1/fs:1/fs:length(s)/fs;
    sin_signal=sin(2*pi*dt*f_middle);%对应的第i个sin函数
    s_20=s_20+y1.*sin_signal;
end
s_20=s_20*(norm(s)/norm(s_20)); % normalization

%求cut-off frequency为50HZ的情况
s_50=zeros(1,length(s));
%循环求解
for i=1:4
    f1=164.5*(10^(0.06*(d_200+d*(i-1)))-1);%小的频率
    f2=164.5*(10^(0.06*(d_200+d*i))-1);%大的频率
    f_middle = 165.4*(10^(0.06*(d_200+d*(i-1)+d*0.5))-1);%中间的频率
    [b,a]=butter(4,[f1 f2]/(fs/2));%求出第i个bandpass
    y=filter(b,a,s);
    [b1,a1]=butter(4,50/(fs/2));%求出低通滤波器
    y1=filter(b1,a1,abs(y));%用低通滤波器提取包络
    dt=1/fs:1/fs:length(s)/fs;
    sin_signal=sin(2*pi*dt*f_middle);%对应的第i个sin函数
    s_50=s_50+y1.*sin_signal;
end
s_50=s_50*(norm(s)/norm(s_50)); % normalization

%求cut-off frequency为100HZ的情况
s_100=zeros(1,length(s));
%循环求解
for i=1:4
    f1=164.5*(10^(0.06*(d_200+d*(i-1)))-1);%小的频率
    f2=164.5*(10^(0.06*(d_200+d*i))-1);%大的频率
    f_middle = 165.4*(10^(0.06*(d_200+d*(i-1)+d*0.5))-1);%中间的频率
    [b,a]=butter(4,[f1 f2]/(fs/2));%求出第i个bandpass
    y=filter(b,a,s);
    [b1,a1]=butter(4,100/(fs/2));%求出低通滤波器
    y1=filter(b1,a1,abs(y));%用低通滤波器提取包络
    dt=1/fs:1/fs:length(s)/fs;
    sin_signal=sin(2*pi*dt*f_middle);%对应的第i个sin函数
    s_100=s_100+y1.*sin_signal;
end
s_100=s_100*(norm(s)/norm(s_100)); % normalization

%求cut-off frequency为400HZ的情况
s_400=zeros(1,length(s));
%循环求解
for i=1:4
    f1=164.5*(10^(0.06*(d_200+d*(i-1)))-1);%小的频率
    f2=164.5*(10^(0.06*(d_200+d*i))-1);%大的频率
    f_middle = 165.4*(10^(0.06*(d_200+d*(i-1)+d*0.5))-1);%中间的频率
    [b,a]=butter(4,[f1 f2]/(fs/2));%求出第i个bandpass
    y=filter(b,a,s);
    [b1,a1]=butter(4,400/(fs/2));%求出低通滤波器
    y1=filter(b1,a1,abs(y));%用低通滤波器提取包络
    dt=1/fs:1/fs:length(s)/fs;
    sin_signal=sin(2*pi*dt*f_middle);%对应的第i个sin函数
    s_400=s_400+y1.*sin_signal;
end
s_400=s_400*(norm(s)/norm(s_400)); % normalization

subplot(4,1,1),plot(s_20);
subplot(4,1,2),plot(s_50);
subplot(4,1,3),plot(s_100);
subplot(4,1,4),plot(s_400);

