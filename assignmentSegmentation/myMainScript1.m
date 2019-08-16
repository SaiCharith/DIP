%% MyMainScript

tic;
%% Your code here

img_raw = imread('../data/baboonColor.png');
img_smooth = imgaussfilt(mat2gray(img_raw),1);

[M,N,C] = size(img_smooth); 
img = img_smooth(1:2:M,1:2:N,:);

my_display(img,'orig.png');
% res = myMeanShiftSegmentation(img,0.1,2,3,20);

noOfNeighbours=100;

sigma_S = [4,8,16,20];
    sigma_I = [0.03,0.06,0.09,0.12,0.15,0.2,0.25];
    
    max_iter = [20];
    t=1;
    for i = 1:size(sigma_S,2)
        for j = 1:size(sigma_I,2)
            for k = 1:size(max_iter,2)
                tic;
                res= myMeanShiftSegmentation(img,t,sigma_I(j),sigma_S(i),max_iter(k),noOfNeighbours);
%                 
                my_display(res(:,:,1:3),strcat('img s_x=',num2str(sigma_S(i)),' s_I=',num2str(sigma_I(j)),' iter=',num2str(max_iter(k)),'.png'));
               
                toc;
            end
          
        end
    end



toc;
