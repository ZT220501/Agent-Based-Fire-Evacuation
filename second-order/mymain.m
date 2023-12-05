% clear all


N = 2;
T = 5;

                    
% X = rand(N, 2)*100;
% V = rand(N, 2)*100;
% iter_num = 5000;
% dt = T/iter_num;
% t = linspace(0, T, iter_num);
% all_X = zeros(iter_num, N, 2);
% for i=1:iter_num
%     [X, V] = update(X, V, dt, @Cucker_Smale_homo);
%     all_X(i,:,:) = X;
% end


y0 = rand(4*N, 1)*100;
% options = odeset('RelTol',1e-3,'AbsTol', 1e-4);
[t, y] = ode15s(@(t, y) myupdate(y), [0,T], y0);
all_X = reshape(y, size(t, 1), N, 2, 2);
all_X = all_X(:,:,:,1);


% cm = colormap(winter);



figure;
colormap winter
c = flipud(linspace(0,T,size(all_X, 1))); 
for j = 1:N
    all_X(end,:,2) = NaN;
    % plot(all_X(:,j,1), all_X(:,j,2));
    patch(all_X(:,j,1), all_X(:,j,2), c, 'EdgeColor','interp')
    if j == 1
        hold on
    end
end

colorbar;

hold off
