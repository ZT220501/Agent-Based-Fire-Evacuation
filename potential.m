% Potential function as in Junyuan's paper (second and third terms in the
% velocity update). x represent agents' positions. f is potential function. 
% e represents the array of possible exits
function U = potential(x, e, c0)
    U1 = rand;
    U2 = rand;

    % Weight in the hill function h(x)=x/(c0+x)
    if nargin < 3
        c0 = 10;
    end

    % Weight of the local best position and the global best position.
    c1 = 4.5;
    c2 = 4;



    U = zeros(size(x));
    for i=1:size(x, 1)
        min_dist = norm(e(1, :)-x(i, :));
        global_optimal = e(1, :);

        for j=1:size(e, 1)
           dist = norm(e(j, :)-x(i, :));
           if dist < min_dist && dist ~= 0
               min_dist = dist;
               global_optimal = e(j, :);
           end
        end
        global_optimal_dir = global_optimal - x(i, :);


        %Evaluate the gradient nearby
        f = @(a, b) piecewiseFunction(a, b);
        [x1, x2] = meshgrid(linspace(x(i, 1)-0.01, x(i, 1)+0.01, 3), linspace(x(i, 2)-0.01, x(i, 2)+0.01, 3));
        z = f(x1, x2);
        [grad_x, grad_y] = gradient(z, 0.01, 0.01);
        grad_p = [grad_x(2), grad_y(2)];



        U(i, :) = -c1 * U1 * grad_p/(norm(grad_p, 2) + c0) + c2 * U2 * global_optimal_dir / (norm(global_optimal_dir, 2) + c0);
        

        
    end
    
end


