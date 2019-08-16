%% MyMainScript
clear all;
clc;
close all;
tic;
%% Your code here
A=zeros(300,300);
A(50:100,50:120)=255;

B=zeros(300,300);
B(50-30:100-30,50+70:120+70)=255;


A1=fft2(A);
B1=fft2(B);

X=(A1.*(conj(B1)))./(abs(A1).*abs(B1));
X(isnan(X))=0;


Y=ifft2(X);
y=log(1+abs(X))*255;
figure(),
imshow(mat2gray(Y)),
title('without noise')


[~,col1]=max(max(Y));
[~,row1]=max(Y);
row1=row1(col1);

row1 %corresponds to the -30 shift in original image across rows
col1 %corresponns to the 70 shift in original image across columns

A=A+(20*randn(300));
B=B+(20*randn(300));



A2=fft2(A);
B2=fft2(B);

X=(A2.*(conj(B2)))./(abs(A2).*abs(B2));
X(isnan(X))=0;


Y=ifft2(X);
y=log(1+abs(X))*255;
figure(),
imshow(mat2gray(Y)),
title('with noise')

[~,col2]=max(max(Y));  
[~,row2]=max(Y);
row2=row2(col2); 

% O(N*N) using fourier domain approach in calculating cross-power spectrum

% The same done via pixel comparision takes O(N*N*N*N) as image needs to be
% shifted in N*N pixels and then calculate RMSD in O(N*N) and take the min




toc;
