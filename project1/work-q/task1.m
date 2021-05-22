%{

TODO:list
item:Set LPF cutoff frequency to 50 Hz
item:Implement tone - vocoder by changing the number of bands to N = 1, N = 2, N = 4, N = 6, and N = 8.
item:Save the wave files for these conditions, and describe how the number of bands affects the intelligibility (i.e., how many words can be understood) of synthesized sentence.
%}

clear;
clc;
close all;

% load audio file 01
[s, fs] = audioread('C_01_01.wav');

s = s';

% the cutoff frequency
fc = 50;

y1 = toneVocoder(s, 1, fs, fc);
y2 = toneVocoder(s, 2, fs, fc);
y3 = toneVocoder(s, 4, fs, fc);
y4 = toneVocoder(s, 6, fs, fc);
y5 = toneVocoder(s, 8, fs, fc);

audiowrite('ToneVoice_N1_Fc50.wav', y1, fs);
audiowrite('ToneVoice_N2_Fc50.wav', y2, fs);
audiowrite('ToneVoice_N4_Fc50.wav', y3, fs);
audiowrite('ToneVoice_N6_Fc50.wav', y4, fs);
audiowrite('ToneVoice_N8_Fc50.wav', y5, fs);

% using melVocoder2

ym1 = melVocoder2(s, 1, fs, fc);
ym2 = melVocoder2(s, 2, fs, fc);
ym3 = melVocoder2(s, 4, fs, fc);
ym4 = melVocoder2(s, 6, fs, fc);
ym5 = melVocoder2(s, 8, fs, fc);

% audiowrite('MelVoice_N1_Fc50.wav',ym1,fs);
% audiowrite('MelVoice_N2_Fc50.wav',ym2,fs);
% audiowrite('MelVoice_N4_Fc50.wav',ym3,fs);
% audiowrite('MelVoice_N6_Fc50.wav',ym4,fs);
% audiowrite('MelVoice_N8_Fc50.wav',ym5,fs);

y = toneVocoder(s, 128, fs, fc);
ym = melVocoder2(s, 128, fs, fc);

[S,w] = ctft(s,fs);

figure(1)
subplot(311),plot(w,abs(S))

[Y1,w1] = ctft(y1,fs);
subplot(312),plot(w1, abs(Y1))

[Ym1,wm1] = ctft(ym1,fs);
subplot(313),plot(wm1, abs(Ym1))

figure(2)
subplot(311),plot(w,abs(S))

[Y2,w2] = ctft(y2,fs);
subplot(312),plot(w2, abs(Y2))

[Ym2,wm2] = ctft(ym2,fs);
subplot(313),plot(wm2, abs(Ym2))

figure(3)
subplot(311),plot(w,abs(S))

[Y3,w3] = ctft(y3,fs);
subplot(312),plot(w3, abs(Y3))

[Ym3,wm3] = ctft(ym3,fs);
subplot(313),plot(wm3, abs(Ym3))

figure(4)
subplot(311),plot(w,abs(S))

[Y4,w4] = ctft(y4,fs);
subplot(312),plot(w4, abs(Y4))

[Ym4,wm4] = ctft(ym4,fs);
subplot(313),plot(wm4, abs(Ym4))

figure(5)
subplot(311),plot(w,abs(S))

[Y5,w5] = ctft(y5,fs);
subplot(312),plot(w5, abs(Y5))

[Ym5,wm5] = ctft(ym5,fs);
subplot(313),plot(wm5, abs(Ym5))

figure(6)

subplot(311),plot(w,abs(S))

[Y,wy] = ctft(y,fs);
subplot(312),plot(wy, abs(Y))

[Ym,wm] = ctft(ym,fs);
subplot(313),plot(wm, abs(Ym))

% [Pxx0,w0]=pwelch(s,[],[],512,fs); 
% [Pxx1,w1]=pwelch(y1,[],[],512,fs); 
% [Pxx2,w2]=pwelch(y2,[],[],512,fs);
% [Pxx3,w3]=pwelch(y3,[],[],512,fs);
% [Pxx4,w4]=pwelch(y4,[],[],512,fs);
% [Pxx5,w5]=pwelch(y5,[],[],512,fs); 
% [Pxxy,wy]=pwelch(y,[],[],512,fs); 

% [Pxxm1,wm1]=pwelch(ym1,[],[],512,fs); 
% [Pxxm2,wm2]=pwelch(ym2,[],[],512,fs);
% [Pxxm3,wm3]=pwelch(ym3,[],[],512,fs);
% [Pxxm4,wm4]=pwelch(ym4,[],[],512,fs);
% [Pxxm5,wm5]=pwelch(ym5,[],[],512,fs); 
% [Pxxm,wm]=pwelch(ym,[],[],512,fs); 

% figure(7)
% subplot(311),plot(w0,10*log10(Pxx0)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('original');
% hold on;
% subplot(311),plot(w1,10*log10(Pxx1)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=1');
% subplot(311),plot(wm1,10*log10(Pxxm1)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=1');

% subplot(312),plot(w0,10*log10(Pxx0)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('original');
% hold on;
% subplot(312),plot(w2,10*log10(Pxx2)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=2');
% subplot(312),plot(wm2,10*log10(Pxxm2)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=3');

% subplot(313),plot(w0,10*log10(Pxx0)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('original');
% hold on;
% subplot(313),plot(w3,10*log10(Pxx3)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=4');
% subplot(313),plot(wm3,10*log10(Pxxm3)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=4');

% figure(8)

% subplot(311),plot(w0,10*log10(Pxx0)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('original');
% hold on;
% subplot(311),plot(w4,10*log10(Pxx4)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=6');
% subplot(311),plot(wm4,10*log10(Pxxm4)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=6');

% subplot(312),plot(w0,10*log10(Pxx0)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('original');
% hold on;
% subplot(312),plot(w5,10*log10(Pxx5)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=8');
% subplot(312),plot(wm5,10*log10(Pxxm5)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=18');

% subplot(313),plot(w0,10*log10(Pxx0)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('original');
% hold on;
% subplot(313),plot(wy,10*log10(Pxxy)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=128');
% subplot(313),plot(wm,10*log10(Pxxm)),grid on,xlabel('frequency/Hz'),ylabel('pwelch/dB');title('N=128');




ymn1 = melVocoder(s, 1, fs, fc);
ymn2 = melVocoder(s, 2, fs, fc);
ymn3 = melVocoder(s, 4, fs, fc);
ymn4 = melVocoder(s, 6, fs, fc);
ymn5 = melVocoder(s, 8, fs, fc);

% sound(s,fs);




