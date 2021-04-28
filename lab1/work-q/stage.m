function [output] = stage(startP, endP, k)
    %%
    %
    %

    n = ceil(k);

    output = zeros(1, endP - startP +1);

    if n < startP
        output = ones(1, endP - startP + 1);
    elseif endP >= n
        output = [zeros(1, n - startP), ones(1, endP - n + 1)];
    end

end
