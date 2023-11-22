function u = Lennard_Jones_homo(x, q)
    A = 1;
    B = 6 * A;

    R = 36;

    u = zeros(size(x, 1));
    for i=1:size(x, 1)
        for j=1:size(x, 1)
            dist = x(i, :) - x(j, :);
            if dist <= R
                temp = (A / dist^12 - B / dist^6) / dist;
                % Add the emotional effect
                if nargin > 1
                    temp = temp / (1 + q(j) - q(i));
                end
                u(i, :) = u(i, :) + temp * (x(i, :)-x(j, :));
            end
        end
    end
    
end