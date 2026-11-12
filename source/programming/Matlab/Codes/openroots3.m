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
N=100;     % Number of iterations
iter(1)=1; % First iteration
x(1)=0.0;  % Initial Guess at the first iteration
ea(1)=0.0; % Select as 0.0 or 1.0 for the first iteration

es=0.0005;

% 1) Newton-Raphson Method
% ---------------------------------------------------
% Functions: f(x) and df(x):

% Using for-loop for N number of iterations
% finding the estimate for x as x(2),...,x(N) 
for i=1:N
   iter(i+1)=i;  % Store the iteration count in iter
   
   f(i) = exp(-x(i))-x(i);  % f(x)
   df(i)=-exp(-x(i))-1;     % first derivative of f(x)
   x(i+1)=x(i)-f(i)/df(i);  % Newton-Raphson Method
   
   % Calculate error (approximate percentage relative error):
   ea(i+1)=abs((x(i+1)-x(i))/x(i+1))*100;
   
   % Check error:
   if (ea(i+1)<es)
       disp('Root =')
       x(i+1)   % Print the last estimate for the root
       break; 
   end
end

% Plots:
figure(1)
plot(iter,ea,'-ro')
title('Graphical Method: Plot of error vs iter')
xlabel('Values of iter')
ylabel('Values of ea')
grid

figure(2)
plot(iter,x,'-ro')
title('Graphical Method: Plot of x vs iter')
xlabel('Values of iter')
ylabel('Values of x')
grid
