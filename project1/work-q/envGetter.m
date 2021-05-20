function y = envGetter(s,f_cut,fs)
    
    [b,a] = butter(4, f_cut/(fs/2));

    y = filter(b,a,abs(s));
end
