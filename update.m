% This function updates the positions of each agent in the agent-based
% model. Input variable x is a 2d array represents the positions of all the 
% people; y is a 2d array represents the positions of all the cars. g_{ab}
% represents the pairwise interaction that b acts on a. e_{ab} represents 
% the emotion contagion that b acts on a. U is the potential field.
% By default, the positions are updated using forward Euler.



%Update function for heterogeneous agents with emotion
function [x_updated, y_updated, v_updated, w_updated, qx_updated, qy_updated] = update(x, y, v, w, dt, g_homo, g_hetero, U, e, qx, qy)


    %Set a limiting speed
    v_max = 20;
    w_max = 60;

    %Weight for attraction-repulsion terms
    ar_weight = 0.8;

    %Update the velocity field of people according to the limiting speed
    v_updated = v - ar_weight* g_homo(x, qx) - ar_weight * g_hetero(x, y, qx, qy) + U(x, e, 50);
    for i=1:size(x, 1)
        if norm(v_updated(i, :)) > v_max
            v_updated(i, :) = v_updated(i, :) * v_max/norm(v_updated(i, :));
        end
        if v_updated(i, 1) < 0
            v_updated(i, 1) = 0.001;
        end
    end


    %Update the velocity field of cars according to the limiting speed
    w_updated = w - ar_weight * g_homo(y, qy) - ar_weight * g_hetero(y, x, qy, qx) + U(y, e, 20);
    for i=1:size(y, 1)
        if norm(w_updated(i, :)) > w_max
            w_updated(i, :) = w_updated(i, :) * w_max/norm(w_updated(i, :));
        end
        if w_updated(i, 1) < 0
            w_updated(i, 1) = 0.001;
        end
    end

%     if norm(v) ~= 0
%         v_updated = v/norm(v) + 0.0 * g_homo(x, qx) + 0.0 * g_hetero(x, y, qx, qy) + U(x, e);
%     else
%         v_updated = v + 0.0 * g_homo(x, qx) + 0.0 * g_hetero(x, y, qx, qy) + U(x, e);
%     end
%     if norm(w) ~= 0
%         w_updated = w/norm(w) + 0.0 * g_homo(y, qy) + 0.0 * g_hetero(y, x, qy, qx) + U(y, e);
%     else
%         w_updated = w + 0.0 * g_homo(y, qy) + 0.0 * g_hetero(y, x, qy, qx) + U(y, e);
%     end

    %Update the positions for people
    x_updated = x + dt * v_updated;

    %Update the position for cars
%     y_updated = y + dt * w_updated;

    y_updated = zeros(size(y));
    for i=1:size(y, 1)
        temp = y(i, :) + dt * w_updated(i, :);
        %If the car is going to go out of the current road, make sure it
        %stays on the road
        if temp(1, 2) < 10 || (temp(1, 2) > 15 && temp(1, 2) < 35) || temp(1, 2) > 40
            temp(1, 2) = y(i, 2);
        end
        y_updated(i, :) = temp;
    end

    %Update the emotions using the piecewise function g
    beta = 1;
    R = 10;
    

    %Update the emotion of people; they should only be affected by other
    %people and not by surrounding cars
    qx_updated = zeros(size(qx));
    for i=1:size(qx)
        total_sum = 0;
        total_count = 0;
        for j=1:size(qx)
            dist = norm(x(i, :) - x(j, :));
            if (dist < R) && dist ~= 0
                total_count = total_count + 1;
                diff = qx(i) - qx(j);
                if diff > 0
                    total_sum = total_sum + beta * diff;
                elseif diff < 0
                    total_sum = total_sum + 0.5 * beta * diff;
                end
            end
        end
        if total_count == 0
            qx_updated(i) = qx(i);
        else
            qx_updated(i) = total_sum / total_count;
        end
    end


    %Update the emotion of cars; they should be affected by both
    %surrounding people and surrounding cars
    qy_updated = zeros(size(qy));
    for i=1:size(qy)
        total_sum = 0;
        total_count = 0;
        for j=1:size(qx)
            dist = norm(y(i, :) - x(j, :));
            if dist < R && dist ~= 0
                total_count = total_count + 1;
                diff = qy(i) - qx(j);
                if diff > 0
                    total_sum = total_sum + beta * diff;
                elseif diff < 0
                    total_sum = total_sum + 0.5 * beta * diff;
                end
            end
        end
        for j=1:size(qy)
            dist = norm(y(i, :) - y(j, :));
            if (dist < R) && (dist ~= 0)
                total_count = total_count + 1;
                diff = qy(i) - qy(j);
                if diff > 0
                    total_sum = total_sum + beta * diff;
                elseif diff < 0
                    total_sum = total_sum + 0.5 * beta * diff;
                end
            end
        end
        if total_count == 0
            qy_updated(i) = qy(i);
        else
            qy_updated(i) = total_sum / total_count;
        end
    end
end





















% %Update function for homogeneous agents with emotion
% function [x_updated, v_updated, q_updated] = update(x, v, dt, g, U, e, q)
% 
%     %Update the velocity field
%     v_updated = v + 0.5 * g(x, q) + U(x, e);
% 
%     %Update the positions
%     x_updated = x + dt * v_updated;
% 
%     %Update the emotions using the piecewise function g
%     beta = 1;
%     R = 5;
%     q_updated = zeros(size(q));
% 
%     for i=1:size(q)
%         total_sum = 0;
%         total_count = 0;
%         for j=1:size(q)
%             dist = norm(x(i, :) - x(j, :));
%             if dist < R
%                 total_count = total_count + 1;
%                 diff = q(i) - q(j);
%                 if diff > 0
%                     total_sum = total_sum + beta * diff;
%                 elseif diff < 0
%                     total_sum = total_sum + 0.5 * beta * diff;
%                 end
% 
%             end
%         end
%         q_updated(i) = total_sum / total_count;
% 
%     end
% end


% %Update function for homogeneous agents without emotion
% function [x_updated, v_updated] = update(x, v, dt, g, U, e)
%     %Update the velocity field
%     v_updated = v + 0.1 * g(x) + U(x, e);
% 
%     %Update the positions
%     x_updated = x + dt * v_updated;
% 
% end



