%% MyMainScript
clear all;
clc;
tic;
%% ORL database


recognize('../../att_faces/',[1, 2, 3, 5, 10, 15, 20, 30, 50, 75, 100, 150, 170],32,6,4);

%% Yale Database

recogyale('../../CroppedYale/',[1, 2, 3, 5, 10, 15, 20, 30, 50, 60, 65, 75, 100, 200, 300, 500, 1000],38,40,24);


toc;

    
