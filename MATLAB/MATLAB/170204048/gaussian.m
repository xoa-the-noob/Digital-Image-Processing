I = imread('cameraman.png');
[row, col]= size(I);
prompt = 'Enter the sigma value';
sigma = input(prompt)
filterX = [-1, 0, 1;
           -1, 0, 1;
           -1, 0, 1;
          ];
filterY = [-1, -1, -1;
           0, 0, 0;
           1, 1, 1;
          ];
temp = (filterX.*filterX + filterY.*filterY)/(2*sigma*sigma*-1);
kernel = exp(temp)/(2*pi*sigma*sigma);

I2 = zeros(row,col);
temp2 = zeros(3,3);
temp3 = zeros(3,3);
B = padarray(I,[0 1],0,'both');
B = padarray(B,[1 0],0,'both');

for i = 1:row
    for j = 1:col
        temp2 = B(i:i+2,j:j+2);
        temp2 = double(temp2);
        temp3 = temp2.*kernel;
        temp3 = double(temp3);
        I2(i,j) = sum(temp3(:));
    end
end;

figure(1);
subplot(121);
imshow(I);
title("Original image");
subplot(122);
imshow(I2/255);
title("Blurred image");