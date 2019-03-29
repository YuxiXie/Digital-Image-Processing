% my_image: output of my_imread()
% filename: input of my_read(), the name of .ppm file
function my_image = imread_ppm(filename)
    % open the target file in binary mode
    fppm = fopen(filename, 'rb');
    % get the head of the target file
    head = strip(fgetl(fppm));
    head = split(head);
    ptype = head(1);
    ptype = ptype{1, 1};
    column = head(2);
    column = str2num(column{1, 1});
    row = head(3);
    row = str2num(row{1, 1});
    maxpixel = head(4);
    maxpixel = maxpixel{1, 1};
    % switch(ptype)
    if ptype == 'P6'
        % ppm in binary mode
        for i = 1:row
            for j = 1:column
                for k = 1:3
                    node = fread(fppm, 1, 'uint8');
                    my_image(i, j, k) = uint8(node);
                end
            end
        end
    else if ptype == 'P3'
            % ppm in ASCII mode
            % get the data of the target file
            cnt = 1;
            while (~feof(fppm))
                data = strip(fgetl(fppm));
                data = split(data);
                len = length(data);
                for d = 1:len
                    k = mod(cnt-1, 3) + 1;
                    j = mod((cnt-k)/3, column) + 1;
                    i = mod(((cnt-k)/3-j+1)/column, row) + 1;
                    node = data(d);
                    node = str2num(node{1,1});
                    my_image(i, j, k) = uint8(node);
                    cnt = cnt + 1;
                end
            end
        end
    end
        
        
        
      
    
    