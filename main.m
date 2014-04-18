% Main execution file

n_points = 100;

points = xlsread('data.xls');

points_x = points(:, 1);
points_y = points(:, 2);

n_clusters = 10;
n_iterations = 100;

[~, ~, cluster_assignment] = kmeans(points_x, points_y, n_clusters, n_iterations);

cluster_points_x = {};
cluster_points_y = {};

for cluster_index = 1:n_clusters
    points_in_cluster = (cluster_index == cluster_assignment);
    
    cluster_points_x{cluster_index} = points_x(points_in_cluster);
    cluster_points_y{cluster_index} = points_y(points_in_cluster);
end

cluster_colors = choose_random_colors(n_clusters);

figure(1)
clf

subplot(1, 2, 1)
plot(points_x, points_y, '.')
axis square

subplot(1, 2, 2)

hold on

for cluster_index = 1:n_clusters
    x = cluster_points_x{cluster_index};
    y = cluster_points_y{cluster_index};
    
    [convhull_x, convhull_y] = convhull_points(x, y);
    
    plot(convhull_x, convhull_y, 'k')
    
    [visit_order, ~] = find_shortest_path(x, y, 10000);
    
    plot(x(visit_order), y(visit_order), 'color', cluster_colors(cluster_index, :), 'linewidth', 2)
end

hold off

axis square
