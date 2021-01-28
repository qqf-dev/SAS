function [output] = stage(startP, endP, n)
    %%
    %
    %

    output = zeros(1, endP - startP +1);

    if n < startP
        output = ones(1, endP - startP + 1);
    elseif endP >= n% has pulse when n <= end point
        output = [zeros(1, n - startP), ones(1, endP - n + 1)];
    end

end
