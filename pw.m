function result = pw(x, y)
    
    wh = 50; % wall height
    slope = 5; % slope towards street

    region1 = (y >= 0 & y < 10);
    region2 = (y >= 10 & y < 15);
    region3 = (y >= 15 & y < 25);
    region4 = (y >= 25 & y < 35);
    region5 = (y >= 35 & y < 40);
    region6 = (y >= 40 & y <= 50);

    value1 = 50 - x(region1) +5 -slope * y(region1);
    value2 = 50 - x(region2) - (slope - 0.5)*10;
    value3 = 50 - x(region3) +5 -slope * (25 - y(region3));
    value4 = 50 - x(region4) +5 -slope * (y(region4) - 25);
    value5 = 50 - x(region5) - (slope - 0.5)*10;
    value6 = 50 - x(region6) +5 -slope * (50 - y(region6));
   

    result = zeros(size(x));
    result(region1) = value1;
    result(region2) = value2;
    result(region3) = value3;
    result(region4) = value4;
    result(region5) = value5;
    result(region6) = value6;

    % center = [10, 5];
    for i = [10 25 40]
        center = [i, 5];
        L_inf_norm = max(abs(x - center(1)), abs(y - center(2)));
        L_inf_norm_min = 2;
        L_inf_norm_max = 3.5;
        sr1 = L_inf_norm > L_inf_norm_min & L_inf_norm < L_inf_norm_max;
        sr1((y > L_inf_norm_min + center(2)) & (y < L_inf_norm_max + center(2))) = false;
        v1 = 50 - x +5 -slope * y+70-20*L_inf_norm;
        result(sr1) = v1(sr1);
    end

    for i = [10 25 40]
        center = [i, 20];
        L_inf_norm = max(abs(x - center(1)), abs(y - center(2)));
        L_inf_norm_min = 2;
        L_inf_norm_max = 3.5;
        sr1 = L_inf_norm > L_inf_norm_min & L_inf_norm < L_inf_norm_max;
        sr1((y < - L_inf_norm_min + center(2)) & (y > - L_inf_norm_max + center(2))) = false;
        v1 = 50 - x +5 -slope * (25 - y)+70-20*L_inf_norm;
        result(sr1) = v1(sr1);
    end

    for i = [10 25 40]
        center = [i, 30];
        L_inf_norm = max(abs(x - center(1)), abs(y - center(2)));
        L_inf_norm_min = 2;
        L_inf_norm_max = 3.5;
        sr1 = L_inf_norm > L_inf_norm_min & L_inf_norm < L_inf_norm_max;
        sr1((y > L_inf_norm_min + center(2)) & (y < L_inf_norm_max + center(2))) = false;
        v1 = 50 - x +5 -slope * (y - 25)+70-20*L_inf_norm;
        result(sr1) = v1(sr1);
    end

    for i = [10 25 40]
        center = [i, 45];
        L_inf_norm = max(abs(x - center(1)), abs(y - center(2)));
        L_inf_norm_min = 2;
        L_inf_norm_max = 3.5;
        sr1 = L_inf_norm > L_inf_norm_min & L_inf_norm < L_inf_norm_max;
        sr1((y < center(2)- L_inf_norm_min) & (y > - L_inf_norm_max + center(2))) = false;
        v1 = 50 - x +5 -slope * (50 - y)+70-20*L_inf_norm;
        result(sr1) = v1(sr1);
    end
    
end