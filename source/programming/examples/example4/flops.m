% ---------------------------------------------------------------------
%  flops.m  --  Measuring floating point performance (FLOP/s) in MATLAB
%  METU AEE 305 - Numerical Methods, Fall 2026
%
%  Kernel (repeated nrep times over arrays of length n):
%        y(i) = y(i) + a*x(i)      -> 1 multiply + 1 add = 2 FLOPs
%  Total FLOPs = 2 * n * nrep
%
%  Two versions are timed:
%    1) explicit for loop  (MATLAB's JIT makes this reasonably fast)
%    2) vectorized         (y = y + a*x on whole arrays)
%
%  Run in MATLAB:  >> flops
%  (Also runs in GNU Octave, but Octave has no JIT: reduce nrep to ~2
%   for the explicit loop, otherwise it takes several minutes.)
% ---------------------------------------------------------------------
clear; clc;
a    = 1.0e-3;
n    = 1000000;
nrep = 200;

% ---- 1) explicit loop ------------------------------------------------
x = 1 + (0:n-1)'/n;                 % initialize (not timed)
y = zeros(n,1);
nflop = 0;

t0 = tic;                           % wall clock start
for k = 1:nrep
    for i = 1:n
        y(i) = y(i) + a*x(i);
    end
    nflop = nflop + 2*n;            % 2 FLOPs per element per sweep
end
elapsed = toc(t0);                  % wall clock end
fprintf('MATLAB code (explicit loop)\n');
fprintf('  n, nrep         = %d, %d\n', n, nrep);
fprintf('  FLOP count      = %d\n', nflop);
fprintf('  wall clock time = %.4f s\n', elapsed);
fprintf('  performance     = %.3f GFLOP/s\n', nflop/elapsed/1e9);
fprintf('  checksum        = %.6e\n', sum(y));   % use the result

% ---- 2) vectorized ---------------------------------------------------
y = zeros(n,1);
nflop = 0;

t0 = tic;
for k = 1:nrep
    y = y + a*x;                    % whole-array operation
    nflop = nflop + 2*n;
end
elapsed = toc(t0);
fprintf('MATLAB code (vectorized)\n');
fprintf('  n, nrep         = %d, %d\n', n, nrep);
fprintf('  FLOP count      = %d\n', nflop);
fprintf('  wall clock time = %.4f s\n', elapsed);
fprintf('  performance     = %.3f GFLOP/s\n', nflop/elapsed/1e9);
fprintf('  checksum        = %.6e\n', sum(y));   % use the result
