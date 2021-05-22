function [Y, w] = ctft(y, fs)
    lN = length(y);
    tau = 2 * pi / fs;
    lb = (1 - lN) * pi / lN / tau;
    ub = (lN - 1) * pi / lN / tau;
    step = 2 * pi / lN / tau;
    w = lb:step:ub;
    Y = fftshift(fft(y));
end
