============================================================
Matlab Notes 10
============================================================


Basic Commands: Linear System of Equations
-------------------------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory


.. code-block:: matlab

	% Linear System of Equations
	% n x n matrix
	> A = [ 15 -10 0; -10 15 -5; 0 -5 5 ]
	A =
		 15   -10     0
		-10    15    -5
		  0    -5     5

	% RHS column vector
	> b = [50 60 80]'
	b =
	50
	60
	80

	% Solution column vector
	> x = A \ b
	x =
	38.0000
	52.0000
	68.0000


.. code-block:: matlab

	> x = inv(A) * b
	x =
	38.0000
	52.0000
	68.0000

	> D = det(A)		% Determinant
	D =
	250


.. code-block:: matlab

	> [L, U] = lu(A)	% LU Decomposition
	L =
	 1.0000         0         0
	-0.6667    1.0000         0
	      0   -0.6000    1.0000

	U =
	15.0000  -10.0000         0
	      0    8.3333   -5.0000
	      0         0    2.0000

	> L * U			% A = L * U
	ans =
		 15   -10     0
		-10    15    -5
		  0    -5     5

	> z = L \ b		% Forward Substitution
	z =
	50.0000
	93.3333
	136.0000

	> x = U \ z		% Backward Substitution
	x =
	38.0000
	52.0000
	68.0000


.. code-block:: matlab

	> U = chol(A)   % Cholecky Decomposition for symmetric matric
	U =
		3.8730   -2.5820         0
		     0    2.8868   -1.7321
		     0         0    1.4142

	> U' * U		% A = U' * U
	ans =
		 15.0000  -10.0000         0
		-10.0000   15.0000   -5.0000
		       0   -5.0000    5.0000

	> z = U' \ b		% Forward Substitution
	z =
	12.9099
	32.3316
	96.1665

	> x = U \ z		% Backward Substitution
	x =
	38.0000
	52.0000
	68.0000


.. code-block:: matlab

	% Matrix Condition Numbers:
	> norm(A,'fro')		% Frobenius notm
	ans =
	26.9258

	> cond(A,'fro')		% Frobenius condition number
	ans =
	22.8473

	> norm(A,inf)		% row-sum norm
	ans =
	30

	> cond(A,inf)		% row-sum condition number
	ans =
	30

	> conditionnumber=norm(A,inf)*norm(inv(A),inf)
	conditionnumber =
	30

	> cond(A)		% Spectral condition number
	ans =
	21.4931
	>

