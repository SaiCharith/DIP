%% MyMainScript
close all;
tic;
%% Your code here
im = load('../data/boat');
im = im.imageOrig;
im = mat2gray(im);

sigmas = 1;
sigmaw = 2;
k = 0.04;

% sigma for smoothing = 1
% sigma for weights in harris matrix = 2
% K = 0.04 empirical constant in corner-measure

I = myHarrisCornerDetector(im,sigmas,sigmaw,k);

toc;