function y = diffeqn(a, x, yn1)

    N = length(x);
    y = zeros(1, N);
    y(1) = a * yn1 + x(1);
    t = y(1);
    for li = 2:N;
        t = a * t + x(li);
        y(li) = t;
    end

end
