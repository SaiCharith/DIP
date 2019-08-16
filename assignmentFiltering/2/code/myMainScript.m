%% MyMainScript

tic;
%% Barbara

load('../data/barbara.mat');
size(imageOrig)
size(imageOrig)
% img=imageOrig+
my_display(imageOrig,'original');
i_mx = max(max(imageOrig));
i_mn = min(min(imageOrig));
[M,N] = size(imageOrig);
std = 0.05*(i_mx-i_mn);
imageCorrupt = imageOrig + (randn(M,N)*std);

my_display(imageCorrupt,'corrupted');

stdi=13;
stdx=2.1;
W=floor(3*stdx);
G=0;
for i=1:2*W+1
    for j=1:2*W+1
        G(i,j)=exp((-(i-W-1)*(i-W-1)-(j-W-1)*(j-W-1))/(stdx*stdx));
    end
end
my_display(G,'Gaussian mask');
%%% optimal values std_x=2.1,std_i=14

tic;
I = myBilateralFiltering(imageCorrupt,stdx,stdi);
RSMD1=sqrt(sum(sum((imageOrig-I).*(imageOrig-I)))/(M*N));
title=strcat('filtered stdx=',num2str(stdx),' stdi=',num2str(stdi),' RSMD=',num2str(RSMD1));
my_display(I,title);

toc;

tic;
I = myBilateralFiltering(imageCorrupt,stdx*0.9,stdi);
RSMD1=sqrt(sum(sum((imageOrig-I).*(imageOrig-I)))/(M*N));
title=strcat('filtered stdx=',num2str(stdx*0.9),' stdi=',num2str(stdi),' RSMD=',num2str(RSMD1));
my_display(I,title);


toc;

tic;
I = myBilateralFiltering(imageCorrupt,stdx*1.1,stdi);
RSMD1=sqrt(sum(sum((imageOrig-I).*(imageOrig-I)))/(M*N));
title=strcat('filtered stdx=',num2str(stdx*1.1),' stdi=',num2str(stdi),' RSMD=',num2str(RSMD1));
my_display(I,title);

toc;

tic;
I = myBilateralFiltering(imageCorrupt,stdx,stdi*0.9);
RSMD1=sqrt(sum(sum((imageOrig-I).*(imageOrig-I)))/(M*N));
title=strcat('filtered stdx=',num2str(stdx),' stdi=',num2str(stdi*0.9),' RSMD=',num2str(RSMD1));
my_display(I,title);

toc;

tic;
I = myBilateralFiltering(imageCorrupt,stdx,stdi*0.9);
RSMD1=sqrt(sum(sum((imageOrig-I).*(imageOrig-I)))/(M*N));
title=strcat('filtered stdx=',num2str(stdx),' stdi=',num2str(stdi*1.1),' RSMD=',num2str(RSMD1));
my_display(I,title);

toc;

toc;

%% Grass

% load('../data/grassNoisy.mat');
% 
% my_display(imgCorrupt,'original');
% I = myBilateralFiltering(imgCorrupt,3,10);
% 
% my_display(I,'filtered');
% res=sqrt(sum(sum((imgCorrupt-I).*(imgCorrupt-I))))/256.0
% toc;

%% HoneyComb

