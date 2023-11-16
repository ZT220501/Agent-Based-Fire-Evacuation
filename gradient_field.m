f = @(x, y) piecewiseFunction(x, y);
[x, y] = meshgrid(linspace(0, 50, 20), linspace(0, 50, 20));
% obstacleRegion = (x > 5 & x < 10 & y > 3 & y < 8);
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

function result = piecewiseFunction(x, y)
    region1 = (y >= 0 & y < 10);
    region2 = (y >= 10 & y < 15);
    region3 = (y >= 15 & y < 25);
    region4 = (y >= 25 & y < 35);
    region5 = (y >= 35 & y < 40);
    region6 = (y >= 40 & y <= 50);

    value1 = 50 - x(region1) +5 -0.5 * y(region1);
    value2 = 50 - x(region2);
    value3 = 50 - x(region3) +5 -0.5 * (25 - y(region3));
    value4 = 50 - x(region4) +5 -0.5 * (y(region4) - 25);
    value5 = 50 - x(region5);
    value6 = 50 - x(region6) +5 -0.5 * (50 - y(region6));

    result = zeros(size(x));
    result(region1) = value1;
    result(region2) = value2;
    result(region3) = value3;
    result(region4) = value4;
    result(region5) = value5;
    result(region6) = value6;
end
