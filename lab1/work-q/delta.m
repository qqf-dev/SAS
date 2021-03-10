function [output] = delta(startP, endP, k)
    %% this function can output the unit pulse signal \delta[n-k]
    % @output is the result
    % @startP is the start point of the sequence
    % @endP is the end point
    % @k is the pulse point

    output = zeros(1, endP - startP + 1); % init a series size equal the input
    
    n = ceil(n);
    if startP <= n% has pulse when n >= start point

        if endP >= n% has pulse when n <= end point
            output(n + 1 - startP) = 1; % relative point n' is 1
        end

    end

end
