% read image
raw_img = imread('football.jpg');

% stylize to sketch
skt_img = sketch(raw_img, 20);
figure(1);
imshow(skt_img);
impixelinfo;
title('sketch edition - 20% brightness');
skt_img = sketch(raw_img, 80);
figure(2);
imshow(skt_img);
impixelinfo;
title('sketch edition - 80% brightness');

% stylize to emboss
emb_img = emboss(raw_img, 20);
figure(3);
imshow(emb_img);
impixelinfo;
title('emboss edition - 20% level');
emb_img = emboss(raw_img, 80);
figure(4);
imshow(emb_img);
impixelinfo;
title('emboss edition - 80% level');

% stylize to atomization
atm_img = atomization(raw_img, 20);
figure(5);
imshow(atm_img);
impixelinfo;
title('atomization edition - 20% level');
atm_img = atomization(raw_img, 80);
figure(6);
imshow(atm_img);
impixelinfo;
title('atomization edition - 80% level');

% stylize to oil painting
ptn_img = painting(raw_img, 20);
figure(7);
imshow(ptn_img);
impixelinfo;
title('atomization edition - 20% level');
ptn_img = painting(raw_img, 80);
figure(8);
imshow(ptn_img);
impixelinfo;
title('atomization edition - 80% level');

