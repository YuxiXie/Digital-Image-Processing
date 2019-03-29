% read jpg
jpg = imread('football.jpg');
% read tiff
[T, map] = imread('kids.tiff');
tiff = ind2rgb(T, map);

% test the method of Nearest Neighbor Resampling
jpg_small = my_imresize(jpg, 0.7, 'n', 'jpg');
figure(1);
imshow(jpg_small);
impixelinfo;
title('smaller jpg using nearest method');
jpg_big = my_imresize(jpg, 2.6, 'n', 'jpg');
figure(2);
imshow(jpg_big);
impixelinfo;
title('bigger jpg using nearest method');
tiff_small = my_imresize(tiff, 0.4, 'n', 'tif');
figure(3);
imshow(tiff_small);
impixelinfo;
title('smaller tiff using nearest method');
tiff_big = my_imresize(tiff, 1.3, 'n', 'tif');
figure(4);
imshow(tiff_big);
impixelinfo;
title('bigger tiff using nearest method');

% test the method of Bilinear Interpolation
jpg_small = my_imresize(jpg, 0.7, 'b', 'jpg');
figure(5);
imshow(jpg_small);
impixelinfo;
title('smaller jpg using bilinear method');
jpg_big = my_imresize(jpg, 2.6, 'b', 'jpg');
figure(6);
imshow(jpg_big);
impixelinfo;
title('bigger jpg using bilinear method');
tiff_small = my_imresize(tiff, 0.4, 'b', 'tif');
figure(7);
imshow(tiff_small);
impixelinfo;
title('smaller tiff using bilinear method');
tiff_big = my_imresize(tiff, 1.3, 'b', 'tif');
figure(8);
imshow(tiff_big);
impixelinfo;
title('bigger tiff using bilinear method');