image1 = imread('f1.png');
image2 = imread('f2.png');
image3 = imread('f3.png');
image4 = imread('f4.png');
image5 = imread('f5.png');

I0 = {image1,image2,image3,image4,image5};
size = [1 5];
I1 = cell(size);I2 = cell(size); I3 = cell(size); I4 = cell(size); I5 = cell(size); 
hfig = figure;

for i = 1:5
    I1{i} = rgb2gray(I0{i});
    I1{i} = imbinarize(I1{i});
    se = strel('disk',40);
    I2{i} = imerode(I1{i},se);
    I3{i} = imdilate(I2{i},se);
    I4{i} = I1{i}-I3{i};
    I5{i} = bwareaopen(I4{i},212);
    [a b]=bwlabel(I5{i});
    %b = 10;
    subplot(5,5,i+0+4*(i-1));
    imshow(I0{i});
    if i == 1
        title('Original Image'); 
    end
    subplot(5,5,i+1+4*(i-1));
    imshow(I1{i});
    if i == 1
        title('Binary Image'); 
    end
    subplot(5,5,i+2+4*(i-1));
    imshow(I3{i});
    if i == 1
        title('Palm'); 
    end
    subplot(5,5,i+3+4*(i-1));
    imshow(I4{i});
    if i == 1
        title('Fingers(Noisy)'); 
    end
    subplot(5,5,i+4+4*(i-1));
    imshow(I5{i});
    if i == 1
        title('Fingers(Noiseless)'); 
    end
    caption = sprintf('Number of finger\n%.0f', b); 
    xlabel(caption, 'FontSize', 6,'Position',[1200 1]);   
end
print(hfig);
%print(hfig, '-djpeg', 'myfigure')


