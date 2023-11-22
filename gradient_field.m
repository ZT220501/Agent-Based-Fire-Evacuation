f = @(x, y) piecewiseFunction(x, y);
[x, y] = meshgrid(linspace(0, 50, 200), linspace(0, 50, 200));
% obstacleRegion = (x > 15 & x < 35 & y > 3 & y < 7);
z = f(x, y);
% z(obstacleRegion) = NaN;
[gradX, gradY] = gradient(z,1,1);

figure;
subplot(1, 2, 1);
surf(x, y, z);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Surface Function');

subplot(1, 2, 2);
quiver(x, y, -gradX, -gradY);
xlabel('X-axis');
ylabel('Y-axis');
title('Gradient Vectors');

