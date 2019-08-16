function res = myPCADenoising1(im1,sigma)

[M,N] = size(im1);

P = double(zeros(7*7,(M-6)*(N-6)));
T = double(zeros(7*7,(M-6)*(N-6)));
U = double(zeros(7*7,(M-6)*(N-6)));
res = double(zeros(M,N));

for i=1:M-6
    for j=1:N-6
        P(:,(i-1)*(N-6)+j) = reshape(im1(i:i+6,j:j+6),49,1);
    end;
end;

Q = P*P';
[R,S] = eig(Q);

for i=1:M-6
    for j=1:N-6
        T(:,(i-1)*(N-6)+j) = R'*P(:,(i-1)*(N-6)+j);
    end;
end;
alpha_j = double(reshape(zeros(7*7,1),49,1));
for j=1:49
    alpha_j(j) = max(0,((((T(j,:)*T(j,:)')/((N-6)*(M-6))) - (sigma*sigma))));
    alpha_j(j) = 1+ (sigma*sigma)/alpha_j(j);
end;


for i=1:(M-6)*(N-6)
    U(:,i) = R*((T(:,i))./alpha_j);
    
end;

for i=1:M-6
    for j=1:N-6
        res(i:i+6,j:j+6) = res(i:i+6,j:j+6) + reshape(U(:,(i-1)*(N-6)+j),7,7);              
    end;
end;


for i=1:M
    for j=1:N
        res(i,j) = res(i,j)/(min(7,min(i,M-i+1))*min(7,min(j,N-j+1)));
    end;
end;
% res = im1;


