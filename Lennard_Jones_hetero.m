function u = Lennard_Jones_hetero(x, y, qx, qy)
    A = 1;
    B = 6 * B;

    R = 36;

    u = zeros(size(x, 1));
    for i=1:size(x, 1)
        for j=1:size(y, 1)
            dist = x(i, :) - y(j, :);
            if dist <= R
                temp = (A / dist^12 - B / dist^6) / dist;
                % Add the emotional effect
                if nargin > 2
                    temp = temp / (1 + qy(j) - qx(i));
                end
                u(i, :) = u(i, :) + temp * (x(i, :)-y(j, :));
            end
        end
    end
    
end