% This function updates the positions of each agent in the agent-based
% model. Input variable x is a 2d array represents the positions of all the 
% people; y is a 2d array represents the positions of all the cars. g_{ab}
% represents the pairwise interaction that b acts on a. e_{ab} represents 
% the emotion contagion that b acts on a. U is the potential field.
% By default, the positions are updated using forward Euler.
function [x_updated, y_updated, v_updated, w_updated, qx_update, qy_updated] = update(x, y, v, w, dt, gxx, gxy, gyx, gyy, U, qx, qy)
    %Update the velocity fields
    v_updated = v + gxx(x) + gxy(x, y) + U(x);
    w_updated = w + gyx(x, y) + gyy(y) + U(y);

    %Update the positions
    x_updated = x + dt * v_updated;
    y_updated = y + dt * w_updated;

    %Update the emotions using the piecewise function g
    beta = 1;
    R = 36;
    qx_update = zeros(size(qx));
    qy_update = zeros(size(qy));
    for i=1:size(qx)
        for j=1:size(qy)
            dist = x(i, :) - x(j, :);
            if dist < 
            diff = qx(i) - qx(j);

        end
    end

end

