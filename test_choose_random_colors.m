% Tests for choose_random_colors.m

n_colors = 3;

color_mat = choose_random_colors(n_colors);
close() % fix for obnoxious figure opening on colormap call

% Check the size of the matrix
assert(all(size(color_mat) == [3 3]))

% Insure the colors are distinct
for i = 1:n_colors
    for j = i+1:n_colors
        assert(~all(color_mat(i, :) == color_mat(j, :)));
    end
end
%This is my one line change. 
% Plot the colors for a user to check
figure()
clf

hold on
for i = 1:n_colors
    plot(i, 0, '.', 'color', color_mat(i, :), 'markersize', 30)
end
hold off

axis auto
