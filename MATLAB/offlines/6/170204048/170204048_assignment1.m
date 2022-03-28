figure();
I = imread("Image1.jpg");
subplot(2, 4, 1);
imshow(I);

I = im2gray(I);
I = im2double(I);
laplacian_filter = [0 1 0; 1 -4 1; 0 1 0];
I2 = imfilter(I, laplacian_filter);
subplot(2, 4, 2);
imshow(I2,[ ]);


I3 = I - I2;
subplot(2, 4, 3);
imshow(I3);

 gx = [-1 0 1; -2 0 2; -1 0 1];
 gy = [1 2 1; 0 0 0; -1 -2 -1];
 d_dx = imfilter(I, gx);
 d_dy = imfilter(I, gy);
 I4 = sqrt(d_dx .^ 2 + d_dy .^ 2);
 t = 0.5;
 [row, col] = size(I4);
 for i = 1 : row
     for j = 1 : col
         if(I2 < t)
             I2(i, j) = 0;
         end
     end
 end
 subplot(2, 4, 4);
 imshow(I4);
         
avg_filter_mask = ones([5 5]) / 25;
I5 = imfilter(I, avg_filter_mask);
subplot(2, 4, 5);
imshow(I5);

I6 = I3.*I5;
subplot(2, 4, 6);
imshow(I6);

I7= I + I6;
subplot(2, 4, 7);
imshow(I7);

I8 = zeros(row, col);
c=1;
gammaa=2; 
for i = 1:row
    for j = 1:col
        I8(i,j) = c*(I(i,j).^gammaa);
    end
end
subplot(2, 4, 8);
imshow(I8);








