============================================================
Matlab Notes 1
============================================================


Basic Commands:
--------------------------

.. code-block:: matlab

	% Command Line
	> pwd			% Present Working Directory
	ans =
	C:\Program Files\MATLAB71

.. code-block:: matlab

	> cd ..
	> cd ..
	> cd userid\
	> cd mymatlab\
	> ls			% List
	.   ..
	> dir			% Directory List
	.   ..

.. code-block:: matlab

	% Computations
	> 55 - 16		% Computation
	ans =			% Answer
	39
	> ans + 11		% Computation
	ans =
	50
	> a = 4			% Assignment
	a =
	4
	> A = 6;		% Case Sensitive
	> a = 4, A = 6; x = 1;	% Not printing with semicolon (;)
	a =			% Printing with comma (,)
	4
	> a
	a =
	4
	> A
	A =
	6
	> x
	x =
	1

.. code-block:: matlab

	% Complex Numbers
	> x = 2 + i*4		% Complex values 	% i = sqrt(-1)
	x =
	2.0000 + 4.0000i

.. code-block:: matlab

	% Format
	> pi			% Pi number
	ans =
	3.1416
	> format long		% Change format
	> pi
	ans =
	3.14159265358979
	> format short		% Change format
	> pi
	ans =
	3.1416
	> format short e
	> pi
	ans =
	3.1416e+000
	> format long e
	> pi
	ans =
	3.141592653589793e+000
	> format short g
	> pi
	ans =
	3.1416
	> format long g
	> pi
	ans =
	3.14159265358979
	> format short eng
	> pi
	ans =
	3.1416e+000
	> format long eng
	> pi
	ans =
	3.14159265358979e+000
	> format bank
	> pi
	ans =
	3.14
	> format short
	>
