============================================================
Matlab Notes 2
============================================================


Basic Commands: Arrays
--------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory

.. code-block:: matlab

	% Vector
	> a = [ 1 2 3 4 5 ]		% array: row vector
	a =
		1     2     3     4     5

	> b = [ 2; 4; 6; 8; 10 ]	% array: column vector
	b =
		2
		4
		6
		8
		10

	> b = [ 2 4 6 8 10 ]'	% transpose of row vector
	b =
		2
		4
		6
		8
		10

	> b'			% transpose of b
	ans =
		2     4     6     8    10

.. code-block:: matlab

	% 3 x 3 matrix
	> A = [ 1 2 3 ; 4 5 6 ; 7 8 9 ]
	A =
		1   2   3
		4   5   6
		7   8   9

	> A = [ 1 2 3
	> 4 5 6
	> 7 8 9 ]
	A =
   		1   2   3
   		4   5   6
   		7   8   9

.. code-block:: matlab

	% Operations
	> who
	Your variables are:
	A    a    ans  b

	> whos
	Name      Size                    Bytes  Class
	A         3x3                        72  double array
	a         1x5                        40  double array
	ans       1x5                        40  double array
	b         5x1                        40  double array
	Grand total is 24 elements using 192 bytes

.. code-block:: matlab

	> b(4)
	ans =
	8

	> A(2,3)
	ans =
	6

.. code-block:: matlab

	> E = zeros(2, 3)
	E =
		0     0     0
		0     0     0

	> u = ones(1, 3)
	u =
		1     1     1

.. code-block:: matlab

	% usage of colon (:) - increment of one
	> t = 1 : 5
	t =
		1     2     3     4     5

	% usage of colon (:) - increment is specified
	> t = 1 : 0.5 : 3
	t =
		1.0000    1.5000    2.0000    2.5000    3.0000

	% usage of colon (:) - negative increment is specified
	> t = 10 : -1 : 5
	t =
		10     9     8     7     6     5

	% usage of colon (:) - represent the entire row or column
	> A(2,:)
	ans =
		4     5     6

	% usage of colon (:) - extracts a
	> t(2:4)
	ans =
		9     8     7

	% linspace(x1, x2, n)	 - linearly equally spaced points (without n: 100 points)
	> linspace(0, 1, 6)
	ans =
		0    0.2000    0.4000    0.6000    0.8000    1.0000

	% logspace(x1, x2, n) - logarithmically equally spaced points (without n: 50 points)
	> logspace(-1, 2, 4)
	ans =
		0.1000    1.0000   10.0000  100.0000
	>

