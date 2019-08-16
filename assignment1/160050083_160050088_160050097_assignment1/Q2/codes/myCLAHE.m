

function enhanced_img = myCLAHE(img,W,t)


M=size(img,1);
N=size(img,2);
C=size(img,3);
W2 = floor(W/2);


for k = 1:1:C
    for i = 1:1:M  
        AH = imhist(img(max(i-W2,1):min(i+W2,M),1:min(W2,N),k));

        for j = 1:1:N
           
           if(j+W2<=N) 
              AH = AH + imhist(img(max(i-W2,1):min(i+W2,M),j+W2,k)); 
           end
           if(j-W2-1>=1) 
              AH = AH - imhist(img(max(i-W2,1):min(i+W2,M),j-W2-1,k)); 
           end
           sum = 0.0;
           T = t*max(AH);
           for p = 1:1:256
               if AH(p,1) > T
                   sum=sum+AH(p,1)-T;
                   AH(p,1)=T;
               end
           end
           AH=AH + (sum/256);
           B=cumsum(AH);
           B=B/B(256);

           enhanced_img(i,j,k)=(B(img(i,j,k)+1)*255.0);
        end    
    end
end




