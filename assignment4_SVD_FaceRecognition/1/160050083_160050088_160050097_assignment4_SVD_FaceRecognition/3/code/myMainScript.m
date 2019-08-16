%% MyMainScript
clear all;
clc;
tic;

%% Stranger Detection

% In the first problem we assumed all test images belong to people in
% training set hence we found out the closest neghbour in eigen subspace. 
% Even if the image belonged to stranger it would find the closest match
% Here we are thresholding the closest match and only if the closest match
% is less than the threshold we recognize else we identify the person as a
% stranger

% If the person does not belong to people in training set then his image is
% not likely to match with any traing image (in eigen subspace) 


%% Your code here


% repmat([1,2],2,1)
% norm([3,4]')
recognize('../../att_faces/',[170],32,6,4,8,4,3800);

%% time
toc;