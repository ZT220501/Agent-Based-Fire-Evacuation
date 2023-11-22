function result = piecewiseFunction(x, y)
    
    wh = 50; % wall height
    slope = 5; % slope towards street

    region1 = (y >= 0 & y < 10);
    region2 = (y >= 10 & y < 15);
    region3 = (y >= 15 & y < 25);
    region4 = (y >= 25 & y < 35);
    region5 = (y >= 35 & y < 40);
    region6 = (y >= 40 & y <= 50);
    sr1 = (x > 8 & x < 12 & y > 3 & y < 7);
    sr2 = ((x >= 8 & x <= 12 & y>=2.75 & y <= 3) | (x >= 8 & x<=8.25 & y >= 3 & y <= 7) | (x >=11.75 & x <= 12 & y >= 3 & y <= 7));
    sr3 = (x > 18 & x < 22 & y > 3 & y < 7);
    sr4 = ((x >= 18 & x <= 22 & y>=2.75 & y <= 3) | (x >= 18 & x<=18.25 & y >= 3 & y <= 7) | (x >=21.75 & x <= 22 & y >= 3 & y <= 7));
    sr5 = (x > 28 & x < 32 & y > 3 & y < 7);
    sr6 = ((x >= 28 & x <= 32 & y>=2.75 & y <= 3) | (x >= 28 & x<=28.25 & y >= 3 & y <= 7) | (x >=31.75 & x <= 32 & y >= 3 & y <= 7));
    sr7 = (x > 38 & x < 42 & y > 3 & y < 7);
    sr8 = ((x >= 38 & x <= 42 & y>=2.75 & y <= 3) | (x >= 38 & x<=38.25 & y >= 3 & y <= 7) | (x >=41.75 & x <= 42 & y >= 3 & y <= 7));
    sr9 = (x > 8 & x < 12 & y > 18 & y < 22);
    sr10 = ((x >= 8 & x <= 12 & y>=21.75 & y <=22 ) | (x >= 8 & x<=8.25 & y >= 18 & y <= 22) | (x >=11.75 & x <= 12 & y >= 18 & y <= 22));
    sr11 = (x > 18 & x < 22 & y > 18 & y < 22);
    sr12 = ((x >= 18 & x <= 22 & y>=21.75 & y <=22) | (x >= 18 & x<=18.25 & y >= 18 & y <= 22) | (x >=21.75 & x <= 22 & y >= 18 & y <= 22));
    sr13 = (x > 28 & x < 32 & y > 18 & y < 22);
    sr14 = ((x >= 28 & x <= 32 & y>=21.75 & y <=22) | (x >= 28 & x<=28.25 & y >= 18 & y <= 22) | (x >=31.75 & x <= 32 & y >= 18 & y <= 22));
    sr15 = (x > 38 & x < 42 & y > 18 & y < 22);
    sr16 = ((x >= 38 & x <= 42 & y>=21.75 & y <=22) | (x >= 38 & x<=38.25 & y >= 18 & y <= 22) | (x >=41.75 & x <= 42 & y >= 18 & y <= 22));
    sr17 = (x > 8 & x < 12 & y > 28 & y < 32);
    sr18 = ((x >= 8 & x <= 12 & y>=27.75 & y<=28) | (x >= 8 & x<=8.25 & y >= 28 & y <= 32) | (x >=11.75 & x <= 12 & y >= 28 & y <= 32));
    sr19 = (x > 18 & x < 22 & y > 28 & y < 32);
    sr20 = ((x >= 18 & x <= 22 & y>=27.75 & y<=28) | (x >= 18 & x<=18.25 & y >= 28 & y <= 32) | (x >=21.75 & x <= 22 & y >= 28 & y <= 32));
    sr21 = (x > 28 & x < 32 & y > 28 & y < 32);
    sr22 = ((x >= 28 & x <= 32 & y>=27.75 & y<=28) | (x >= 28 & x<=28.25 & y >= 28 & y <= 32) | (x >=31.75 & x <= 32 & y >= 28 & y <= 32));
    sr23 = (x > 38 & x < 42 & y > 28 & y < 32);
    sr24 = ((x >= 38 & x <= 42 & y>=27.75 & y<=28) | (x >= 38 & x<=38.25 & y >= 28 & y <= 32) | (x >=41.75 & x <= 42 & y >= 28 & y <= 32));
    sr25 = (x > 8 & x < 12 & y > 43 & y < 47);
    sr26 = ((x >= 8 & x <= 12 & y>=46.75 & y<=47 ) | (x >= 8 & x<=8.25 & y >= 43 & y <= 47) | (x >=11.75 & x <= 12 & y >= 43 & y <= 47));
    sr27 = (x > 18 & x < 22 & y > 43 & y < 47);
    sr28 = ((x >= 18 & x <= 22 & y>=46.75 & y<=47) | (x >= 18 & x<=18.25 & y >= 43 & y <= 47) | (x >=21.75 & x <= 22 & y >= 43 & y <= 47));
    sr29 = (x > 28 & x < 32 & y > 43 & y < 47);
    sr30 = ((x >= 28 & x <= 32 & y>=46.75 & y<=47) | (x >= 28 & x<=28.25 & y >= 43 & y <= 47) | (x >=31.75 & x <= 32 & y >= 43 & y <= 47));
    sr31 = (x > 38 & x < 42 & y > 43 & y < 47);
    sr32 = ((x >= 38 & x <= 42 & y>=46.75 & y<=47) | (x >= 38 & x<=38.25 & y >= 43 & y <= 47) | (x >=41.75 & x <= 42 & y >= 43 & y <= 47));


    

    value1 = 50 - x(region1) +5 -slope * y(region1);
    value2 = 50 - x(region2) - (slope - 0.5)*10;
    value3 = 50 - x(region3) +5 -slope * (25 - y(region3));
    value4 = 50 - x(region4) +5 -slope * (y(region4) - 25);
    value5 = 50 - x(region5) - (slope - 0.5)*10;
    value6 = 50 - x(region6) +5 -slope * (50 - y(region6));
    v1 = 50 - x(sr1) +5 -slope * y(sr1) + slope*(7 - y(sr1)); 
    v2 = wh+10;
    v3 = 50 - x(sr3) +5 -slope * y(sr3) + slope*(7 - y(sr3)); 
    v4 = wh;
    v5 = 50 - x(sr5) +5 -slope * y(sr5) + slope*(7 - y(sr5)); 
    v6 = wh-10;
    v7 = 50 - x(sr7) +5 -slope * y(sr7) + slope*(7 - y(sr7)); 
    v8 = wh-20;
    v9 = 50 - x(sr9) +5 -slope * (25 - y(sr9)) + slope*(y(sr9) - 18); 
    v10 = wh+10;
    v11 = 50 - x(sr11) +5 -slope * (25 - y(sr11)) + slope*(y(sr11) - 18); 
    v12 = wh;
    v13 = 50 - x(sr13) +5 -slope * (25 - y(sr13)) + slope*(y(sr13) - 18); 
    v14 = wh-10;
    v15 = 50 - x(sr15) +5 -slope * (25 - y(sr15)) + slope*(y(sr15) - 18); 
    v16 = wh-20;
    v17 = 50 - x(sr17) +5 -slope * (y(sr17) - 25) + slope*(32 - y(sr17)); 
    v18 = wh+10;
    v19 = 50 - x(sr19) +5 -slope * (y(sr19) - 25) + slope*(32 - y(sr19)); 
    v20 = wh;
    v21 = 50 - x(sr21) +5 -slope * (y(sr21) - 25) + slope*(32 - y(sr21)); 
    v22 = wh-10;
    v23 = 50 - x(sr23) +5 -slope * (y(sr23) - 25) + slope*(32 - y(sr23)); 
    v24 = wh-20;
    v25 = 50 - x(sr25) +5 -slope * (50 - y(sr25)) + slope*(y(sr25) - 43); 
    v26 = wh+10;
    v27 = 50 - x(sr27) +5 -slope * (50 - y(sr27)) + slope*(y(sr27) - 43); 
    v28 = wh;
    v29 = 50 - x(sr29) +5 -slope * (50 - y(sr29)) + slope*(y(sr29) - 43); 
    v30 = wh-10;
    v31 = 50 - x(sr31) +5 -slope * (50 - y(sr31)) + slope*(y(sr31) - 43); 
    v32 = wh-20;

    result = zeros(size(x));
    result(region1) = value1;
    result(region2) = value2;
    result(region3) = value3;
    result(region4) = value4;
    result(region5) = value5;
    result(region6) = value6;
    result(sr1) = v1;
    result(sr2) = v2;
    result(sr3) = v3;
    result(sr4) = v4;
    result(sr5) = v5;
    result(sr6) = v6;
    result(sr7) = v7;
    result(sr8) = v8;
    result(sr9) = v9;
    result(sr10) = v10;
    result(sr11) = v11;
    result(sr12) = v12;
    result(sr13) = v13;
    result(sr14) = v14;
    result(sr15) = v15;
    result(sr16) = v16;
    result(sr17) = v17;
    result(sr18) = v18;
    result(sr19) = v19;
    result(sr20) = v20;
    result(sr21) = v21;
    result(sr22) = v22;
    result(sr23) = v23;
    result(sr24) = v24;
    result(sr25) = v25;
    result(sr26) = v26;
    result(sr27) = v27;
    result(sr28) = v28;
    result(sr29) = v29;
    result(sr30) = v30;
    result(sr31) = v31;
    result(sr32) = v32;
end

% no house version
% function result = piecewiseFunction(x, y)
%     region1 = (y >= 0 & y < 10);
%     region2 = (y >= 10 & y < 15);
%     region3 = (y >= 15 & y < 25);
%     region4 = (y >= 25 & y < 35);
%     region5 = (y >= 35 & y < 40);
%     region6 = (y >= 40 & y <= 50);
% 
%     value1 = 50 - x(region1) +5 -0.5 * y(region1);
%     value2 = 50 - x(region2);
%     value3 = 50 - x(region3) +5 -0.5 * (25 - y(region3));
%     value4 = 50 - x(region4) +5 -0.5 * (y(region4) - 25);
%     value5 = 50 - x(region5);
%     value6 = 50 - x(region6) +5 -0.5 * (50 - y(region6));
% 
%     result = zeros(size(x));
%     result(region1) = value1;
%     result(region2) = value2;
%     result(region3) = value3;
%     result(region4) = value4;
%     result(region5) = value5;
%     result(region6) = value6;
% end