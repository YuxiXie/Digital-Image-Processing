% sty_img: matrix of stylized image
% raw_img: image matrix of the raw one
% degree: degree of style change (from 0 to 100)
function sty_img = painting(raw_img, degree)
    % set the level of pixel value of oil paiting
    % smaller than 255
    level = 100;
    % set the oil style transformation radius
    r = int32(degree / 20);
    % get ready for data
    raw_img = uint16(raw_img);
    img_size = size(raw_img);
    height = img_size(1);
    width = img_size(2);
    sty_img = zeros(height, width, 3);
    % define the pixel at each position 
    % according to its neighbor area with the transformation radius
    for h = 1:height
        for w = 1:width
            % get ready for cache place
            intensity_cnt = uint16(zeros(level, 1));
            R = uint16(zeros(level,1));
            G = uint16(zeros(level,1));
            B = uint16(zeros(level,1));
            % get the intenssity of pixel value by counting
            for i = (h - r):(h + r)
                for j = (w - r):(w + r)
                    if i > 0 && j > 0 && i <= height && j <= width
                        % get the nonzero pixel value 
                        % in the scale of level set at the beginning
                        intensity = (raw_img(i, j, 1) + raw_img(i, j, 2) + raw_img(i, j, 3)) / 3 * level / 255;
                        % update cache data ( counting )
                        if intensity < 1
                            intensity = 1;
                        end
                        intensity_cnt(intensity) = intensity_cnt(intensity) + 1;
                        R(intensity) = R(intensity) + raw_img(i, j, 1);
                        G(intensity) = G(intensity) + raw_img(i, j, 2);
                        B(intensity) = B(intensity) + raw_img(i, j, 3);
                    end
                end
            end
            % get the most intense pixel value
            intensity_max = max(intensity_cnt);
            for i = 1:level
                if intensity_cnt(i) == intensity_max
                    index = i;
                end
            end
            % set the pixel value for oil image
            % in the scale level of pixel value of real image
            sty_img(h, w, 1) = R(index) / intensity_max;
            sty_img(h, w, 2) = G(index) / intensity_max;
            sty_img(h, w, 3) = B(index) / intensity_max;
        end
    end
    sty_img = uint8(sty_img);