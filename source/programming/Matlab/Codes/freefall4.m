% M-FILE
% Free-falling body
%
% Exact solution:
% t: zaman [s]
% v: velocity [m/s]

clear;

% Parameters:
g = 9.81;

%Inputs:
m = input('Mass (kg): ');
cd = input('Drag Coefficient (kg/m : ');
dt = input('Time step (s): ');
tfinal = input('Final Time (s): ');
 
% Time steps:
t = [0:dt:tfinal];

% Number of time steps:
N = tfinal / dt + 1;

% Initial Condition (at t=0):
v(1)=0;

% Main Loop:
for i=2:1:N
	v(i) = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t(i));
end

% ----------------------------------------------------
% Print-outs:
disp('Parameters and Inputs:')
g
m
cd
dt
tfinal
disp('Outputs:')
N
t'
v'

% Plots:
plot(t,v,t,v,'o')
title('Exact Solution: Plot of v vs t')
xlabel('Values of t')
ylabel('Values of v')
grid

% ----------------------------------------------------
% Print outputs onto a screen with a specific format:
result = [t;v];
fprintf('   t     v\n');
fprintf('%8.3f %8.5e \n', result);

% ----------------------------------------------------
% Write outputs into a file:
save velresults.dat -ascii -double result

save time.dat -ascii -double t
save velocity.dat -ascii -double v

% To load outputs from the file
load velresults.dat
result1 = velresults'

load time.dat
te1=time'
load velocity.dat
ve1=velocity'

