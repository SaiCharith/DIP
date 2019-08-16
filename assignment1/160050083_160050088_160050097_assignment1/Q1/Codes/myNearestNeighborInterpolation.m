%%
function  im= myNearestNeighborInterpolation(M,im)
sM = size(M);
si = size(im);
r = (si-1)./(sM-1);

t = zeros(si(1),sM(2));

for row = 1 : si(1)
 
   ind = round((row-1)/r(1) + 1);
   t(row,:) = M(ind,:);  

end

for col = 1 : si(2)
 
       ind = round((col-1)/r(2) + 1);
       im(:,col) = t(:,ind);   
     
end



