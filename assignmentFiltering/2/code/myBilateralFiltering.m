
function res_img = myBilateralFiltering(img,stdx,stdi)
size(img)
M=size(img,1);
N=size(img,2);

W=floor(3*stdx);

for i=1:2*W+1
    for j=1:2*W+1
        G(i,j)=exp((-(i-W-1)*(i-W-1)-(j-W-1)*(j-W-1))/(2*stdx*stdx));
    end
end


for i=1:1:M
    i_mn=max(1,i-W);
    i_mx=min(M,i+W);
    for j=1:1:N
        j_mn=max(1,j-W);
        j_mx=min(N,j+W); 
        
         tmp1=img(i_mn:i_mx,j_mn:j_mx);
         tmp=tmp1-img(i,j);

         H=G(W+1-(i-i_mn):W+1+(i_mx-i),W+1-(j-j_mn):W+1+(j_mx-j));

         
         num=tmp1.*((exp(-(tmp.*tmp)/(stdi*stdi))).*H);
         den=exp(-(tmp.*tmp)/(stdi*stdi)).*H;   
         
         res_img(i,j) = sum(sum(num))/sum(sum(den));

        
    end
end


 