%% MyMainScript

tic;
%% Your code here
%%% barbara 0.96 150
%%% tem 0.98 100
%%% canyon 0.99 200
pwd

t=[0.9,0.92,0.94,0.96,0.98,1];
w=[75,100,125,150];
imgs={'TEM.png'};%,'canyon.png','TEM.png'};
size(w)

s=imread(char(strcat('../data/',imgs(1))));
my_display(s,'original');

for i = 1:1:size(imgs,2)
    for j = 1:1:size(w,2)
        for k = 1:1:size(t,2)
            s=imread(char(strcat('../data/',imgs(i))));
            tic;
            s1=myCLAHE(s,w(j),t(k));
            res=strcat('TEM','AHEW_',int2str(w(j)),'T_',num2str(k) );
            toc;
            my_display(s1,res)
        end
    end
end
    


% 
% s=imread('../data/church.png');
% size(s)
% 
% W=200;
% T=0.8;
% tic;
% s1=myCLAHE(s,100,T);
% 
% toc;
% tic;
% s2=myCLAHE(s,W,T);
% 
% 
% toc;
% myNumOfColors = 256;
% myColorScale = zeros(myNumOfColors,3);
% myColorScale(:,1) = 0:1/(myNumOfColors-1):1;% ,[0:1/(myNumOfColors-1):1] ,[0:1/(myNumOfColors-1):1]  ];
% myColorScale(:,2) = 0:1/(myNumOfColors-1):1;
% myColorScale(:,3) = 0:1/(myNumOfColors-1):1;
% %imagesc (single (phantom)); % phantom is a popular test image
% figure();
% image(uint8(s));
% colormap (myColorScale);
% colormap jet;
% daspect ([1 1 1]);
% axis tight;
% colorbar
% figure();
% imshow(mat2gray(s1));
% colormap (myColorScale);
% colormap jet;
% daspect ([1 1 1]);
% axis tight;
% colorbar
% figure();
% imshow(mat2gray(s));
% colormap (myColorScale);
% colormap jet;
% daspect ([1 1 1]);
% axis tight;
% colorbar

toc;


