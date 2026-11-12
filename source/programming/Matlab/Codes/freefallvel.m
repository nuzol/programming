% M-FILE
% Free-falling body
% Function freefallvel
%
% function v = freefallvel(t,m,cd)
%
% Inputs: t, m, cd
% Outputs: v

function v = freefallvel(t, m, cd)
g = 9.81;
v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);

