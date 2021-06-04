function output = ADC(S, ts)
    q = mod(length(S), ts);

    S = [S zeros(1, ts - q)];

    S_ = reshape(S, ts, []);

    output = sum(S_);

    output = output / ts;

end
