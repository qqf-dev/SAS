function [t,output] = DAC(S)


    % dt is 1ns
    dt = 1*10.^(-9);

    % for S with cp is 36 us, each pulse with space of 1000ns

    dO = 1000;

    T = length(S)*dO;

    output = zeros(1,T);

    for li = 1:length(S)
        output(1+(li-1)*dO) = S(li);
    end

    t = 0:dt:length(S)*10.^(-6)-dt;

end
