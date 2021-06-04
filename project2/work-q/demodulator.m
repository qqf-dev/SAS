function [outputC,outputS] = demodulator(s, wc)

    dt = 10^(-9);
    rt = linspace(0, (length(s) - 1) * dt, length(s));

    [b, a] = butter(4, wc / 10^9, 'low');

    Trc = 2 * s .* cos(2 * pi * wc * rt);
    Trs = 2 * s .* sin(2 * pi * wc * rt);

    outputC = filter(b, a, Trc);
    outputS = filter(b, a, Trs); 
end
