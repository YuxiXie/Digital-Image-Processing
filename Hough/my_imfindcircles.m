% degree: from 0 to 1 - the least number of points required for a circle
% range: how many pixel-error can be stood for a circle
function parameters = my_imfindcircles(img, degree, range)
    min_radius = 48;
    max_radius = 80;
    step_radius = 1;
    step_angle = 0.02;
    % prepare relevant parameters
    [height,length] = size(img);
    [row, column] = find(img);
    radius_split = round((max_radius - min_radius) / step_radius) + 1;
    angle_split = round(2 * pi / step_angle);
    
    % prepare and get hough space
    hough_space = zeros(height, length, radius_split);
    point_num = size(row, 1);
    
    % hough transform : (x, y) --> (a, b, r)
    % (x - a)^2 + (y - b)^2 = r^2 --> 3-dimension cone
    % a = x - r¡¤cos(theta) ; b = y - r¡¤sin(theta)
    for i = 1 : point_num
        for j = 0 : (radius_split-1)
            for k = 1 : angle_split
                a = round(row(i) - (min_radius + j * step_radius) * cos(k * step_angle));
                b = round(column(i) - (min_radius + j * step_radius) * sin(k * step_angle));
                if a > 0 && a <= height && b > 0 && b <= length
                    hough_space(a, b, j+1) = hough_space(a, b, j+1) + 1;
                end
            end
        end
    end
    
    % get circles
    threshold = max(max(max(hough_space)));
    nodes = find(hough_space >= threshold * degree);
    step = size(nodes, 1);
    circles = zeros(height, length);
    for i = 1 : point_num
        for j = 1 : step
            x = floor(nodes(j) / (height * length)) + 1;
            y = floor((nodes(j) - (x - 1) * (height * length)) / height) + 1;
            z = nodes(j) - (x - 1) * (height * length) - (y - 1) * height;
            r_square = (row(i) - z)^2 + (column(i) - y)^2;
            if r_square < (min_radius + (x - 1) * step_radius)^2 + range && r_square > (min_radius + (x - 1) * step_radius)^2 - range
                circles(row(i), column(i)) = 1;
            end
        end
    end
    
    % return the results
    for i = 1 : step
        x = floor(nodes(i) / (height * length)) + 1;
        y = floor((nodes(i) - (x - 1) * (height * length)) / height) + 1;
        z = nodes(i) - (x - 1) * (height * length) - (y - 1) * height;
        x = min_radius + (x - 1) * step_radius;
        parameters(i, :) = [z, y, x];
    end
    
    
    