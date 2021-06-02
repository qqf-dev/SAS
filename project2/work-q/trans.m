function [t, transimission] = trans(S,wc)

    [t, xp] = DAC(S);

    [t, xc] = holder(S);

    s = sin(2*pi*wc*t);
    c = cos(2*pi*wc*t);

    transimission = c .* real(xc) + s .* imag(xc);
end
