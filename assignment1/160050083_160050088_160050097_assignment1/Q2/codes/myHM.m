%%
function im= myHM(M,R,MM,MR)


for i=1:size(M,3)
    A(i,:) = imhist(M(:,:,i));
    X = imhist(MM);
    A(i,1) = A(i,1)-X(1);
    A(i,:) = cumsum(A(i,:));
    A(i,:) = A(i,:)/A(i,256);
end

for i=1:size(M,3)
    B(i,:) = imhist(R(:,:,i));
    X = imhist(MR);
    B(i,1) = B(i,1)-X(1);
    B(i,:) = cumsum(B(i,:));
    B(i,:) = B(i,:)/B(i,256);
end

C = zeros(3,256);

for k=1:size(M,3)
    for i=1:256
        for j=C(k,i)+1:255
           if(B(k,j)<=A(k,i) && B(k,j+1)>A(k,i))
                C(k,i:256) = j-1;
                break;
           end    
        end    
        if(A(k,i)==1)
            C(k,i:256) = 255;
        end    
    end
end

im = zeros(size(M,1),size(M,2),size(M,3));

for k=1:size(M,3)
    for i=1:size(M,1)
       im(i,:,k) = C(k,M(i,:,k)+1);
    end
end