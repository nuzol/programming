% ---------------------------------------------------
% FUNCTIONS:
% ---------------------------------------------------

% Pivoting
% ---------------------------------------------------
% function [A, b] = Pivoting(n,A,b,k)
%
% Inputs  : n, A, b, k
% Outputs : A, b

function [A, b] = Pivoting(n,A,b,k)

   p=k;
   big=abs(A(k,k))
   for i=k+1:n
      dummy=abs(A(i,k));
      if (dummy>big)
         big = dummy
         p = i;
      end
   end
   if ( p ~= k)
      for j=1:n
         dummy = A(p,j);
         A(p,j) = A(k,j);
         A(k,j) = dummy;
      end
      A
      dummy = b(p);
      b(p) = b(k);
      b(k) = dummy;
   end
% ---------------------------------------------------
