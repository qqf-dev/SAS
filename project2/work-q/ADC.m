function output = ADC(S, fs)

    q = mod(length(S), fs);

    S = [S zeros(1, fs - q)];

    S_ = reshape(S, fs, []);

    output = sum(S_);

    output = output / fs;

end
