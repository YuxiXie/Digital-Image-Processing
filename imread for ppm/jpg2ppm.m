% 读取并显示.jpg图像'greens.jpg' %
raw_image = imread('greens.jpg');
figure(1);
i1 = imshow(raw_image);
title('greens.jpg');
impixelinfo;
% 将.jpg图像'greens.jpg'转为.ppm格式的图像'greens.ppm' %
imwrite(raw_image, 'greens.ppm', 'ppm');
% 读取并显示.ppm图像'greens.ppm' %
my_image = imread('greens.ppm');
figure(2);
i2 = imshow(my_image);
title('greens.ppm');
impixelinfo;

