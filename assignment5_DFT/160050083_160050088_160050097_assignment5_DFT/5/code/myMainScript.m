%% MyMainScript

tic;
%% Part 1

im = imread('../data/barbara256.png');
im= double(im);
im1 = double(im) + randn(size(im))*20;


my_display(im,'original image');
 
 
my_display(im1,'corrupted image');


im2 = myPCADenoising1(im1,20);
my_display(im2,'Denoised using myPCADenoising1');
display('RSME of gaussian corrupted');
sqrt(sum(sum((im-im1).*(im-im1)))/sum(sum((im).*(im))))
display('RSME of denoised image using myPCADenoising1');
sqrt(sum(sum((im-im2).*(im-im2)))/sum(sum((im).*(im))))
%% Part 2

im3 = myPCADenoising2(im1,20);
my_display(im3,'Denoised using myPCADenoising2');
display('RSME of denoised image using myPCADenoising2');
sqrt(sum(sum((im-im3).*(im-im3)))/sum(sum((im).*(im))))

%% Part 3
% PCADenoising out performs Bilateral Filtering here
% From RMSE values we see that myPCADenoising2 is better than
% myPCADenoising2 and myPCADenoising2 is better than Bilatreral Filter
% The denoised image from bilateral looks patchy and noisy compared to PCADenoising
% Biletaeral did a better job than myPCADenoising1 in smooth regions

im4 = myBilateralFiltering(im1,1.9,50);

my_display(im4,'Denoised using Bilateral');
display('RSME of denoised image using Bilateral');
sqrt(sum(sum((im-im4).*(im-im4)))/sum(sum((im).*(im))))

%% Part 4
% The image recovry is better in first case as the signal strength is more and
% as sqrt(J) resembles Gaussian distribution better in first case than second as 
% Anscombe transform for Poisson noise is valid for high sqrt(I).
im5 = poissrnd(im);
my_display(im5,'Corrupted with poisson');
display('RSME of Poission corrupted image');
sqrt(sum(sum((im-im5).*(im-im5)))/sum(sum((im).*(im))))
im6 = myPCADenoising2(sqrt(im5),0.5);
im6 = im6.*im6;
my_display(im6,'Denoised using myPCADenoising2 with sqrt');
display('RSME of Poission denoised image');
sqrt(sum(sum((im-im6).*(im-im6)))/sum(sum((im).*(im))))
im7 = poissrnd(im/20);
display('RSME of lower exposure image');
sqrt(sum(sum((im-im7*20).*(im-im7*20)))/sum(sum((im).*(im))))
my_display(im7*20,'Corrupted with poisson/20 ');
im8 = myPCADenoising2(sqrt(im7),0.5);
im8 = 20*im8.*im8;
my_display(im8,'Denoised using myPCADenoising2 with sqrt lower exposure');
display('RSME of Poission denoised image');
sqrt(sum(sum((im-im8).*(im-im8)))/sum(sum((im).*(im))))

%% end
toc;
