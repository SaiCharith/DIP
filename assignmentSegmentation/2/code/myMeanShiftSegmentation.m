

function res_img = myMeanShiftSegmentation(img,t,sigma_I,sigma_x,n_iter,noOfNeighbours)

[M,N,C] = size(img);

temp_img = zeros(M,N,C+2).*1.0;

temp_img(:,:,1:C) = img;

temp1_img = zeros(M*N,5);

for i = 1:1:M
    for j = 1:1:N
        temp_img(i,j,4) = i;
        temp_img(i,j,5) = j;
        temp1_img((i-1)*N+j,:) = temp_img(i,j,:) ;
    end
end
temp1_img(:,1:3) = temp1_img(:,1:3)./(sigma_I*sqrt(2));
temp1_img(:,4:5) = temp1_img(:,4:5)./(sigma_x*sqrt(2));


for k=1:n_iter
    tic;
    [IDX, D] = knnsearch(temp1_img, temp1_img, 'k', noOfNeighbours);   
    
    for i=1:M*N
        weights = exp(-(D(i,:).^2));
        
        for j=1:5
            temp1_img(i,j) = temp1_img(i,j) + t*((sum(sum(temp1_img(IDX(i,:),j).*weights'))/sum(sum(weights)))-temp1_img(i,j));
       
        end
    end
    display(strcat('iter',num2str(k),' complete'));
    
    toc;


end
     


for i = 1:1:M
    for j = 1:1:N
        res_img(i,j,1:3) = (temp1_img((i-1)*N+j,1:3)).*(sigma_I*sqrt(2));
        res_img(i,j,4:5) = (temp1_img((i-1)*N+j,4:5)).*(sigma_x*sqrt(2));

    end
end





