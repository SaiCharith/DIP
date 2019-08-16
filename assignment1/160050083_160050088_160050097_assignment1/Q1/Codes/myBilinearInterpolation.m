function im= myBilinearInterpolation(M,im)
sM = size(M);
si = size(im);
r = (si-1)./(sM-1);

t =zeros(si(1),sM(2));

for row = 1 : si(1)
   if(mod((row-1),r(1)) == 0)
       ind = round((row-1)/r(1) + 1);
       t(row,:) = M(ind,:);  
   else
        ind = floor((row-1)/r(1) + 1);
        lv = (row-1)/r(1) + 1 - ind;
        rv =1-lv;
        t(row,:) = lv*M(ind,:)+rv*M(ind+1,:); 
   end    
end

for col = 1 : si(2)
   if(mod((col-1),r(2)) == 0)
       ind = round((col-1)/r(2) + 1);
       im(:,col) = t(:,ind); 
   else
       ind = floor((col-1)/r(2) + 1);
       lv = (col-1)/r(2) + 1 - ind;
       rv =1-lv;
       im(:,col) = lv*t(:,ind)+rv*t(:,ind+1); 
   end    
end
