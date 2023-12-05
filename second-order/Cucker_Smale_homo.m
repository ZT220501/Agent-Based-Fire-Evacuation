function u = Cucker_Smale_homo(x, v)

    u = zeros(size(x));
    for i=1:size(x, 1)
        for j=1:size(x, 1)
            if j ~= i
                dist = norm(x(i, :)-x(j, :));
                temp = g(dist);
                u(i, :) = u(i, :) + temp * (v(j, :)-v(i, :));
                % u(i, :) = u(i, :) + temp * (x(j, :)-x(i, :));
            end
            
        end
    end
    u = u/size(x,1);
end

% function res = g(r)
%     res = (1+r.*r).^(-0.25);
% end

function res = g(r)
    Ca = 200;
    Cr = 5;                % Set the ratio of attraction and repulsion
    LA = 50;
    LR = 50;
    res = (Ca * exp(-r/LA) - Cr * exp(-r*r/LR))/r;
end

% function res = g(r)
%     C = 1;
%     L = 0.5;
%     r_0 = 15;
%     ratio = 1.5;
%     res = C * exp(-ratio*L*(r-r_0)) - ratio*C * exp(-L*(r-r_0))/r;
% end