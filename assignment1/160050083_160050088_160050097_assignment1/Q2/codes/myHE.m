
function im = myHE(M) 
for k=1:size(M,3)

    
A = imhist(M(:,:,k));
A = cumsum(A);
A = A/A(256);


for i=1:size(M,1)
   im(i,:,k) = A(M(i,:,k)+1)*255;
end

end