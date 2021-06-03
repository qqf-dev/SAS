function Hn = ChT(n, h, lcp,wc, ts, hs)
    %
    % description.
    %
    % ChT is a Channel tester for real channel frequency response for give length n
    % @param int n is the length of given signal
    % @param vector h is the real time filter of the real channel
    % @param int lcp is the length of cp
    % @param double wc is carrier frequency
    % @param double ts is sampling rate of, for T = ts ns
    % @param double hs is holding rate of, for T = hs ns
    % @return vector Hn is the frequency response of h for given length n;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % test signal is [1 ... 1] for length of n;
    TA = ones(1, n);

    % simulate the signal through the real channel

    TX = ifft(TA) .* length(TA);
    TX_cp = cpAdder(TX);
    TS = trans(TX_cp, wc);
    TH = conv(TS, h);
    TDS = demodulator(TH, wc);
    TSN = ADC(TDS, ts);

    N = hs/ts;
    TSNA = TSN(N*lcp+1:end-N*lcp);

    TSNB = downsample(TSNA, N);

    % Hn = TY ./ TA, for TA = [1 ... 1], so Hn = TY = DFT(TSNA)
    Hn = fft(TSNB) ./ length(TSNB);

end
