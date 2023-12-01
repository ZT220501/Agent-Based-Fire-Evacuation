% Calculate the D Orsogna-Bertozzi model of repulsion and attraction
% between people and car.
% Ca, Cr, LA, LR are the parameters in the model. R is the radius where the
% nearby agents become effective.
% x is a n*2 matrix where n is the number of agents; x(i, :) is the
% position of an agent. x represents the kind of agent that will be
% updated, and y represents the kind of agent that provides effects.
% qx is the emotion of the x agents; qy is the emotion of the y agents.
function u = DOrsogna_Bertozzi_hetero(x, y, qx, qy)
    % car on human

    % Set up the parameters; TO BE FINE TUNED
    Ca = 1;
    Cr = 1.5 * Ca;                % Set the ratio of attraction and repulsion
    LA = 12;
    LR = 6;
    R = 10;


    u = zeros(size(x));
    for i=1:size(x, 1)
        for j=1:size(y, 1)
            dist = norm(x(i, :)-y(j, :));
            if dist <= R && dist ~=0
                temp = (Ca * exp(-dist/LA) - Cr * exp(-dist/LR))/dist;
                if dist <= R/5
                    temp = (Ca * exp(-dist/LA) - Cr * 1 / dist^6)/dist;
                end
                % Add the emotional effect
                if nargin > 2
                    temp = temp / (1.5 + qy(j) - qx(i));
                end
                u(i, :) = u(i, :) + temp * (x(i, :)-y(j, :));
            end
        end
    end

end

