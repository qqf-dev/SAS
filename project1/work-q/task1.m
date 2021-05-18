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

% set low pass filter (50Hz) l1 : a1, b1

s = s';

[b1, a1] = butter(2, 50/(fs/2));

y = filter(b1,a1,s);

