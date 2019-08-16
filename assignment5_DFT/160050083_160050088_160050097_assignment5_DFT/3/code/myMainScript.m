%% MyMainScript

tic;
%% Your code here
o_img = load('../data/image_low_frequency_noise.mat') ;
o_img = o_img.Z ;
[m,n] = size(o_img);
max(max(o_img))
figure;
imshow(o_img,[-1 255]);
title('Original Image');
colormap (gray) ; colorbar ;
size(o_img)
o_img = padarray(o_img,[m/2,n/2]) ;
f_img = fftshift(fft2(o_img)) ;
absf_img = log(abs(f_img) + 1) ;
figure;
imshow(absf_img,[-1 18]);
impixelinfo;
title('Displaying log magnitude of its fourier transform');
colormap (gray) ; colorbar ;

%max(max(absf_img) )

%need to estimate u,v,R from the above displayed image
u = [110,150];
v = [120,140];
R = 75;

final = notch_filter(f_img,u,v,R,m,n) ;
final_img = ifft2(ifftshift(final)) ;
final_img = real(final_img) ; %% neglecting complex values , another option is consider mod
final_img = final_img(m/2+1 : m/2+m, n/2+1 : n/2+n);
size(final_img)
figure;
imshow(final_img,[-1 255]);
title('Image after removing patterns');
colormap (gray) ; colorbar ;

%%fieldnames(o_img)
toc;
