clear;
clc;
close all;

[s, fs] = audioread('C_01_01.wav');
s = s';
N = 120;
f_cut = 50;

figure(1);
s1 = toneVocoder(s,N,fs,f_cut);
% figure(2);
% s2 = melVocoder(s,N,fs,f_cut);



function s_out = toneVocoder(s, N, fs, f_cut)
    %toneVocoder - Description
    %
    % Syntax: s_out = toneVocoder(s,N,fs,f_cut)
    % s is the original signal
    % N is the number of bands of frequency
    % fs is the sampling frequency of input signal
    % s_out is the signal after rebuild
    %
    % Long description

    % according to the function of frequency sensitivities distribution of cochlea
    % f = 165.4 * (10^(0.06d) - 1), d = log(f/165.4+1) / 0.06
    % so between the speech frequency: 20 ~ 7000 Hz the total length is d_7000 - d_20

    d_7000 = log10(7000/165.4 + 1) / 0.06;
    d_20 = log10(600/165.4 + 1) / 0.06;

    D = d_7000 - d_20;

    % depart total length uniformly
    d = D / N;

    s_out = zeros(1, length(s)); % generate vector s_out as same length with s

    for li = 1:N
        % lower frequency limit
        d1 = d_20 + (li - 1) * d;
        f1 = 165.4 * (10^(0.06 * d1) - 1);

        % higher frequency limit
        d2 = d1 + d;
        f2 = 165.4 * (10^(0.06 * d2) - 1);

        % generate band pass filter
        [b, a] = butter(4, [f1 f2] / (fs / 2));

        %%% draw the frequency response of filters
        [H,w] = freqz(b,a,512);
        plot(w,abs(H)),hold on; 


        % produce bandpass signal
        y = filter(b, a, s);

        %% get envelope
        y = abs(y);
        % using LPF to get envelope
        [bl, al] = butter(4, f_cut / (fs / 2));
        env = filter(bl, al, y);

        % load sin-wave as fine-structure
        dt = 1 / fs;
        t = dt:dt:length(s) * dt;

        % frequency is the frequency at (d1 + d2)/2
        fm = 165.4 * (10^(0.06 * (d1 + d2) / 2) - 1);
        fineS = sin(2 * pi * fm * t);        

        % add to s_out
        s_out = s_out + fineS .* env;

    end

    % normalize
    s_out = s_out * norm(s)/norm(s_out);

end

function s_out = melVocoder(s, N, fs, f_cut)
    %toneVocoder - Description
    %
    % Syntax: s_out = toneVocoder(s,N,fs,f_cut)
    % s is the original signal
    % N is the number of bands of frequency
    % fs is the sampling frequency of input signal
    % s_out is the signal after rebuild
    %
    % Long description

    % using mel filter bank (triangular bandpass filters)
    % mel(f) = 2595 * log(1+f/700)
    % so between the speech frequency: 20 ~ 7000 Hz the total mel frequency distance is mel_7000 - mel_20

    mel_7000 = 2595 * log10(1 + 7000/700);
    mel_20 = 2595 * log10(1 + 20/700);

    melF = linspace(20, mel_7000 - mel_20,N+2);

    F = 700 .* (10.^(melF./2595)-1);

    figure(1);

    s_out = zeros(1, length(s)); % generate vector s_out as same length with s

    for li = 1:N
        fl = F(li);
        fm = F(li+1); 
        fr = F(li+2);
        %% get triangular filter between [fl fr], the peek point of triangle is fm
        [b,a] = TriFilter(3000, [fl fm fr]/(fs/2));

        %% draw the frequency response of filters
        [H,w] = freqz(b,a,512);
        plot(w,abs(H)),hold on; 

        y = filter(b, a, s);

        %% get abstract value
        y = abs(y);
        % using LPF to get envelope
        [bl, al] = butter(4, f_cut / (fs / 2));
        env = filter(bl, al, y);

        % load sin-wave as fine-structure
        dt = 1 / fs;
        t = dt:dt:length(s) * dt;

        fineS = sin(2 * pi * fm * t);

        % add to s_out
        s_out = s_out + fineS .* env;

    end

    % normalize
    s_out = s_out * norm(s) / norm(s_out);

end

% build the triangular bandpass filter 
function [b, a] = TriFilter(N,F)

    %% the frequency response of TriFilter is close to triangular

    A = [0 0 1 0 0];
    F = [0 F 1];

    [b, a] = fir2(N, F, A, bartlett(N + 1));
end
