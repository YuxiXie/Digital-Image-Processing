% ��ȡ����ʾ.jpgͼ��'greens.jpg' %
raw_image = imread('greens.jpg');
figure(1);
i1 = imshow(raw_image);
title('greens.jpg');
impixelinfo;
% ��.jpgͼ��'greens.jpg'תΪ.ppm��ʽ��ͼ��'greens.ppm' %
imwrite(raw_image, 'greens.ppm', 'ppm');
% ��ȡ����ʾ.ppmͼ��'greens.ppm' %
my_image = imread('greens.ppm');
figure(2);
i2 = imshow(my_image);
title('greens.ppm');
impixelinfo;

