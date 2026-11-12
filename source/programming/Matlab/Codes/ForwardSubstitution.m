% ---------------------------------------------------
% FUNCTIONS:
% ---------------------------------------------------

% 3) Forward Substitution
% ---------------------------------------------------
% function z = ForwardSubstitution(n,L,b)
%
% Inputs  : n, L, b
% Outputs : z
%
function z = ForwardSubstitution(n,L,b)

  for i=1:n
     sum = b(i);
     for j=1:i-1
        sum = sum - L(i,j)*b(j);
     end
     z(i)=sum;
  end 
% ---------------------------------------------------
