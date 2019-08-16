function recognize(path,k,nimages,ntrain,ntest,nout,ntest_out,threshold)
Dir=dir(path);
Ims={Dir(4:end,1).name};
Impaths=strcat(path,'/',Ims(1:end));

for i=1:nimages
    iDir=dir(char(Impaths(i)));
    for j=1:ntrain
        im= imread(char(strcat(Impaths(i),'/',iDir(2+j).name)));
        D((i-1)*ntrain+j,:) = im(:);
    end
    for j=1:ntest
        im= imread(char(strcat(Impaths(i),'/',iDir(2+j+ntrain).name)));
        T((i-1)*ntest+j,:) = im(:);
    end

end

for i=1:nout
    for j=1:ntest_out
        im= imread(char(strcat(Impaths(i),'/',iDir(2+j).name)));
        T_Out((i-1)*ntest_out+j,:) = im(:);
    end
end
    


D=double(D);
T=double(T);
T_Out=double(T_Out);
T = T-repmat(mean(D),size(T,1),1);
D = D-repmat(mean(D),size(D,1),1);
T_Out = T_Out-repmat(mean(T_Out),size(T_Out,1),1);

L = D*D';

[V,ev,U] = svd(D);
V = D'*V;

for i=1:size(V,2)
    V(:,i) = V(:,i)./norm(V(:,i));
end

cD=zeros(size(D,1),size(V,2));

for i=1:size(D,1)
    cD(i,:) = V'*D(i,:)';
    
end
cT=zeros(size(T,1),size(V,2));

for i=1:size(T,1)
    cT(i,:) = V'*T(i,:)';
end
cT_Out=zeros(size(T_Out,1),size(V,2));

for i=1:size(T_Out,1)
    cT_Out(i,:) = V'*T_Out(i,:)';
end


for kk=1:size(k,2)
    ecD = double(zeros(size(D,1)));
    for i=1:size(D,1)
       ecD(i) = norm(D(i,:)'-V(:,4:k(kk))*cD(i,4:k(kk))'); 
    end

    ecT=double(zeros(size(T,1)));
    for i=1:size(T)
         ecT(i) = norm(T(i,:)'-V(:,4:k(kk))*cT(i,4:k(kk))');
    end
    ecT_Out=double(zeros(size(T_Out,1)));
    for i=1:size(T_Out,1)
        ecT_Out(i) =norm(T_Out(i,:)'-V(:,4:k(kk))*cT_Out(i,4:k(kk))');
    end
    count=0;
    pos1=0;
    err1=0;
    err2=0;
    pos2=0;
    
    for i=1:ntest*nimages
        mn = 1000000;
        ind = 0;

            for j=1:ntrain*nimages
                nrm = norm(cT(i,4:k(kk)+3)-cD(j,4:k(kk)+3));
                if(nrm < mn) 
                    mn = nrm;
                    ind = j;
                end
            end
            
            if(nrm<threshold)
                pos2=pos2+1;
            
            else
                err2=err2+1;
            end
            
            %ntrain
            if(fix((ind-1)/ntrain) == fix((i-1)/ntest))
                count=count+1;
            end
              
    end
    for i=1:nout*ntest_out
        mn = 1000000;
        ind = 0;

            for j=1:ntrain*nimages
                nrm = norm(cT_Out(i,4:k(kk)+3)-cD(j,4:k(kk)+3));
                if(nrm < mn) 
                    mn = nrm;
                    ind = j;
                end
            end
            
            if(nrm>=threshold)
                pos1=pos1+1;
            
            else
                err1=err1+1;
            end
            
            %ntrain
            if(fix((ind-1)/ntrain) == fix((i-1)/ntest))
                count=count+1;
            end
    end
   
    %[k(kk),100.0*pos1/(pos1+err1),100.0*pos2/(pos2+err2)]
    strcat('k=',num2str(k(kk)),' false positives:',num2str(err1),' false negatives:',num2str(err2))

end
