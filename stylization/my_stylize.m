% sty_img: matrix of stylized image
%          if any parameter is illegal, return that of raw image
% filename: image file of the raw image
% mode: mode of stylization
%       'skt' for sketch
%       'emb' for emboss
%       'atm' for atomization
%       'ptn' for painting
% level: degree of style change (from 0 to 100)
function sty_img = my_stylize(filename, mode, level)
    % get the image matrix
    raw_img = imread(filename);
    if level < 0 || level > 100
        sty_img = raw_img;
    else
         % get stylized image according to the mode with level
        if mode == 'skt'
            sty_img = sketch(raw_img, level);
        elseif mode == 'emb'
            sty_img = emboss(raw_img, level);
        elseif mode == 'atm'
            sty_img = atomization(raw_img, level);
        elseif mode == 'ptn'
            sty_img = painting(raw_img, level);
        else
            sty_img = raw_img;
        end
    end
   