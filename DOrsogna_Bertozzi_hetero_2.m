% Calculate the D Orsogna-Bertozzi model of repulsion and attraction
% between people and car.
% Ca, Cr, LA, LR are the parameters in the model. R is the radius where the
% nearby agents become effective.
% x is a n*2 matrix where n is the number of agents; x(i, :) is the
% position of an agent. x represents the kind of agent that will be
% updated, and y represents the kind of agent that provides effects.
% qx is the emotion of the x agents; qy is the emotion of the y agents.
function u = DOrsogna_Bertozzi_hetero_2(x, y, qx, qy)
    % human on car

    % Set up the parameters; TO BE FINE TUNED
    Ca = 0.1;
    Cr = 0.15;                % Set the ratio of attraction and repulsion
    LA = 12;
    LR = 6;
    R = 10;


    u = zeros(size(x));
    for i=1:size(x, 1)
        for j=1:size(y, 1)
            dist = norm(x(i, :)-y(j, :));
            if dist <= R && dist ~=0
                temp = (Ca * exp(-dist/LA) - Cr * exp(-dist/LR))/dist;
                % Add the emotional effect
                if nargin > 2
                    temp = temp / (1.5 + qy(j) - qx(i));
                end
                u(i, :) = u(i, :) + temp * (x(i, :)-y(j, :));
            end
        end
    end

end

