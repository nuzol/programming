% Symbolic Math
%
% Solve an equation

clear;

% 1. .....................
display('1. .....................');
%solve('(2.0 * s^2) + (1.0 * s) + 1.0 = 2.0', 's')
solve('(2.0 * s^2) + (1.0 * s) + 1.0 = 2.0')

% 2. .....................
display('2. .....................');
%solve('(2.0 * s^2) + (1.0 * s) - 1.0', 's')
solve('(2.0 * s^2) + (1.0 * s) - 1.0')

% 3. .....................
display('3. .....................');
denklem = 'a*x^2+b*x+c=0'
solve(denklem)
solve(denklem, 'x')

% 4. .....................
display('4. .....................');

% Define symbolic variables:
syms a b c x

% Define an equation:
y = a*x^2+b*x+c

% Solve the equation:
solve(y)
solve(y, x)

% Define the answers into the variables x1 and x2:
x1=ans(1)
x2=ans(2)

% Substitute the values for constants (a, b and c) into the expressions (x1 or x2):
subs(x1, [a,b,c], [2.0,1.0,-1.0])
subs(x2, [a,b,c], [2.0,1.0,-1.0])

% 5. .....................
display('5. .....................');
a=2.0
b=1.0
c=-1.0
x1=1/2/a*(-b+(b^2-4*a*c)^(1/2))
x2=1/2/a*(-b-(b^2-4*a*c)^(1/2))