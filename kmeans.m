function [centroids_x, centroids_y, cluster_assignment] = kmeans(points_x, points_y, n_centroids, n_iterations)
n_points = length(points_x);

% Choose initial centroids to be actual points
start_points = randsample(1:n_points, n_centroids);

centroids_x = points_x(start_points);
centroids_y = points_y(start_points);

% TODO: change for-loops to matrix operations

% EDITS EDITS EDITS EDITS SHAMIK

for i = 1:n_iterations
    % Calculate distance to each point
    distances = zeros(n_centroids, n_points);
    
    for centroid_index = 1:n_centroids
        for point_index = 1:n_points
            distances(centroid_index, point_index) = sqrt( ...
                (centroids_x(centroid_index) - points_x(point_index))^2 + ...
                (centroids_y(centroid_index) - points_y(point_index))^2 ...
                );
        end
    end
       
    % Assign points to their closest centroid
    cluster_assignment = zeros(n_points, 1);
    
    for point_index = 1:n_points
        [~, centroid_index] = min(distances(:, point_index));
        
        cluster_assignment(point_index) = centroid_index;
    end
    
    % Calculate new centroid positions by averaging assigned points
    total_x = zeros(n_centroids, 1);
    total_y = zeros(n_centroids, 1);
    
    n_assigned = zeros(n_centroids, 1);
    
    for point_index = 1:n_points
        centroid_index = cluster_assignment(point_index);
        
        total_x(centroid_index) = total_x(centroid_index) + points_x(point_index);
        total_y(centroid_index) = total_y(centroid_index) + points_y(point_index);
        
        n_assigned(centroid_index) = n_assigned(centroid_index) + 1;
    end
    
    centroids_x = total_x ./ n_assigned;
    centroids_y = total_y ./ n_assigned;
    
end

end