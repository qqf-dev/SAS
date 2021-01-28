function [output] = delta(startP, endP, n)
    %% this function can output the unit pulse signal \delta(n)
    % @output is the result
    % @startP is the start point of the sequence
    % @endP is the end point
    % @n is the pulse point

    output = zeros(endP - startP + 1); % init a series size equal the input

    if startP <= n% has pulse when n >= start point

        if endP >= n% has pulse when n <= end point
            output(n + 1 - startP) = 1; % relative point n' is 1
        end

    end

end
