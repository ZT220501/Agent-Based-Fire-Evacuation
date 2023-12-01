function result = pw(x, y)
    % region: 0 <= x <= 50, 0 <= y <= 50
    region1 = (y >= 0 & y < 10);
    region2 = (y >= 10 & y < 15);
    region3 = (y >= 15 & y < 25);
    region4 = (y >= 25 & y < 35);
    region5 = (y >= 35 & y < 40);
    region6 = (y >= 40 & y <= 50);

    slope = 5; % slope towards street, on the plane that has houses
    max_plane_height = slope*10; % hightest difference on the plane
    max_road_height = 80; % highest point on a road
    k = max_road_height / 50;
    wall_height = 80; % wall height

    value1 = max_road_height - k*x(region1) +max_plane_height -slope * y(region1);
    value2 = max_road_height - k*x(region2);
    value3 = max_road_height - k*x(region3) +max_plane_height -slope * (25 - y(region3));
    value4 = max_road_height - k*x(region4) +max_plane_height -slope * (y(region4) - 25);
    value5 = max_road_height - k*x(region5);
    value6 = max_road_height - k*x(region6) +max_plane_height -slope * (50 - y(region6));
    v1 = max_road_height - k*x +max_plane_height -slope * y;
    v3 = max_road_height - k*x +max_plane_height -slope * (25 - y);
    v4 = max_road_height - k*x +max_plane_height -slope * (y - 25);
    v6 = max_road_height - k*x +max_plane_height -slope * (50 - y);

    result = zeros(size(x));
    result(region1) = value1;
    result(region2) = value2;
    result(region3) = value3;
    result(region4) = value4;
    result(region5) = value5;
    result(region6) = value6;

    repulsion_length = 1.5; % max = 2, the side of a house
    l_inf_min_o = 2; % region of repulsion outside wall
    l_inf_max_o = l_inf_min_o + repulsion_length; 
    l_inf_max_i = l_inf_min_o;
    l_inf_min_i = l_inf_max_i - repulsion_length; % region of repulsion inside wall 
    wall_slope = wall_height / (l_inf_max_o - l_inf_min_o);

    for i = [10 25 40]
        center = [i, 5];
        l_inf = max(abs(x - center(1)), abs(y - center(2)));
        sr_o = l_inf > l_inf_min_o & l_inf < l_inf_max_o;
        sr_o((y > l_inf_min_o + center(2)) & (y < l_inf_max_o + center(2))) = false;
        sr_i = l_inf > l_inf_min_i & l_inf < l_inf_max_i;
        sr_i((y > l_inf_min_i + center(2)) & (y < l_inf_max_i + center(2))) = false;
        v_o = v1 + wall_height - wall_slope*(l_inf-l_inf_min_o);
        result(sr_o) = v_o(sr_o);
        v_i = v1 + wall_slope*(l_inf-l_inf_min_i);
        result(sr_i) = v_i(sr_i);
    end

    for i = [10 25 40]
        center = [i, 20];
        l_inf = max(abs(x - center(1)), abs(y - center(2)));
        sr_o = l_inf > l_inf_min_o & l_inf < l_inf_max_o;
        sr_o((y < - l_inf_min_o + center(2)) & (y > - l_inf_max_o + center(2))) = false;
        sr_i = l_inf > l_inf_min_i & l_inf < l_inf_max_i;
        sr_i((y < - l_inf_min_i + center(2)) & (y > - l_inf_max_i + center(2))) = false;
        v_o = v3 + wall_height - wall_slope*(l_inf-l_inf_min_o);
        result(sr_o) = v_o(sr_o);
        v_i = v3 + wall_slope*(l_inf-l_inf_min_i);
        result(sr_i) = v_i(sr_i);
    end

    for i = [10 25 40]
        center = [i, 30];
        l_inf = max(abs(x - center(1)), abs(y - center(2)));
        sr_o = l_inf > l_inf_min_o & l_inf < l_inf_max_o;
        sr_o((y > l_inf_min_o + center(2)) & (y < l_inf_max_o + center(2))) = false;
        sr_i = l_inf > l_inf_min_i & l_inf < l_inf_max_i;
        sr_i((y > l_inf_min_i + center(2)) & (y < l_inf_max_i + center(2))) = false;
        v_o = v4 + wall_height - wall_slope*(l_inf-l_inf_min_o);
        result(sr_o) = v_o(sr_o);
        v_i = v4 + wall_slope*(l_inf-l_inf_min_i);
        result(sr_i) = v_i(sr_i);
    end

    for i = [10 25 40]
        center = [i, 45];
        l_inf = max(abs(x - center(1)), abs(y - center(2)));
        sr_o = l_inf > l_inf_min_o & l_inf < l_inf_max_o;
        sr_o((y < - l_inf_min_o + center(2)) & (y > - l_inf_max_o + center(2))) = false;
        sr_i = l_inf > l_inf_min_i & l_inf < l_inf_max_i;
        sr_i((y < - l_inf_min_i + center(2)) & (y > - l_inf_max_i + center(2))) = false;
        v_o = v6 + wall_height - wall_slope*(l_inf-l_inf_min_o);
        result(sr_o) = v_o(sr_o);
        v_i = v6 + wall_slope*(l_inf-l_inf_min_i);
        result(sr_i) = v_i(sr_i);
    end
    
end