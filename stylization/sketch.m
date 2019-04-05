% sty_img: matrix of stylized image
% raw_img: image matrix of the raw one
% level: degree of brightness (from 0 to 100)
function sty_img = sketch(raw_img, level)
    sty_img = rgb2gray(raw_img);
    % function1: contrast stretching transformation
    sty_img = 1 ./ (1 + (mean2(sty_img) ./ double(sty_img)) .^ 4);
    % function2: histogram equalization
    sty_img = histeq(sty_img, 64);
    % function3: adjust brigtness
    gamma = 0.1 + (100 - level) / 100 * 2;
    sty_img = imadjust(sty_img, [0, 1], [0, 1], gamma);   
    
    