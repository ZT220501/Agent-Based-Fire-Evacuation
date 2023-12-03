% Calculate the D Orsogna-Bertozzi model of repulsion and attraction
% between people and people.
% Ca, Cr, LA, LR are the parameters in the model. R is the radius where the
% nearby agents become effective.
% x is a n*2 matrix where n is the number of agents; x(i, :) is the
% position of an agent.
function u = DOrsogna_Bertozzi_homo_2(x, q)
    % car on car

    % Set up the parameters; TO BE FINE TUNED
    Ca = 0.2;
    Cr = 1.5;                % Set the ratio of attraction and repulsion
    LA = 12;
    LR = 6;
    R = 15;

    u = zeros(size(x));
    for i=1:size(x, 1)
        for j=1:size(x, 1)
            if j ~= i && x(j, 1) < 50
                dist = norm(x(i, :)-x(j, :));
                if dist <= R
                    if dist == 0
                        dist = 0.01;
                    end
                    temp = (Ca * exp(-dist/LA) - Cr * exp(-dist/LR))/dist;
                    if dist <= R/5
                        temp =  (-5 / dist^6)/dist;
                    end
                    % Add the emotional effect
                    if nargin > 1
                        temp = temp / (1.5 + q(j) - q(i));
                    end
                    u(i, :) = u(i, :) + temp * (x(i, :)-x(j, :));
                end
            end
            
        end
    end
    

end

