%% MyMainScript
% clear;
% close all;
tic;
%% Grass 
%%% stdh = 0.01109 (RSMD 0.092);
%%% stdh = 0.01215 (RSMD 0.09185) 
%%% stdh = 0.0135 RSMD(0.0922)
% 
% imageOrig=mat2gray(imread('../data/grass.png'));
% load('../data/grassNoisy.mat');
% 
% i_mx = max(max(imageOrig));
% i_mn = min(min(imageOrig));
% [M,N] = size(imageOrig);
% std = 0.05*(i_mx-i_mn);
% 
% imageCorrupt = imgCorrupt;
% my_display(imageOrig,'original');
% my_display(imageCorrupt,'corrupted');
% 
% stdh=150;
% stdx=3;
% W=4;
% 
% for i=1:2*W+1
%     for j=1:2*W+1
%         G(i,j)=exp((-(i-W-1)*(i-W-1)-(j-W-1)*(j-W-1))/(W*W/9.0));
%     end
% end
% my_display(G,'Gaussian mask');
% 
% 
% stdh=0.011;
%         tic
%         I = myPatchBasedFiltering(imageCorrupt,9,stdh,25);
%         RSMD1=sqrt(sum(sum((imageOrig-I).*(imageOrig-I)))/(M*N));
%         RSMD2=sqrt(sum(sum((imageOrig-imageCorrupt).*(imageOrig-imageCorrupt)))/(M*N));
%         title=strcat('filtered ',' stdh=',num2str(stdh),' RSMD=',num2str(RSMD1),'.png');
%         my_display(I,title);
%         title
%         toc;
% 
% % 
% % toc;
% 
% %% HoneyComb
% %%% stdh = 0.011 (RSMD 0.0737);
% %%% stdh = 0.01215 (RSMD 0.07374);
% %%% stdh = 0.0135 RSMD(0.07422);
% 
% clear;
% 
% imageOrig=mat2gray(imread('../data/honeyCombReal.png'));
% load('../data/honeyCombReal_Noisy.mat');
% 
% i_mx = max(max(imageOrig));
% i_mn = min(min(imageOrig));
% [M,N] = size(imageOrig);
% std = 0.05*(i_mx-i_mn);
% 
% imageCorrupt = imgCorrupt;
% my_display(imageOrig,'original');
% my_display(imageCorrupt,'corrupted');
% 
% W=4;
% 
% for i=1:2*W+1
%     for j=1:2*W+1
%         G(i,j)=exp((-(i-W-1)*(i-W-1)-(j-W-1)*(j-W-1))/(W*W/9.0));
%     end
% end
% my_display(G,'Gaussian mask');
% 
% 
% 
% stdh=0.01215;
%         tic
%         I = myPatchBasedFiltering(imageCorrupt,9,stdh,25);
%         RSMD1=sqrt(sum(sum((imageOrig-I).*(imageOrig-I)))/(M*N));
%         RSMD2=sqrt(sum(sum((imageOrig-imageCorrupt).*(imageOrig-imageCorrupt)))/(M*N));
%         title=strcat('filtered ',' stdh=',num2str(stdh),' RSMD=',num2str(RSMD1),'.png');
%         my_display(I,title);
%         title
%         toc;

        
%% Barbara
%%% stdh = 0.011 (RSMD 0.0737);
%%% stdh = 0.01215 (RSMD 0.07374);
%%% stdh = 0.0135 RSMD(0.07422);

% clear;
load('../data/barbara.mat');
[M,N] = size(imageOrig);
imageOrig1=imgaussfilt(mat2gray(imageOrig),0.66);
imageOrig1=imageOrig1(1:2:M,1:2:N);

i_mx = max(max(imageOrig1));
i_mn = min(min(imageOrig1));
[M,N] = size(imageOrig1);
std = 0.05*(i_mx-i_mn);

imageCorrupt = imageOrig1+std*randn(M,N);
my_display(imageOrig1,'original');
my_display(imageCorrupt,'corrupted');

W=4;

for i=1:2*W+1
    for j=1:2*W+1
        G(i,j)=exp((-(i-W-1)*(i-W-1)-(j-W-1)*(j-W-1))/(W*W/9.0));
    end
end
my_display(G,'Gaussian mask');



stdh=0.01215;
        tic
        I = myPatchBasedFiltering(imageCorrupt,9,stdh,25);
        RSMD1=sqrt(sum(sum((imageOrig1-I).*(imageOrig1-I)))/(M*N));
        RSMD2=sqrt(sum(sum((imageOrig1-imageCorrupt).*(imageOrig1-imageCorrupt)))/(M*N));
        title=strcat('filtered ',' stdh=',num2str(stdh),' RSMD=',num2str(RSMD1),'.png');
        my_display(I,title);
        title
        toc; 
%% end
toc;


