function y = forwardSub( L, b)
[nrow,ncol] = size(L);
y=zeros(1, nrow);
y(1) = b(1);
for i = 2:nrow
    T = zeros(1, i);
    T(i) = b(i);
    for j = 1 : i-1
        T(j) = -(L(i,j)*y(j));
    end
    T
    y(i) = sum(T);
end
end