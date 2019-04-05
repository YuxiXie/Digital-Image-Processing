% sty_img: matrix of stylized image
% raw_img: image matrix of the raw one
% level: degree of style change (from 0 to 100)
function sty_img = atomization(raw_img, level)
    % define the multidimension filter
    r = level + 0.1;
    h = fspecial('disk', r);
    % atomize the image
    sty_img = imfilter(raw_img, h, 'replicate'); 
    
    