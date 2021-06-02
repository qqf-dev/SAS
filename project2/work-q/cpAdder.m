function [A, N] = cpAdder(S)

    n = length(S);
    d = mod(n, 32);

    if d ~= 0
        S = [S zeros(1, 32 - d)];
    end

    N = length(S) / 32;

    A = zeros(N, 32 + 4);

    S = reshape(S,32,[]);
    S = S';

    for li = 1:N
        cp = S(li, end - 3:end);
        A(li, :) = [cp S(li, :)];
    end

    A = reshape(A',1,[]);

end
