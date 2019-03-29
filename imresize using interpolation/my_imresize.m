% resize_image: output of my_imresize() -- scaled image
% raw_image: input of my_resize(), the raw image matrix of input image
% scale: how to resize the image
% mode: 'n' for nearest or 'b' for bilinear
function resize_image = my_imresize(raw_image, scale, mode, fmp)
    % get the size of input raw image
    [width, height, slice] = size(raw_image); 
    % calculate the size of output image
    w = round((width-1) * scale);
    h = round((height-1) * scale);
    % calculate the location of interplotted node
    delta = 1/scale;
    W = (1:delta:width)';
    H = (1:delta:height)';
    % initialize the output image
    if (fmp == 'tif')
        resize_image = zeros(w, h, slice);
    else
        resize_image = zeros(w, h, slice, 'uint8');
    end
    % get the output image using 2 kinds of methods
    for k = 1:slice
        for i = 1:w
            x = round(W(i));
            for j = 1:h
                y = round(H(j));
                % use the method of Nearest Neighbor Resampling
                if mode == 'n'
                    resize_image(i, j, k) = raw_image(x, y, k);
                % use the method of Bilinear Interpolation
                else if mode == 'b'
                       m = floor(W(i)); n = floor(H(j));
                        M = m + 1; N = n + 1;
                        a = W(i) - m; b = H(j) - n;
                        if m == W(i)
                            M = W(i);
                            a = 0.5;
                        end
                        if n == H(j)
                            N = H(j);
                            b = 0.5;
                        end
                        X00 = raw_image(m, n, k);
                        X01 = raw_image(m, N, k);
                        X10 = raw_image(M, n, k);
                        X11 = raw_image(M, N, k);
                        resize_image(i, j, k) = (1-a) * (1-b) * X00 + (1-a) * b * X01 + a * (1-b) * X10 + a * b * X11;
                    end
                end
            end
        end
    end
        
        