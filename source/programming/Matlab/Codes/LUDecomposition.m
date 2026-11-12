% ---------------------------------------------------
% FUNCTIONS:
% ---------------------------------------------------

% 3) LUDecomposition
% ---------------------------------------------------
% function [L, U] = LUDecomposition(n,A)
%
% Inputs  : n, A
% Outputs : L, U

function [L, U] = LUDecomposition(n,A)

L = eye(n,n);
U = eye(n,n);

  % Forward Elimination
  for k=1:n-1
     
     if (k == 1)
        U(k,:) = A(k,:);
     end
     
     for i=k+1:n
        factor = A(i,k)/A(k,k);
        L(i,k) = factor;
        U(i,k) = 0;
        
        for j=k+1:n
           A(i,j)=A(i,j)-factor*A(k,j);
           U(i,j)=A(i,j);
        end
     end 
  end
% ---------------------------------------------------
