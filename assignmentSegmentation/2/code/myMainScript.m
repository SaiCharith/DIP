%% MyMainScript
close all;
clear;
tic;
%% Mean Shift Segmantation for baboonColor
%%% Tuned Sigma_Spatial = 8
%%% Tuned Sigma_Intensity = 0.16 (equivalent to 41 in 0-255 intensity space)
%%% NumberofNeighbours Considered = 100
%%% Number of Iterations = 20

img_raw = imread('../data/baboonColor.png');
img_smooth = imgaussfilt(mat2gray(img_raw),1);

[M,N,C] = size(img_smooth); 
img = img_smooth(1:2:M,1:2:N,:);

my_display(img,'orig.png');


noOfNeighbours=200;

sigma_S = 8;
sigma_I = 0.16;

max_iter = 20;
t=1;
res= myMeanShiftSegmentation(img,t,sigma_I,sigma_S,max_iter,noOfNeighbours);
my_display(res(:,:,1:3),'Segemnted imgae');
%% end
toc;
