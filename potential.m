% Potential function as in Junyuan's paper (second and third terms in the
% velocity update). x represent agents' positions. f is potential function. 
% e represents the array of possible exits
function U = potential(x, e)
    U1 = rand;
    U2 = rand;

    % Weight in the hill function h(x)=x/(c0+x)
    c0 = 1;

    % Weight of the local best position and the global best position.
    c1 = 0.5;
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

