function [output, int] = ADC2(S, ts)

    dt = 10^(-9);

    % intergral
    ys = [zeros(1, ts - 1), S];

    yg = ys;

    for li = 1:(length(ys) - ts + 1)
        yg(li) = sum(ys(li:li + ts - 1)) * dt;
    end

    yg = yg(1:length(ys) - ts +1);

    int = yg;

    % sampling

    % add zero in end

    q = mod(length(yg), ts);

    yg = [yg zeros(1, ts - q)];

    % for x[n] = x(nT), T = ts
    N = length(yg) / ts;

    output = zeros(1,N);

    for li = 1:N
        output(li) = yg(li*ts);
    end

    % Amplification

    A = 1 / (ts * dt);
    output = output .* A;
end
