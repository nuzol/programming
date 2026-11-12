% M-FILE
% Standard deviation of a vector
% Function stats
%
% function [mean, stdev] = stats(x)
%
% Inputs: x
% Outputs: mean, stdev

function [mean, stdev] = stats(x)
n = length(x);
mean = sum(x) / n;
stdev = sqrt( sum( (x-mean).^2 / (n-1) ) );


