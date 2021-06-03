function output = demodulator(s, wc)

    [b, a] = butter(4, wc / 10^9, 'low');

    Trc = s .* cos(2 * pi * wc * rt);
    Trs = s .* sin(2 * pi * wc * rt);
    
    outputC = filter(b, a, Trc);
    outputS = filter(b, a, Trs);

    output = outputC + outputS;
end
