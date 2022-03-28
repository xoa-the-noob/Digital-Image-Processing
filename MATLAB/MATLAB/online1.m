I = imread('C:\Users\lrlem\Downloads\MATLAB\lemon1.jpg'); 
subplot(2,2,1) 
imshow(I)
title 'original image' 
% Flip left/right: 
Ir = flip(I,2); 
subplot(2,2,2) 
imshow(Ir)
title 'flipped image'
% Join the original and flipped images: 
IIr = horzcat(I,Ir); 
subplot(2,2,3:4) 
imshow(IIr)
title 'joined images'