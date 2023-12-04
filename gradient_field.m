f = @(x, y) piecewiseFunction(x, y);
[x, y] = meshgrid(linspace(0, 50, 200), linspace(0, 50, 200));

z = f(x, y);
[gradX, gradY] = gradient(z,50/200,50/200);


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