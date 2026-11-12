% M-FILE
% Free-falling body
%
% Numerical solution: Euler method
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
i=1;

% Main Loop:
while(1)
	i=i+1;
	dvdt = g - (cd/m) * v(i-1)^2;
	v(i) = v(i-1) + dvdt * dt;
	if (i<=N), break, end
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
result1 = velresults';

load time.dat
tn1=time'
load velocity.dat
vn1=velocity'

