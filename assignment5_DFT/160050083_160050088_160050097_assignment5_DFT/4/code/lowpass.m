function [] = lowpass(A_f,D,m,n)

    L_f = zeros(2*m,2*n); % filter
    
    for i=0:D
        for j=0:D
            if(i^2 + j^2 <= D^2)
                L_f(i+m,j+n) = 1;
                L_f(-i+m,j+n) = 1;
                L_f(i+m,-j+n) = 1;
                L_f(-i+m,-j+n) = 1;
            end
        end
    end
    
    FF = A_f.*L_f ; % applying the filter
    
    my_display(log(abs(L_f)+1),sprintf('Low pass filter with D = %d',D));
    
    f_img = ifft2(ifftshift(FF)) ;
    f_img = real(f_img); % taking only real values ,can take mod also
    f_img=  f_img(m/2+1 : m/2+m, n/2+1 : n/2+n);
    
    
    my_display(f_img,sprintf('Final image with Low pass filter with D = %f',D));


end