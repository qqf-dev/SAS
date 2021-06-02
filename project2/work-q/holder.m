function [t,output] = holder(S)


    % dt is 1ns
    dt = 1*10.^(-9);
    
    dO = 1000;

    N = repmat(S,dO,1);

    output = reshape(N,1,[]);

    t = 0:dt:length(S)*10.^(-6)-dt;
end
