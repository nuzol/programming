% M-FILE
% Free-falling body

clear;

% Parameters:
g = 9.81;

%Inputs:
m = input('Mass (kg): ');
cd = input('Drag Coefficient (kg/m : ');
dt = input('Time step (s): ');

% Exact solution:
% t: zaman [s]
% v: velocity [m/s]
t = [0:dt:20]';
v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);

% ----------------------------------------------------
% Print-outs:
disp('Parameters and Inputs:')
g
m
cd
dt
disp('Outputs:')
t
v

% Plots:
plot(t,v,t,v,'o')
title('Plot of v vs t')
xlabel('Values of t')
ylabel('Values of v')
grid

% Print outputs onto a screen with a specific format:
result = [t';v'];
fprintf('   t     v\n');
fprintf('%8.3f %8.5e \n', result);

% Write outputs into a file:
save velresults.dat -ascii -double result

save time.dat -ascii -double t
save velocity.dat -ascii -double v

% To load outputs from the file
load velresults.dat
result1 = velresults';

load time.dat
t1=time
load velocity.dat
v1=velocity

