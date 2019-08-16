%% MyMainScript

tic;
%% Low Pass Filter
% Low Pass filter generates a pattern on the filtered image while Gaussian
% filter does not 
%
% Also Gaussian filter blurrs more with same sigma
%
% With increase in sigma the blurr is increased
A = imread('../data/barbara256.png');
my_display(A,'Original Image');

O = A;

[m,n] = size(A);
A = padarray(A,[m/2,n/2]);
A_f = fftshift(fft2(A)); % use in filters

% displaying the images in the functions itself for simplicity
D = [40,80];
 lowpass(A_f,D(1),m,n);
 lowpass(A_f,D(2),m,n);
 
%% Gaussian Filter

sig = [40,80];
gaussian_filter(A_f,sig(1),m,n);
gaussian_filter(A_f,sig(2),m,n);


colormap (gray);
colorbar;



toc;
