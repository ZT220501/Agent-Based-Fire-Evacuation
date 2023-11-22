% Potential function as in Junyuan's paper (second and third terms in the
% velocity update). x represent agents' positions. f is potential function. 
% e represents the array of possible exits
function U = potential(x, e)
    U1 = rand;
    U2 = rand;

    % Weight in the hill function h(x)=x/(c0+x)
    c0 = 0.5;

    % Weight of the local best position and the global best position.
    c1 = 0.05;
    c2 = 1;



    U = zeros(size(x));
    for i=1:size(x, 1)
        min_dist = norm(e(1, :)-x(i, :));
        global_optimal = e(1, :);

        for j=1:size(e, 1)
           dist = norm(e(j, :)-x(i, :));
           if dist < min_dist
               min_dist = dist;
               global_optimal = e(j, :);
           end
        end
        global_optimal_dir = global_optimal - x(i, :);


        %Evaluate the gradient nearby
        f = @(x, y) piecewiseFunction(x, y);
        [x1, x2] = meshgrid(linspace(x(i, 1), x(i, 1)+1, 2), linspace(x(i, 2), x(i, 2)+1, 2));
        z = f(x1, x2);
        % z(obstacleRegion) = NaN;
        grad = gradient(z,1,1);


        %U(i, :) = c2 * U2 * global_optimal_dir / (norm(global_optimal_dir, 2) + c0);
        U(i, :) = c1 * U1 * grad(1, :)/(norm(grad(1, :), 2) + c0) + c2 * U2 * global_optimal_dir / (norm(global_optimal_dir, 2) + c0);
    end
    
end





% function result = piecewiseFunction(x, y)
%     region1 = (y >= 0 & y < 10);
%     region2 = (y >= 10 & y < 15);
%     region3 = (y >= 15 & y < 25);
%     region4 = (y >= 25 & y < 35);
%     region5 = (y >= 35 & y < 40);
%     region6 = (y >= 40 & y <= 50);
%     sr1 = (x > 8 & x < 12 & y > 3 & y < 7);
%     sr2 = ((x >= 8 & x <= 12 & y>=2.75 & y <= 3) | (x >= 8 & x<=8.25 & y >= 3 & y <= 7) | (x >=11.75 & x <= 12 & y >= 3 & y <= 7));
%     sr3 = (x > 18 & x < 22 & y > 3 & y < 7);
%     sr4 = ((x >= 18 & x <= 22 & y>=2.75 & y <= 3) | (x >= 18 & x<=18.25 & y >= 3 & y <= 7) | (x >=21.75 & x <= 22 & y >= 3 & y <= 7));
%     sr5 = (x > 28 & x < 32 & y > 3 & y < 7);
%     sr6 = ((x >= 28 & x <= 32 & y>=2.75 & y <= 3) | (x >= 28 & x<=28.25 & y >= 3 & y <= 7) | (x >=31.75 & x <= 32 & y >= 3 & y <= 7));
%     sr7 = (x > 38 & x < 42 & y > 3 & y < 7);
%     sr8 = ((x >= 38 & x <= 42 & y>=2.75 & y <= 3) | (x >= 38 & x<=38.25 & y >= 3 & y <= 7) | (x >=41.75 & x <= 42 & y >= 3 & y <= 7));
%     sr9 = (x > 8 & x < 12 & y > 18 & y < 22);
%     sr10 = ((x >= 8 & x <= 12 & y>=21.75 & y <=22 ) | (x >= 8 & x<=8.25 & y >= 18 & y <= 22) | (x >=11.75 & x <= 12 & y >= 18 & y <= 22));
%     sr11 = (x > 18 & x < 22 & y > 18 & y < 22);
%     sr12 = ((x >= 18 & x <= 22 & y>=21.75 & y <=22) | (x >= 18 & x<=18.25 & y >= 18 & y <= 22) | (x >=21.75 & x <= 22 & y >= 18 & y <= 22));
%     sr13 = (x > 28 & x < 32 & y > 18 & y < 22);
%     sr14 = ((x >= 28 & x <= 32 & y>=21.75 & y <=22) | (x >= 28 & x<=28.25 & y >= 18 & y <= 22) | (x >=31.75 & x <= 32 & y >= 18 & y <= 22));
%     sr15 = (x > 38 & x < 42 & y > 18 & y < 22);
%     sr16 = ((x >= 38 & x <= 42 & y>=21.75 & y <=22) | (x >= 38 & x<=38.25 & y >= 18 & y <= 22) | (x >=41.75 & x <= 42 & y >= 18 & y <= 22));
%     sr17 = (x > 8 & x < 12 & y > 28 & y < 32);
%     sr18 = ((x >= 8 & x <= 12 & y>=27.75 & y<=28) | (x >= 8 & x<=8.25 & y >= 28 & y <= 32) | (x >=11.75 & x <= 12 & y >= 28 & y <= 32));
%     sr19 = (x > 18 & x < 22 & y > 28 & y < 32);
%     sr20 = ((x >= 18 & x <= 22 & y>=27.75 & y<=28) | (x >= 18 & x<=18.25 & y >= 28 & y <= 32) | (x >=21.75 & x <= 22 & y >= 28 & y <= 32));
%     sr21 = (x > 28 & x < 32 & y > 28 & y < 32);
%     sr22 = ((x >= 28 & x <= 32 & y>=27.75 & y<=28) | (x >= 28 & x<=28.25 & y >= 28 & y <= 32) | (x >=31.75 & x <= 32 & y >= 28 & y <= 32));
%     sr23 = (x > 38 & x < 42 & y > 28 & y < 32);
%     sr24 = ((x >= 38 & x <= 42 & y>=27.75 & y<=28) | (x >= 38 & x<=38.25 & y >= 28 & y <= 32) | (x >=41.75 & x <= 42 & y >= 28 & y <= 32));
%     sr25 = (x > 8 & x < 12 & y > 43 & y < 47);
%     sr26 = ((x >= 8 & x <= 12 & y>=46.75 & y<=47 ) | (x >= 8 & x<=8.25 & y >= 43 & y <= 47) | (x >=11.75 & x <= 12 & y >= 43 & y <= 47));
%     sr27 = (x > 18 & x < 22 & y > 43 & y < 47);
%     sr28 = ((x >= 18 & x <= 22 & y>=46.75 & y<=47) | (x >= 18 & x<=18.25 & y >= 43 & y <= 47) | (x >=21.75 & x <= 22 & y >= 43 & y <= 47));
%     sr29 = (x > 28 & x < 32 & y > 43 & y < 47);
%     sr30 = ((x >= 28 & x <= 32 & y>=46.75 & y<=47) | (x >= 28 & x<=28.25 & y >= 43 & y <= 47) | (x >=31.75 & x <= 32 & y >= 43 & y <= 47));
%     sr31 = (x > 38 & x < 42 & y > 43 & y < 47);
%     sr32 = ((x >= 38 & x <= 42 & y>=46.75 & y<=47) | (x >= 38 & x<=38.25 & y >= 43 & y <= 47) | (x >=41.75 & x <= 42 & y >= 43 & y <= 47));
% 
% 
% 
% 
%     value1 = 50 - x(region1) +5 -0.5 * y(region1);
%     value2 = 50 - x(region2);
%     value3 = 50 - x(region3) +5 -0.5 * (25 - y(region3));
%     value4 = 50 - x(region4) +5 -0.5 * (y(region4) - 25);
%     value5 = 50 - x(region5);
%     value6 = 50 - x(region6) +5 -0.5 * (50 - y(region6));
%     v1 = 50 - x(sr1) +5 -0.5 * y(sr1) + 0.5*(7 - y(sr1)); 
%     v2 = 60;
%     v3 = 50 - x(sr3) +5 -0.5 * y(sr3) + 0.5*(7 - y(sr3)); 
%     v4 = 50;
%     v5 = 50 - x(sr5) +5 -0.5 * y(sr5) + 0.5*(7 - y(sr5)); 
%     v6 = 40;
%     v7 = 50 - x(sr7) +5 -0.5 * y(sr7) + 0.5*(7 - y(sr7)); 
%     v8 = 30;
%     v9 = 50 - x(sr9) +5 -0.5 * (25 - y(sr9)) + 0.5*(y(sr9) - 18); 
%     v10 = 60;
%     v11 = 50 - x(sr11) +5 -0.5 * (25 - y(sr11)) + 0.5*(y(sr11) - 18); 
%     v12 = 50;
%     v13 = 50 - x(sr13) +5 -0.5 * (25 - y(sr13)) + 0.5*(y(sr13) - 18); 
%     v14 = 40;
%     v15 = 50 - x(sr15) +5 -0.5 * (25 - y(sr15)) + 0.5*(y(sr15) - 18); 
%     v16 = 30;
%     v17 = 50 - x(sr17) +5 -0.5 * (y(sr17) - 25) + 0.5*(32 - y(sr17)); 
%     v18 = 60;
%     v19 = 50 - x(sr19) +5 -0.5 * (y(sr19) - 25) + 0.5*(32 - y(sr19)); 
%     v20 = 50;
%     v21 = 50 - x(sr21) +5 -0.5 * (y(sr21) - 25) + 0.5*(32 - y(sr21)); 
%     v22 = 40;
%     v23 = 50 - x(sr23) +5 -0.5 * (y(sr23) - 25) + 0.5*(32 - y(sr23)); 
%     v24 = 30;
%     v25 = 50 - x(sr25) +5 -0.5 * (50 - y(sr25)) + 0.5*(y(sr25) - 43); 
%     v26 = 60;
%     v27 = 50 - x(sr27) +5 -0.5 * (50 - y(sr27)) + 0.5*(y(sr27) - 43); 
%     v28 = 50;
%     v29 = 50 - x(sr29) +5 -0.5 * (50 - y(sr29)) + 0.5*(y(sr29) - 43); 
%     v30 = 40;
%     v31 = 50 - x(sr31) +5 -0.5 * (50 - y(sr31)) + 0.5*(y(sr31) - 43); 
%     v32 = 30;
% 
%     result = zeros(size(x));
%     result(region1) = value1;
%     result(region2) = value2;
%     result(region3) = value3;
%     result(region4) = value4;
%     result(region5) = value5;
%     result(region6) = value6;
%     result(sr1) = v1;
%     result(sr2) = v2;
%     result(sr3) = v3;
%     result(sr4) = v4;
%     result(sr5) = v5;
%     result(sr6) = v6;
%     result(sr7) = v7;
%     result(sr8) = v8;
%     result(sr9) = v9;
%     result(sr10) = v10;
%     result(sr11) = v11;
%     result(sr12) = v12;
%     result(sr13) = v13;
%     result(sr14) = v14;
%     result(sr15) = v15;
%     result(sr16) = v16;
%     result(sr17) = v17;
%     result(sr18) = v18;
%     result(sr19) = v19;
%     result(sr20) = v20;
%     result(sr21) = v21;
%     result(sr22) = v22;
%     result(sr23) = v23;
%     result(sr24) = v24;
%     result(sr25) = v25;
%     result(sr26) = v26;
%     result(sr27) = v27;
%     result(sr28) = v28;
%     result(sr29) = v29;
%     result(sr30) = v30;
%     result(sr31) = v31;
%     result(sr32) = v32;
% end






function result = piecewiseFunction(x, y)
    region1 = (y >= 0 & y < 10);
    region2 = (y >= 10 & y < 15);
    region3 = (y >= 15 & y < 25);
    region4 = (y >= 25 & y < 35);
    region5 = (y >= 35 & y < 40);
    region6 = (y >= 40 & y <= 50);

    value1 = 50 - x(region1) +5 -0.5 * y(region1);
    value2 = 50 - x(region2);
    value3 = 50 - x(region3) +5 -0.5 * (25 - y(region3));
    value4 = 50 - x(region4) +5 -0.5 * (y(region4) - 25);
    value5 = 50 - x(region5);
    value6 = 50 - x(region6) +5 -0.5 * (50 - y(region6));

    result = zeros(size(x));
    result(region1) = value1;
    result(region2) = value2;
    result(region3) = value3;
    result(region4) = value4;
    result(region5) = value5;
    result(region6) = value6;
end
