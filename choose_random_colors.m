function color_matrix = choose_random_colors(n_colors)
% Chooses n random colors from the current color map, attempting to choose
% distinct colors

% TODO: see if there is a built-in function that can do this

color_matrix = colormap();

n_total_colors = length(color_matrix);

stride = floor(n_total_colors/n_colors);

start_index = floor(rand*stride) + 1;

choices = start_index:stride:n_total_colors;

choices = choices(randperm(n_colors));

color_matrix = color_matrix(choices, :);

end

%%Carrie Ann is awesome