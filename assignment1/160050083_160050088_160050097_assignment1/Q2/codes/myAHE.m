

function enhanced_img = myAHE(img,W)


M=size(img,1);
N=size(img,2);
C=size(img,3);
W2=floor(W/2);

%enhanced_img=img;

for k = 1:1:C
    for i = 1:1:M  
        AH = imhist(img(max(i-W2,1):min(i+W2,M),1:min(W2,N),k));
%         size(AH)
        for j = 1:1:N
           
           if(j+W2<=N) 
              AH = AH + imhist(img(max(i-W2,1):min(i+W2,M),j+W2,k)); 
           end
           if(j-W2-1>=1) 
              AH = AH - imhist(img(max(i-W2,1):min(i+W2,M),j-W2-1,k)); 
           end

           B=cumsum(AH);
           B=B/B(256);
           enhanced_img(i,j,k)=(B(img(i,j,k)+1)*255.0);
        end    
    end
end

%enhanced_img




