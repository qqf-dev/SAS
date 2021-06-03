function [transimission,t] = trans(S,wc)

    [xc,t] = holder(S,1000);

    s = sin(2*pi*wc*t);
    c = cos(2*pi*wc*t);

    transimission = c .* real(xc) + s .* imag(xc);
end
