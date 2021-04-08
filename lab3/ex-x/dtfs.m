function DTFS = dtfs(x,n_init)
    N=length(x);
    DTFS=zeros(1,N);
    t=n_init:(n_init+N-1);
    w0=2*pi/N;
    for k=0:N-1
        DTFS(k+1)=sum(x.*exp(-1i*k*w0*t))/N;
    end
end