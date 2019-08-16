%% MyMainScript
clear all;
tic;
%% Your code here

A = rand(150,250);

[U1,S1,V1] = MySVD(A);

norm(A-U1*(S1*V1'))

toc;
