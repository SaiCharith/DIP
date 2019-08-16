function I  = myHarrisCornerDetector(im,sgs,sgw,k)

G1 = fspecial('gaussian', [3*sgs 3*sgs] ,sgs);
I1 = imfilter(im, G1);

[x,y] = gradient(I1);

imshow(mat2gray(x))
title('x-gradient image')

figure
imshow(mat2gray(y))
title('y-gradient image')

xx = x.*x;
xy = x.*y;
yy = y.*y;

G = fspecial('gaussian', [3*sgw 3*sgw] ,sgw);
xx = imfilter(xx, G);
xy = imfilter(xy, G);
yy = imfilter(yy, G);

for i=1:size(I1,1)
    for j=1:size(I1,2)
        z = [xx(i,j),xy(i,j);xy(i,j),yy(i,j)];
        A(i,j) = min(eig(z));
        B(i,j) = max(eig(z));
        C(i,j) = det(z) - k*trace(z)*trace(z);
        if(C(i,j)*100000>1)
            C(i,j) = 1;
        else
            C(i,j) = 0;
        end 
    end  
end


my_display(A,'min Eigen-Valued Image');

my_display(B,'max Eigen-Valued Image');

my_display(C,'Harris Response Image');


I = C;


