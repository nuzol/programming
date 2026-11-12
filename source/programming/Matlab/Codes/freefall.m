% M-FILE
% Free-falling body

clear;

g = 9.81;
m = 68.1;
cd = 0.25;

t = [0:2:20]';
v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);

plot(t,v,t,v,'o')
title('Plot of v vs t')
xlabel('Values of t')
ylabel('Values of v')
grid
