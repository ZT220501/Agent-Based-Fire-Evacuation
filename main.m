clear all

% Randomly initialize people in the plot.
% Initialize so that some people are inside the buildings
N = 30;                                       %Number of people
x = rand(N, 1) .* 4 + 1;
y = rand(N, 1) .* 30 + 10;
X = zeros(N, 2);
X(:, 1) = x;
X(:, 2) = y;

% Randomly initialize cars in the plot; cars are assumed to be initializd
% on the road
M = 30;                                       %Number of cars
x = rand(M, 1) .* 10 + 1;
y1 = rand(M/2, 1) .* 5 + 10;
y2 = rand(M/2, 1) .* 5 + 35;
y = cat(1, y1, y2);
Y = zeros(M, 2);
Y(:, 1) = x;
Y(:, 2) = y;


%Initialize velocity of the agents to be zero
V = zeros(N, 2);
W = zeros(M, 2);

%All possible exits; the road has y-coordinates 10-15 and 35-40
% e = [50 12.5; 50 37.5];
y_coord1 = reshape(linspace(10, 15, 50), [50, 1]);
y_coord2 = reshape(linspace(35, 40, 50), [50, 1]);

x_coord = ones(100, 1) * 50;
y_coord = cat(1, y_coord1, y_coord2);
e = cat(2, x_coord, y_coord);

%Specify the initial emotions of the agents
qx = zeros(N);
qy = zeros(M);
for i=1:N
    if X(i, 1) > 10
        qx(i) = 1;
    else
        qx(i) = 0;
    end
end
for i=1:M
    if Y(i, 1) > 10
        qy(i) = 1;
    else
        qy(i) = 0;
    end
end


% q = zeros(N);
% for i=1:N
%     if X(i, 1) > 10
%         q(i) = 1;
%     else
%         q(i) = 0;
%     end
% end


T = 100;                 %Maximum time
iter_num = 5000;
t = linspace(0, T, iter_num);
% scatter(X(:, 1), X(:, 2))
% xlim([0 50])
% ylim([0 50])
% pause(0.2)

% street layout
f = @(a1, a2) piecewiseFunction(a1, a2);
[xs, ys] = meshgrid(linspace(0, 50, 200), linspace(0, 50, 200));
zs = f(xs, ys);
[gradX, gradY] = gradient(zs,50/200,50/200);
grad_norm = (gradX.^2 + gradY.^2).^(0.5);
% layout_ind = find(grad_norm>25.0);
layout_ind = find(grad_norm>25.0);
[layout_i, layout_j] = ind2sub(size(zs), layout_ind);
layout_y = layout_i * 50/200;
layout_x = layout_j * 50/200;

center_x = [10, 25, 40];
center_y = [5, 20, 30, 45];
side_length = 2;
wall_x1 = center_x - side_length;
wall_x2 = center_x + side_length;
wall_y1 = center_y - side_length;
wall_y2 = center_y + side_length;
wall_color = "cyan";
wall_thickness = 2;

all_X = zeros(iter_num, N, 2);

for i=1:iter_num
    %Homogeneous case update
%     [X, V, q] = update(X, V, T/iter_num, @DOrsogna_Bertozzi_homo, @potential, e, q);
%     [X, V] = update(X, V, T/iter_num, @Cucker_Smale_homo, @potential, e, q);


    %Heterogeneous case update
    [X, Y, V, W, qx, qy] = update(X, Y, V, W, T/iter_num, @DOrsogna_Bertozzi_homo, @DOrsogna_Bertozzi_homo_2, @DOrsogna_Bertozzi_hetero, @DOrsogna_Bertozzi_hetero_2, @potential, e, qx, qy);

%     all_X(i,:,:) = X;
% 
% 
    

    scatter(X(:, 1), X(:, 2), 10, 'blue', "filled")
    hold on
    scatter(Y(:, 1), Y(:, 2), 20, 'red')

    % street layout
    scatter(layout_x, layout_y, 1, 'magenta')

    hold off

    
    for wi = 1:length(center_x)
        for wj = 1:length(center_y)
            if ~any([7,18,32,43] == wall_y1(wj))
                line([wall_x1(wi), wall_x2(wi)], [wall_y1(wj), wall_y1(wj)], "Color", wall_color, 'LineWidth', wall_thickness);
            end
            if ~any([7,18,32,43] == wall_y2(wj))
                line([wall_x1(wi), wall_x2(wi)], [wall_y2(wj), wall_y2(wj)], "Color", wall_color, 'LineWidth', wall_thickness);
            end

            line([wall_x1(wi), wall_x1(wi)], [wall_y1(wj), wall_y2(wj)], "Color", wall_color, 'LineWidth', wall_thickness);
            line([wall_x2(wi), wall_x2(wi)], [wall_y1(wj), wall_y2(wj)], "Color", wall_color, 'LineWidth', wall_thickness);
        end
    end


    %Lower Road
    yline(10);
    yline(15);

    %Upper Road
    yline(35);
    yline(40);
    

    

    
    
%     
%     for j = 1:N
%         plot(all_X(1:i,j,1), all_X(1:i,j,2), 'Color', [0.3010 0.7450 0.9330]);
%         if j == 1
%             hold on
%         end
%     end
% 
%     scatter(e(:, 1), e(:, 2), 20, "red", "filled");
%     
    xlim([0 50])
    ylim([0 50])
    title(sprintf("iter num = %d", i))
%     hold off
    pause(0.01)


    can_break = true;
    for j=1:size(X ,1)
        if X(j, 1) < 50
            can_break = false;
        end
    end
    for j=1:size(Y ,1)
        if Y(j, 1) < 50
            can_break = false;
        end
    end
    if can_break == true
        disp(i);
        break;
    end
    
end


