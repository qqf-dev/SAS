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
    d_20 = log(20/165.4 + 1) / 0.06;

    D = d_7000 - d_20;

    % depart total length uniformly
    d = D / N;

    for li = 1:N
        % lower frequency limit
        d1 = d_20 + (N - 1) * d;
        f1 = 165.4 * (10^(0.06 * d1) - 1);
        
        % higher frequency limit
        d2 = d1 + d;
        f2 = 165.4 * (10^(0.06 * d2) - 1);

        % generate band pass filter
        [b,a] = butter(4, [f1 f2] / (fs/2));

        % produce bandpass signal
        y = filter(b,a,s);
        
        %% get envelope
        y = abs(y);
        % using LPF to get envelope
        [bl,al] = butter(4,f_cut/(fs/2));
        env = filter(bl,al,y);
        
        % load sin-wave as fine-structure


        s_out = zeros(1, length(s)); % generate vector s_out as same length with s

    end
