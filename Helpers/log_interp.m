function [mid_point] = log_interp(a, low_point, b, c, high_point)
%   [mid_point] = log_interp(a, low_point, b, c, high_point)

% size(a)
% size(b)
% size(c)
% size(low_point)
% size(high_point)

mid_point = exp(   log(low_point) + ( (log(high_point) - log(low_point)) .* ...
    (log(b) - log(a)) ) ./ (log(c) - log(a))   );



end