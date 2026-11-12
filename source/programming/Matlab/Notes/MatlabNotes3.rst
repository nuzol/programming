============================================================
Matlab Notes 3
============================================================


Basic Commands: Mathematical Operations
----------------------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory

.. code-block:: matlab

	% Mathematical Operations
	> 2*pi
	ans =
	6.2832

	> y = pi/4
	y =
	0.7854

	> y^2.45
	ans =
	0.5533

	> y = -4 ^ 2
	y =
	-16

	> y = (-4) ^ 2
	y =
	16

	> x = 2 + i*4
	x =
	2.0000 + 4.0000i

	> 3*x
	ans =
	6.0000 +12.0000i

	> 1/x
	ans =
	0.1000 - 0.2000i

	> x^2
	ans =
	-12.0000 +16.0000i

	> x + y
	ans =
	18.0000 + 4.0000i

	> a = [ 1 2 3 4 5 ]
	> b = [ 2 4 6 8 10 ]'
	b =
	2
	4
	6
	8
	10

	> a * b			% inner product
	ans =
	110

	> b * a			% outer product
	ans =
	2     4     6     8    10
	4     8    12    16    20
	6    12    18    24    30
	8    16    24    32    40
	10    20    30    40    50

	> A = [ 1 2 3 ; 4 5 6 ; 7 8 9]
	A =
	1     2     3
	4     5     6
	7     8     9

	> a = [ 1 2 3]
	a =
	1     2     3

	> b = [ 4 5 6 ]'
	b =
	4
	5
	6

	> a * A			% vector-matrix multiplication
	ans =
	30    36    42

	> A * b			% matrix-vector multiplication
	ans =
	32
	77
	122

	> A * a			% Error: dimensions are not as required
	??? Error using ==> mtimes
	Inner matrix dimensions must agree.

	> A * A			% matrix-matrix multiplication
	ans =
	30    36    42
	66    81    96
	102   126   150

	> A / pi		% matrix operations with scalars
	ans =
	0.3183    0.6366    0.9549
	1.2732    1.5915    1.9099
	2.2282    2.5465    2.8648

	> A ^ 2		% A * A
	ans =
	30    36    42
	66    81    96
	102   126   150

	> A .^ 2		% array operations or element-by-element operations
				% square each element of A
	ans =
	1     4     9
	16    25    36
	49    64    81
	>

	% use arrow keys to go back to any command

