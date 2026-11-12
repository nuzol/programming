% M-FILE
% Free-falling body
% Function freefallsubfunc
%
% function v = freefallsubfunc(t,m,cd)
%
% Inputs: t, m, cd
% Outputs: v

function v = freefallsubfunc(t, m, cd)		% main function
   v = vel(t,m,cd);
end

function v = vel(t, m, cd)			% subfunction
   g = 9.81;
   v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);
end
