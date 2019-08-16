function [] = gaussian_filter(A_f,sigma,m,n)

     G_f = fspecial('gaussian',[2*m,2*n],sigma) ; %gaussian filter
     
     FF = A_f.*G_f ; % applying the filter
     
     max(max(G_f));
     
     %displaying the filter
     my_display(log(1+abs(G_f)),sprintf('Gaussian filter with sigma = %d',sigma));

     colormap (gray);
     colorbar;
     
     f_img = ifft2(ifftshift(FF)) ;
     f_img = real(f_img); % taking only real values ,can take mod also
     f_img=  f_img(m/2+1 : m/2+m, n/2+1 : n/2+n);
     

     my_display(f_img,sprintf('Final image with Gaussian filter with sigma = %d',sigma));

     
end