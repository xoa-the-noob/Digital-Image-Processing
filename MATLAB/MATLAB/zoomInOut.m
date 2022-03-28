I = imread('cameraman.png');
I = im2gray(I);
[m,n] = size(I);
in = uint8(ones(row*2, col*2));
out = uint8(ones(row/2, col/2));
for i = 1:2*m
    for j = 1:2*n
        p = i - floor(i/2);
        q = j - floor(j/2);
        in(i,j) = I(p,q);
    end
end
figure;
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(in);
for i = 1:m/8
    for j = 1:n/4
        p = i - floor(i/2);
        q = j - floor(j/2);
        out(i,j) = I(p,q);
    end
end

M = imresize(I,.0005,"Antialiasing",false);

subplot(2,2,3);
imshow(I);
subplot(2,2,4);
imshow(M);