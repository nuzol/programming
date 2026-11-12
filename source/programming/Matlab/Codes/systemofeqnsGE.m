% M-FILE
% n x n system of equations 
% [A]{x} = {b}
%
% Numerical Methods
% System of Linear Algebraic Equations: Direct and Iterative Methods
%   [A]{x} = {b} --> {x}
%
% Direct Methods:
% 1) Gauss Elimination
% 2) Gauss Jordan
% 3) LU Decomposition
% 4) Crout Decomposition
% 5) Matrix Inverse
% 6) Thomas Algorithm
% 7) Cholesky Decomposition
%
% Iterative Methods:
% 1) Jacobi
% 2) Gauss Seidel
% 3) SOR (Underrelaxation & Overrelaxation)

clear;

% Parameters:

%Inputs:
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];	% Matrix A
b = [7.85 -19.3 71.4];				% RHS known vector b
n = 3;

% Call Gauss Elimination:
x = GaussElimination(n,A,b);

% Print the solution:
disp('Solution:')
x
