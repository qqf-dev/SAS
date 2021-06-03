function [output,t] = holder(S,dO)


    % dt is 1ns
    dt = 1*10.^(-9);
    
    N = repmat(S,dO,1);

    output = reshape(N,1,[]);

    t = 0:dt:length(S)*(dO*dt)-dt;
end
