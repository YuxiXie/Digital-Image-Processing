% sty_img: matrix of stylized image
% raw_img: image matrix of the raw one
% level: degree of style change (from 0 to 100)
function sty_img = emboss(raw_img, level)
    sty_img = rgb2gray(raw_img);
    level = (100 - level) / 10;
    % function1: horizontal filter
    hh = [-1, -level, -1; 0, 0, 0; 1, level, 1];
    sty_img = filter2(hh, sty_img);
    % function2: vertical filter
    vh = [1, 0, -1; level, 0, -level; 1, 0, -1];
    sty_img = filter2(vh, sty_img);
    % function3: adjusr brightness
    sty_img = imadjust(sty_img, [0, 1], [0.2, 1], 1.5);
    % function4: contrast stretching transformation
    sty_img = 1 ./ (1 + (mean2(sty_img) ./ (double(sty_img))) .^ 4);  