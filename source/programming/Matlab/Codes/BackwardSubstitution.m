% ---------------------------------------------------
% FUNCTIONS:
% ---------------------------------------------------

% 3) Backward Substitution
% ---------------------------------------------------
% function x = BackwardSubstitution(n,U,z)
%
% Inputs  : n, U, z
% Outputs : x
%
function x = BackwardSubstitution(n,U,z)

  x(n) = z(n) / U(n,n);
  for i=n-1:-1:1
     sum = z(i);
     for j=i+1:n
        sum = sum - U(i,j)*x(j);
     end
     x(i) = sum / U(i,i);
  end
% ---------------------------------------------------
