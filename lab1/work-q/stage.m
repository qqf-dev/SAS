function [output] = stage(startP, endP, k)
    %%
    %
    %

    k = ceil(k);

    output = zeros(1, endP - startP +1);

    if k < startP
        output = ones(1, endP - startP + 1);
    elseif endP >= k
        output = [zeros(1, n - startP), ones(1, endP - n + 1)];
    end

end
