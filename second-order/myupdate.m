function res = myupdate(y)

    N = size(y, 1)/4;
    yp = reshape(y, N, 2, 2);

    x = yp(:,:,1);
    v = yp(:,:,2);
    
    x_update = v;
    v_update = Cucker_Smale_homo(x,v);
    res = zeros(N, 2, 2);
    res(:,:,1) = x_update;
    res(:,:,2) = v_update;

    res = reshape(res, 4*N, 1);

end