BW = [0 0 0 0 0 0 0;
         0 0 0 0 0 0 0;
         0 0 1 0 1 0 0;
         0 0 1 0 1 0 0;
         0 0 1 1 1 0 0;
         0 0 0 0 0 0 0;
         0 0 0 0 0 0 0];
figure();imshow(BW);
se = strel('disk',1);
BW2 = imdilate(BW,se);
figure();imshow(BW2);

op = BW2 - BW;
figure;imshow(op);