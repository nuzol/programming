============================================================
Matlab Notes 6
============================================================


Basic Commands: Statistics
---------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory

.. code-block:: matlab

	% Statistics
	> x = [ 6.495 6.665 6.755 6.565 6.595 6.505 6.525 6.515 6.615 6.435 6.715 6.555 ]
	x =
	  Columns 1 through 6
		6.4950    6.6650    6.7550    6.5650    6.5950    6.5050
	  Columns 7 through 12
		6.5250    6.5150    6.6150    6.4350    6.7150    6.5550

	> mean(x)
	ans =
	6.5783

	> median(x)
	ans =
	6.5600

	> mode(x)
	ans =
	6.4350

	> min(x)
	ans =
	6.4350

	> max(x)
	ans =
	6.7550

	> std(x)
	ans =
	0.0951

	> var(x)
	ans =
	0.0090

	> length(x)
	ans =
	12

	> hist(x)
	> [n,y]=hist(x)
	n =
		1     1     3     1     2     1     0     1     1     1

	y =
	Columns 1 through 6
		6.4510    6.4830    6.5150    6.5470    6.5790    6.6110
	Columns 7 through 10
		6.6430    6.6750    6.7070    6.7390

	> A = [ 1 2 3 ; 4 5 6 ; 7 8 9 ]
	A =
		1     2     3
		4     5     6
		7     8     9

	> mean(A)
	ans =
		4     5     6

	> A = [ 5 2 3 ; 4 1 6 ; 9 8 7 ]
	A =
		5     2     3
		4     1     6
		9     8     7

	> mean(A)
	ans =
		6.0000    3.6667    5.3333
	>

