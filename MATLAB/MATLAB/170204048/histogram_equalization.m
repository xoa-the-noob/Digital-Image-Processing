I = imread('cameraman.png');
[row, col]= size(I);
E = uint8(ones(row, col));

grayLevels= zeros(1,256);
noOfPixels = zeros(1,256);
noOfPixels2 = zeros(1,256);
pdf = zeros(1,256);
cdf = zeros(1,256);
rounded = zeros(1,256);

for i = 1:row
    for j=1:col
        temp=I(i,j)+1;
        noOfPixels(temp) = noOfPixels(temp)+1;		
    end
end

pdf = noOfPixels/sum(noOfPixels(:));
cdf(1) = pdf(1);
for i = 2:256
    cdf(i) = pdf(i) + cdf(i-1);
end

rounded = round(255*cdf);

for i = 1:row
    for j=1:col
        temp = I(i,j)+1;
        E(i,j) = rounded(temp);		
    end
end

for i = 1:row
    for j=1:col
        temp=E(i,j)+1;
        noOfPixels2(temp) = noOfPixels2(temp)+1;		
    end
end
figure,title("Original Image");
imshow(I);
figure,title("Equalized Image");
imshow(E);
figure,title("Original Histogram");
bar(noOfPixels);
figure,title("Equalized Histogram");
bar(noOfPixels2);