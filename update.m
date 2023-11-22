% This function updates the positions of each agent in the agent-based
% model. Input variable x is a 2d array represents the positions of all the 
% people; y is a 2d array represents the positions of all the cars. g_{ab}
% represents the pairwise interaction that b acts on a. e_{ab} represents 
% the emotion contagion that b acts on a. U is the potential field.
% By default, the positions are updated using forward Euler.




function [x_updated, v_updated, q_updated] = update(x, v, dt, g, U, e, q)

    %Update the velocity field
    v_updated = v + 0.05 * g(x, q) + U(x, e);

    %Update the positions
    x_updated = x + dt * v_updated;

    %Update the emotions using the piecewise function g
    beta = 1.5;
    R = 10;
    q_updated = zeros(size(q));

    for i=1:size(q)
        for j=1:size(q)
            total_sum = 0;
            total_count = 0;
            dist = norm(x(i, :) - x(j, :));
            if dist < R
                total_count = total_count + 1;
                diff = q(i) - q(j);
                if diff > 0
                    total_sum = total_sum + beta * diff;
                elseif diff < 0
                    total_sum = total_sum + 0.5 * beta * diff;
                end

                q_updated(i) = total_sum / total_count;
            end
        end

    end
end


% %Update function for homogeneous agents without emotion
% function [x_updated, v_updated] = update(x, v, dt, g, U, e)
%     %Update the velocity field
%     v_updated = v + 0.1 * g(x) + U(x, e);
% 
%     %Update the positions
%     x_updated = x + dt * v_updated;
% 
% end

