function res = myPCADenoising2(im1,sigma)

[M,N] = size(im1);

P = double(zeros(7*7,(31-6)*(31-6)));
box = double(zeros(31,31));
alpha_j = double(zeros(49,1));
T = double(zeros(7*7,200));
res = double(zeros(M,N));

X = 0;
Y = 0;


for i=1:M-6
    X = min(X+1,M-30);
    Y=0;
    for j=1:N-6
        Y=min(Y+1,N-30);
        x = min(max(1,i-15),X);
        y = min(max(1,j-15),Y);
        box = im1(x:x+30,y:y+30);
        patch = im1(i:i+6,j:j+6);
        patch = patch(:);
        
        
        P = im2col(box, [7 7], 'sliding');
        
        [IDX, D] = knnsearch(P', patch' , 'k', 200,'Distance','euclidean');
        P1 = (P(:,IDX)); 
        Q = P1*P1';
        [R,S] = eig(Q);
        
        T(:,:) = R'*P1(:,:);
        
        for t=1:49
            alpha_j(t) = max(0,((((T(t,:)*T(t,:)')/(200)) - (sigma*sigma))));
            alpha_j(t) = 1+ (sigma*sigma)/alpha_j(t);
        end;
        
        patch_n = R'*patch;
        patch_n = patch_n./alpha_j;
        patch = R * patch_n;
        
        res(i:i+6,j:j+6) = res(i:i+6,j:j+6) + reshape(patch,7,7);

    end;
end;


for i=1:M
    for j=1:N
        res(i,j) = res(i,j)/(min(7,min(i,M-i+1))*min(7,min(j,N-j+1)));
    end;
end;
