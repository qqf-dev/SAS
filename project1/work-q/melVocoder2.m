function s_out = melVocoder2(s, N, fs, f_cut)
    %toneVocoder - Description
    %
    % Syntax: s_out = toneVocoder(s,N,fs,f_cut)
    % s is the original signal
    % N is the number of bands of frequency
    % fs is the sampling frequency of input signal
    % s_out is the signal after rebuild
    %
    % Long description

    % using mel filter
    % mel(f) = 2595 * log(1+f/700)
    % so between the speech frequency: 20 ~ 8000 Hz the total length is mel_7800 - mel_20

    mel_7800 = 2595 * log10(1 + 7800/700);
    mel_20 = 2595 * log10(1 + 20/700);

    melF = linspace(mel_20, mel_7800-mel_20,N+2);

    F = 700 .* (10.^(melF./2595)-1);

    s_out = zeros(1, length(s)); % generate vector s_out as same length with s

    for li = 1:N
        fl = F(li);
        fm = F(li+1);
        fr = F(li+2);
        [b,a] = TriFilter(3000, [fl fm fr]/(fs/2));

        % [H w] = freqz(b,a,512);
        % plot(w,abs(H)), hold on;

        y = filter(b, a, s);

        %% get envelope
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

    A = [0 0 0 1 0 0 0];

    k1 = F(1)/2;
    k2 = (1+ F(end))/2;

    F = [0 k1 F k2 1];

    [b, a] = fir2(N, F, A, bartlett(N + 1));
end
