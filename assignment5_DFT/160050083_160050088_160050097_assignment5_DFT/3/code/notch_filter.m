function [im1] = notch_filter(f_img,u,v,R,m,n)
    
    o = size(v,2) ;
    for i=1:m
        for j=1:n
            for k=1:o
                if( (i-u(k))^2 + (j-v(k))^2 <= R)
                    f_img(i+m/2,j+n/2) = 0;
                end
            end
        end
    end
    
    im1 = f_img; 
end