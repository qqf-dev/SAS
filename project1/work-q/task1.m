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

% the cutoff frequency
fc = 50;

y1 = toneVocoder(s,1,fs,fc);
y2 = toneVocoder(s,2,fs,fc);
y3 = toneVocoder(s,4,fs,fc);
y4 = toneVocoder(s,6,fs,fc);
y5 = toneVocoder(s,8,fs,fc);

audiowrite('ToneVoice_N1_Fc50.wav',y1,fs);
audiowrite('ToneVoice_N2_Fc50.wav',y2,fs);
audiowrite('ToneVoice_N4_Fc50.wav',y3,fs);
audiowrite('ToneVoice_N6_Fc50.wav',y4,fs);
audiowrite('ToneVoice_N8_Fc50.wav',y5,fs);

% using melVocoder2

ym1 = melVocoder(s,1,fs,fc);
ym2 = melVocoder(s,2,fs,fc);
ym3 = melVocoder(s,4,fs,fc);
ym4 = melVocoder(s,6,fs,fc);
ym5 = melVocoder(s,8,fs,fc);

% audiowrite('MelVoice_N1_Fc50.wav',ym1,fs);
% audiowrite('MelVoice_N2_Fc50.wav',ym2,fs);
% audiowrite('MelVoice_N4_Fc50.wav',ym3,fs);
% audiowrite('MelVoice_N6_Fc50.wav',ym4,fs);
% audiowrite('MelVoice_N8_Fc50.wav',ym5,fs);

y = toneVocoder(s,32,fs,50);
ym = melVocoder(s,32,fs,50);
ym2 = melVocoder2(s,32,fs,50);


% sound(s,fs);



