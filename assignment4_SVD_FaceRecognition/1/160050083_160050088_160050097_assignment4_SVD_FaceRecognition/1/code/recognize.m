function s=recognize(path,k,nimages,ntrain,ntest)

Dir=dir(path);
start=4;
Ims={Dir(start:end,1).name};
Impaths=strcat(path,'/',Ims(1:end));

for i=1:nimages
    iDir=dir(char(Impaths(i)));
    for j=1:ntrain
        im= imread(char(strcat(Impaths(i),'/',iDir(2+j).name)));
        D((i-1)*ntrain+j,:) = im(:);
    end
    for j=3+ntrain:size(iDir,1)
        im= imread(char(strcat(Impaths(i),'/',iDir(j).name)));
        T((i-1)*ntest+j-2-ntrain,:) = im(:);
    end
end

D=double(D);
T=double(T);
T = T-repmat(mean(D),size(T,1),1);
D = D-repmat(mean(D),size(D,1),1);


% using eig
% L = D*D';
% [V,ev] = eig(L);
% V=fliplr(V);

[V,~,~] = svd(D,'econ');
V = D'*V;

for i=1:size(V,2)
    V(:,i) = V(:,i)./norm(V(:,i));
end


cD=zeros(size(D,1),size(V,2));
for i=1:size(D,1)
   cD(i,:)=V'*D(i,:)';
end
cT=zeros(size(T,1),size(V,2));
for i=1:size(T,1)
   cT(i,:) = V'*T(i,:)';
end

for kk=1:size(k,2)
    count=0;
    for i=1:ntest*nimages
        for j=1:ntrain*nimages
            nrm(j) = norm(cT(i,1:k(kk))-cD(j,1:k(kk)));
        end
        [val,ind] = min(nrm);
        if(fix((ind-1)/ntrain) == fix((i-1)/ntest))
            count=count+1;
        end
    end
    result(kk)=(count/(ntest*nimages)) *100;
end
figure;
plot(k,result);
title('Accuracy');
xlabel('no. of eigen faces used'); 
ylabel('Recognition rate') ;
