function x = backSub( U, b )
[nrow,ncol] = size(U);
x(nrow) = b(nrow) / U(nrow, nrow);
for i = nrow - 1 : -1 : 1
    x(i) = ( b(i) - sum ( x(i+1:nrow) .* U(i, i+1:nrow) ) ) / U(i,i);
end
end