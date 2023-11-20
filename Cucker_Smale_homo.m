function u = Cucker_Smale_homo(x, q, v)

    % Set up the parameters; TO BE FINE TUNED
    % R = 10;

    u = zeros(size(x));
    for i=1:size(x, 1)
        for j=1:size(x, 1)
            if j ~= i
                dist = norm(x(i, :)-x(j, :));
                % if dist <= R
                temp = -( 1 + dist*dist)^(-0.25);
                % Add the emotional effect
                % if nargin > 1
                %     temp = temp / (1 + q(j) - q(i));
                % end
                u(i, :) = u(i, :) + temp * (v(i, :)-v(j, :));
                % end
            end
            
        end
    end
    

end
