I = imread('cameraman.png');
[row, col]= size(I);

A = double(min(I(:)));
B = double(max(I(:))); 
D = double(B-A);

M = double(2^8-1);

I = im2double(I);
R = double(zeros(row, col));

MbyD = double(M/D)
for i = 1:row
    for j=1:col
        R(i,j) = double(double((I(i,j)-A)*MbyD) + A);		
    end
end
figure;
imshow(I);
figure;
imshow(R);

I = uint8(255 * I);
R = uint8(255 * R);

Ihist = zeros(1,256);
Rhist = zeros(1,256);

for i = 1:row
    for j=1:col
        temp1=I(i,j)+1;
        Ihist(temp1) = Ihist(temp1)+1;	
        temp2=R(i,j)+1;
        Rhist(temp2) = Rhist(temp2)+1;			
    end
end

figure;
bar(Ihist);
figure;
bar(Rhist);