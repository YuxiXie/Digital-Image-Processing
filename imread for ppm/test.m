% test for P6 part
testA = imread_ppm('greens.ppm');
figure(1);
s1 = imshow(testA);
title('ppm in binary mode');
impixelinfo;
% test for P3 part
imwrite(testA, 'greens1.ppm', 'Encoding', 'ASCII');
testB = imread_ppm('greens1.ppm');
figure(2);
s1 = imshow(testB);
title('ppm in ASCII mode');
impixelinfo;