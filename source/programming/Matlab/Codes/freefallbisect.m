% M-FILE
% Free-falling body
%
% Numerical Methods
% Roots: Bracketing Methods:
%   y = f(x)
%   f(x) = 0 --> x = xroot
%
% 1) Graphical Method
% 2) Bisection Method

clear;

% Parameters:
g = 9.81;

%Inputs:
m = 80;
v = 40;
t = 10;
 
% 1) Graphical Method
% ----------------------------------------------------
% Drag Coefficient, cd:
cdstart=0.1;
dcd = 0.1;
cdfinal = 1.0;
cd = [cdstart:dcd:cdfinal];

% Function, f(cd):
f = sqrt(g*m./cd).*tanh(sqrt(g.*cd/m)*t)-v;

% Plots:
figure(1)
plot(cd,f,'-ro')
title('Graphical Method: Plot of f vs cd')
xlabel('Values of cd')
ylabel('Values of f')
grid

% 2) Bisection Method
% ----------------------------------------------------
% 1. Step: Select the lower and upper boundaries
xl = 0.1;
xu = 0.5;

i=0;
ea(1)=1.0;
es = 0.0005;

while(1)

i=i+1;
iter(i)=i;   % Iteration

% 2. Step: Estimate the root
xr = (xl + xu)/2.0;
xrnew(i)=xr;

% 3. Step: Find the new boundaries
fxl = sqrt(g*m/xl)*tanh(sqrt(g*xl/m)*t)-v;
fxr = sqrt(g*m/xr)*tanh(sqrt(g*xr/m)*t)-v;

if( fxl*fxr > 0)
   xl=xr;
else
   xu=xr;
end

% Calculate error:
if(i>1)
   ea(i) = abs((xrnew(i)-xrnew(i-1))/xrnew(i))*100;
end

if(ea(i)<es)
   break; end

end  % END OF WHILE

% Plots:
figure(2)
plot(iter,ea,'-ro')
title('Bisection Method: Plot of error vs iteration')
xlabel('Values of iteration')
ylabel('Values of ea')
grid

