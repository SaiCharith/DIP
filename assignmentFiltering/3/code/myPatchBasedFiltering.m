
function res_img = myPatchBasedFiltering(img,patch,stdh,Limit)
size(img)
M=size(img,1);
N=size(img,2);
W = floor(patch/2.0);
L=floor(Limit/2.0);
eff_patch = 2*W+1;
for i=1:eff_patch
    for j=1:eff_patch
        G(i,j)=exp((-(i-W-1)*(i-W-1)-(j-W-1)*(j-W-1))/(W*W/18.0));
    end
end


for i=1:1:M
    i_mn=max(1,i-W);
    i_mx=min(M,i+W);

    for j=1:1:N
        j_mn=max(1,j-W);
        j_mx=min(N,j+W);

        
        Z=zeros(eff_patch,eff_patch);
        Z(W+1-(i-i_mn):W+1+(i_mx-i),W+1-(j-j_mn):W+1+(j_mx-j))=G(W+1-(i-i_mn):W+1+(i_mx-i),W+1-(j-j_mn):W+1+(j_mx-j));
        y=zeros(eff_patch,eff_patch);
        y(W+1-(i-i_mn):W+1+(i_mx-i),W+1-(j-j_mn):W+1+(j_mx-j))=img(i_mn:i_mx,j_mn:j_mx);
        pos_i_mn = max(i-L,1+i-i_mn);
        pos_i_mx = min(i+L,M-(i_mx-i));
        pos_j_mn = max(j-L,1+j-j_mn);
        pos_j_mx = min(j+L,M-(j_mx-j));
        
        compute_distance = @(x) sum(sum((Z.*(x-y)).*(Z.*(x-y)))); %display(x);
        
        B = nlfilter(img(pos_i_mn:pos_i_mx,pos_j_mn:pos_j_mx),[2*W+1 2*W+1],compute_distance);
        
        S=exp(-B.*B/(2*stdh*stdh));
        
        res_img(i,j) = sum(sum(S.*img(pos_i_mn:pos_i_mx,pos_j_mn:pos_j_mx)))/sum(sum(S));
        
        
        
    end
end


