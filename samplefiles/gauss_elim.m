<<<<<<< HEAD
function x = gauss_elim ( A, b )
=======
function [x, L, U] = gauss_elim ( A, b )
>>>>>>> a09b70e5507a77979851be6c036a0590b6af9a4e

%GAUSS_ELIM   solve the linear system Ax = b using Gaussian elimination
%             with back substitution
%
%     calling sequences:
<<<<<<< HEAD
%             x = gauss_elim ( A, b )
=======
%             [x, L, U] = gauss_elim ( A, b )
>>>>>>> a09b70e5507a77979851be6c036a0590b6af9a4e
%             gauss_elim ( A, b )
%
%     inputs:
%             A       coefficient matrix for linear system
%                     (matrix must be square)
%             b       right-hand side vector
%
%     output:
%             x       solution vector (i.e., vector for which Ax = b)
<<<<<<< HEAD
=======
%             L       L matrix
%             U       U matrix
>>>>>>> a09b70e5507a77979851be6c036a0590b6af9a4e
%
%     NOTE:
%             this is intended as a demonstration routine - no pivoting
%             strategy is implemented to reduce the effects of roundoff
%             error
%
digits(4);
[nrow,ncol] = size ( A );
if ( nrow ~= ncol )
   disp ( 'gauss_elim error: Square coefficient matrix required' );
   return;
end
nb = length ( b );
if ( nrow ~= nb )
   disp ( 'gauss_elim error: Size of b-vector not compatible with matrix dimension' )
   return;
end

x = zeros ( 1, nrow );
<<<<<<< HEAD

=======
L = zeros ( nrow, ncol );
>>>>>>> a09b70e5507a77979851be6c036a0590b6af9a4e
%
%    Gaussian elimination
%

for i = 1 : nrow - 1
   if ( A(i,i) == 0 )
	  % t =  min ( find ( A(i+1:nrow,i) ~= 0 ) + i );
       t =  min ( find ( A(i+1:nrow,i) ) + i );
       
       if (isempty(t) )
           disp ( 'gauss_elim error: A matrix is singular' );
           return
       end
	   
	   temp = A(i,:);     tb = b(i);
	   A(i,:) = A(t,:);   b(i) = b(t);
	   A(t,:) = temp;     b(t) = tb;
   end
<<<<<<< HEAD
    for j = i+1 : nrow
	    m = -A(j,i) / A(i,i);
=======
   L(i,i) = 1;
   M = zeros ( nrow, 1 );
    for j = i+1 : nrow
	    m = -A(j,i) / A(i,i);
        L(j,i) = -m;
        M(j) = -m;
>>>>>>> a09b70e5507a77979851be6c036a0590b6af9a4e
		A(j,i) = 0;
		A(j, i+1:nrow) = A(j, i+1:nrow) + m * A(i, i+1:nrow);
		b(j) = b(j) + m * b(i);
    end
<<<<<<< HEAD
=======
    M
>>>>>>> a09b70e5507a77979851be6c036a0590b6af9a4e
    [A b]
    pause
end

%
%    back substitution
%

x(nrow) = b(nrow) / A(nrow, nrow);
for i = nrow - 1 : -1 : 1
    x(i) = ( b(i) - sum ( x(i+1:nrow) .* A(i, i+1:nrow) ) ) / A(i,i);
end
<<<<<<< HEAD
=======

% LU Factorization
L(nrow,ncol) = 1;
U = A;
>>>>>>> a09b70e5507a77979851be6c036a0590b6af9a4e
