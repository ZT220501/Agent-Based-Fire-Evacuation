clear all

% Randomly initialize (for now homogeneous agents) in the plot.
N = 50;                                       %Number of agents
x = rand(N, 1) .* 10 + 1;
y = rand(N, 1) .* 30 + 10;
X = zeros(N, 2);
X(:, 1) = x;
X(:, 2) = y;


%Initialize velocity of the agents to be zero
V = zeros(N, 2);

%All possible exits; the road has y-coordinates 10-15 and 35-40
% e = [50 12.5; 50 37.5];
y_coord1 = reshape(linspace(10, 15, 50), [50, 1]);
y_coord2 = reshape(linspace(35, 40, 50), [50, 1]);

x_coord = ones(100, 1) * 50;
y_coord = cat(1, y_coord1, y_coord2);
e = cat(2, x_coord, y_coord);

%Specify the initial emotions of the agents
q = zeros(N);
for i=1:N
    if X(i, 1) > 10
        q(i) = 1;
    else
        q(i) = 0;
    end
end


T = 10;                 %Maximum time
iter_num = 70;
t = linspace(0, T, iter_num);
% scatter(X(:, 1), X(:, 2))
% xlim([0 50])
% ylim([0 50])
% pause(0.2)

all_X = zeros(iter_num, N, 2);

for i=1:iter_num
    [X, V, q] = update(X, V, T/iter_num, @DOrsogna_Bertozzi_homo, @potential, e, q);
%     [X, V] = update(X, V, T/iter_num, @Cucker_Smale_homo, @potential, e, q);

%     all_X(i,:,:) = X;
% 
% 
    scatter(X(:, 1), X(:, 2), 15, 'blue', "filled")

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
    pause(0.2)
end










