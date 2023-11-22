% Potential function as in Junyuan's paper (second and third terms in the
% velocity update). x represent agents' positions. f is potential function. 
% e represents the array of possible exits
function U = potential(x, e)
    U1 = rand;
    U2 = rand;

    % Weight in the hill function h(x)=x/(c0+x)
    c0 = 0.5;

    % Weight of the local best position and the global best position.
    c1 = 1;
    c2 = 0;



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
        f = @(a, b) piecewiseFunction(a, b);
        [x1, x2] = meshgrid(linspace(x(i, 1), x(i, 1)+1, 2), linspace(x(i, 2), x(i, 2)+1, 2));
        z = f(x1, x2);
        % z(obstacleRegion) = NaN;
        grad = gradient(z,1,1);


        %U(i, :) = c2 * U2 * global_optimal_dir / (norm(global_optimal_dir, 2) + c0);
        U(i, :) = c1 * U1 * grad(1, :)/(norm(grad(1, :), 2) + c0) + c2 * U2 * global_optimal_dir / (norm(global_optimal_dir, 2) + c0);
    end
    
end


