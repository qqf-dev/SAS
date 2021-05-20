%{

TODO:list
item:Set LPF cutoff frequency to 50 Hz
item:Implement tone-vocoder by changing the number of bands to N=1, N=2, N=4, N=6, and N=8.
item:Save the wave files for these conditions, and describe how the number of bands affects the intelligibility (i.e., how many words can be understood) of synthesized sentence.
%}

clear;
clc;
close all;

% load audio file 01
[s,fs] = audioread('C_01_01.wav');

s = s';

y1 = toneVocoder(s,1,fs,50);
y2 = toneVocoder(s,2,fs,50);
y3 = toneVocoder(s,4,fs,50);
y4 = toneVocoder(s,6,fs,50);
y5 = toneVocoder(s,8,fs,50);

y = toneVocoder(s,8,fs,600);

sound(y,fs)
pause(5)

% ym = melVocoder(s,20,fs,600);
% sound(ym,fs)

pause(5);

ym2 = melVocoder2(s,16,fs,400);
sound(ym2,fs)

pause(5)
sound(s,fs);



