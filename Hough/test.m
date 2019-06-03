% read image
raw_img = imread('tape.png');
raw_img = rgb2gray(raw_img);

% translate to binary image
b_img = edge(raw_img, 'sobel');
imshow(raw_img);
hold on;

% get circles' parameters (a, b, r) by hough transform
parameters = my_imfindcircles(b_img, 0.5, 5);
% draw the circles
for i = 1 : size(parameters, 1)
    a = parameters(i, 1);
    b = parameters(i, 2);
    r = parameters(i, 3);
    X = [-r:0 0:r];
    Y = round(r^2 - X.^2).^0.5;
    plot(Y + b, X + a, 'Color', 'r', 'LineWidth', 0.8);
    plot(b - Y, X + a, 'Color', 'r', 'LineWidth', 0.8);
end

