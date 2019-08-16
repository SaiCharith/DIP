function reconstruct(path,k,nimages,ntrain,ntest)

Dir=dir(path);
start=3;
Ims={Dir(start:end,1).name};
Impaths=strcat(path,'/',Ims(1:end));

for i=1:nimages
    iDir=dir(char(Impaths(i)));
    for j=1:ntrain
        im= imread(char(strcat(Impaths(i),'/',iDir(2+j).name)));
        rows=size(im,1);
        D((i-1)*ntrain+j,:) = im(:);
    end
end

D=double(D);
M=mean(D);
D = D-repmat(M,size(D,1),1);

% L = D*D';
% [V,ev] = eig(L);
% V=fliplr(V);

[V,~,~] = svd(D,'econ');
V = D'*V;

for i=1:size(V,2)
    V(:,i) = V(:,i)./norm(V(:,i));
end
figure;
for i=1:25
    subplot(5,5,i);
    img=vec2mat(V(:,i),rows);
    imshow(mat2gray(img'));
end


cD(1,:)=V'*D(1,:)';
cD = repmat(cD,size(V,1),1).*V;
cD=cD';


figure;
for i=1:9
    subplot(2,5,i);
    img=M+sum(cD(1:k(i),:));
    img=vec2mat(img,rows);
    imshow(mat2gray(img'));
%     title(strcat(num2str(k(i)),' eigen faces'));
end










