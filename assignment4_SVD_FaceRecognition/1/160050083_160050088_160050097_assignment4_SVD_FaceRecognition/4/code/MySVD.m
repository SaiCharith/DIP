function [U,S,V] = MySVD(A)

[m,n] = size(A);
 k = min(m,n);

U = double(zeros(m,m));
V = double(zeros(n,n));

S = double(zeros(m,n));

if m==n
   [U,D] = eig(A*A');
   V = A'*U;
   for i=1:k
        V(:,i) = V(:,i)./norm(V(:,i));
   end
end

if m>n
   [Us,Ds] = eig(A*A');
   [d,ind] = sort(diag(Ds),'descend');
   D = Ds(ind,ind);
   U = Us(:,ind);
   V = A'*U(:,1:k);
   for i=1:k
        V(:,i) = V(:,i)./norm(V(:,i));
    end
end

if m<n
   [Vs,Ds] = eig(A'*A);
   [d,ind] = sort(diag(Ds),'descend');
   D = Ds(ind,ind);
   V = Vs(:,ind);
   U = A*V(:,1:k);
   for i=1:k
       U(:,i) = U(:,i)./norm(U(:,i));
   end
end




S(1:k,1:k) = D(1:k,1:k);


S = real(sqrt(S));
    

