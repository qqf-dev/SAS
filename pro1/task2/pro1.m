function [s_out] = pro1(s,N,fs,f_cut)
%s是原来的声音信号 N是bands fs是信号频率 f_cut是cut-off frequency
%函数是用来直接求语音合成的

%算出200和700HZ下的耳蜗模拟距离
d_200=log10(200/165.4+1)/0.06;
d_7000=log10(7000/165.4+1)/0.06;
d=(d_7000-d_200)/N;
%求cut-off frequency为20HZ的情况
s_out=zeros(1,length(s));
%循环求解
for i=1:N
    f1=164.5*(10^(0.06*(d_200+d*(i-1)))-1);%小的频率
    f2=164.5*(10^(0.06*(d_200+d*i))-1);%大的频率
    f_middle = 165.4*(10^(0.06*(d_200+d*(i-1)+d*0.5))-1);%中间的频率
    [b,a]=butter(4,[f1 f2]/(fs/2));%求出第i个bandpass
    y=filter(b,a,s);
    [b1,a1]=butter(4,f_cut/(fs/2));%求出低通滤波器
    y1=filter(b1,a1,abs(y));%用低通滤波器提取包络
    dt=1/fs:1/fs:length(s)/fs;
    sin_signal=sin(2*pi*dt*f_middle);%对应的第i个sin函数
    s_out=s_out+y1.*sin_signal;
end
s_out=s_out*(norm(s)/norm(s_out)); % normalization