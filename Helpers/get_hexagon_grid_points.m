function [ center_x center_y ] = get_hexagon_grid_points(center, area, x_width, y_width)
% [ hexagons ] = get_hexagon_grid(center, area, x_limits, y_limits)
%   center = center of entire grid
%   area = area of each hexagon
%   x_limits = x-axis limits of the hexagon grid (rounds down)
%   y_limits = y-axis limits of the hexagon grid (rounds up)
%
%   hexagons = array of structures
%       xv = x vertices
%       yv = y vertices
%       active = is this cell allowed to be active?
%       power = transmit power (default: 1)



hexagon_side_length = sqrt(area * 2/(3*sqrt(3)));
hexagon_height = sqrt(3)*hexagon_side_length;
hexagon_width = 2*hexagon_side_length;


% xv = [ -(hexagon_width/2-hexagon_side_length/2)  (hexagon_width/2-hexagon_side_length/2)  hexagon_width/2  (hexagon_width/2-hexagon_side_length/2)  -(hexagon_width/2-hexagon_side_length/2)  -hexagon_width/2 ];
% yv = [ hexagon_height/2 hexagon_height/2 0 -hexagon_height/2 -hexagon_height/2 0 ];
% xv = [xv xv(1)];
% yv = [yv yv(1)];
distance_limit = max(x_width, y_width);
grid_size = ceil(distance_limit/hexagon_height) * 2 + 1;



grid_width = hexagon_side_length * grid_size + (hexagon_width-hexagon_side_length)/2 * (grid_size + 0);
grid_height = hexagon_height * (grid_size);


% center_x = zeros(grid_size);
% center_y = zeros(grid_size);

[i,j] = meshgrid(1:grid_size, 1:grid_size);

center_x = (hexagon_width-hexagon_side_length/2)*(i - 1/2);
center_y = hexagon_height*(j - 1/2*mod(i,2));

center_x = center_x + center(1) - grid_width/2;
center_y = center_y + center(2) - grid_height/2;

% 
% 
% % hexagons = struct('active', {ones(grid_size^2,1)});
% 
% for i = 1:grid_size
%     for j = 1:grid_size
%         idx = (i-1)*grid_size + j;
%         tower_x = (hexagon_width-hexagon_side_length/2)*(i - 1/2);
%         tower_y = hexagon_height*(j - 1/2*mod(i,2));
%         
% %         hexagons(idx).xv = xv+tower_x+center(1) - grid_width/2;
% %         hexagons(idx).yv = yv+tower_y+center(2) - grid_height/2;
% %         hexagons(idx).active = 1;
%         hexagons(idx).center_x = tower_x+center(1) - grid_width/2; %hexagons(idx).center(1);
%         hexagons(idx).center_y = tower_y+center(2) - grid_height/2; %hexagons(idx).center(2);
% %         hexagons(idx).power = 1;
%     end
% end



end