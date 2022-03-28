%I=imread('C:\Users\lrlem\Downloads\MATLAB\lemon.jpg')
I = imread('C:\Users\lrlem\Downloads\MATLAB\lemon.jpg');
figure;
imshow(I);
I=rgb2gray(I);
[row,col]=size(I);
K=uint8(ones(row,col));
for i=1:row
    for j=1:col
        K(j,i)=I(i,j);
    end
end
figure;
imshow(K);

%z=I(:,:,1)
%imshow(z)

