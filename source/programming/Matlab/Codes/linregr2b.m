% M-FILE
% Linear Regression
% Function linregr
%
% function [a, r2] = linregr(x, y)
%
% Inputs: x, y
% Outputs: a, r2

function [a, r2] = linregr(x, y)

n = length(x);

x = log10(x);
y = log10(y);

sumx = sum(x);
sumy = sum(y);
sumx2 = sum(x.*x);
sumy2 = sum(y.*y);
sumxy = sum(x.*y);

meanx = mean(x);
meany = mean(y);

% Coefficients (Katsay�lar):
a(1) = (n * sumxy - sumx * sumy) / (n*sumx2-sumx^2);
a(2) = meany - a(1)*meanx;

% Coefficient of Determination (Determinasyon katsay�s�):
r2 = ((n * sumxy - sumx * sumy)/sqrt(n * sumx2 - sumx^2)/sqrt(n * sumy2 - sumy^2))^2;

% Approximate solutions using the linear curve (Do�rusal e�ri ile yakla��k ��z�mler): 
xp = linspace(min(x),max(x),2);
yp = a(1)*xp + a(2);

% Plots:
plot(x,y,'o',xp,yp)
title('Plot of y vs x')
xlabel('Values of log(x)')
ylabel('Values of log(y)')
grid
