% M-FILE
% f(x) = e^(-x)-x
%
% Numerical Methods
% Roots: Open Roots Methods:
%   y = f(x)
%   f(x) = 0 --> x = xroot
%
% 1) Simple Fixed-Point Iteration Method
% 2) Two-Curve Graphical Method
% 3) Newton-Raphson Method
% 4) Secant Method

clear;

% Parameters:

%Inputs:
x=[0:0.01:1.0];
N=(1.0-0)/0.01+1    % Number of points in x

% 2) Two-Curve Graphical Method
% ---------------------------------------------------
% Functions f1(x) and f2(x):

% Calculate the functions by using one of the two ways 
% as shown below:
% a) For simple coding with Matlab:
f1=exp(-x);
f2=x;
% b) By using the for-loops:
%for i=1:N
%   f1(i)=exp(-x(i));
%   f2(i)=x(i);
%end

% Plots:
figure(1)
plot(x,f1)
hold all
plot(x,f2)
title('Graphical Method: Plot of f(x) vs x')
xlabel('x')
ylabel('f(x)')
grid
