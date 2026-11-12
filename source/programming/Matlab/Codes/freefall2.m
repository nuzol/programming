% M-FILE
% Free-falling body

clear;

% Parameters:
g = 9.81;
m = 68.1;
cd = 0.25;

% Exact solution:
% t: zaman [s]
% v: velocity [m/s]
t = [0:2:20]';
v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);

% Print-outs:
g
m
cd
t
v

% Plots:
plot(t,v,t,v,'o')
title('Plot of v vs t')
xlabel('Values of t')
ylabel('Values of v')
grid
