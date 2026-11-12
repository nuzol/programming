============================================================
Matlab Notes 8
============================================================


Basic Commands: Interpolation / Polynomials
--------------------------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory

.. code-block:: matlab

	% Interpolation
	% Polynomials

	% Matlab spline function:
	% not-a-knot spline:
	> x = linspace(-1, 1, 9)
	x =
	  Columns 1 through 6
		-1.0000   -0.7500   -0.5000   -0.2500         0    0.2500
	  Columns 7 through 9
		0.5000    0.7500    1.0000

	> y = 1 ./ (1 + 25 * x .^2)
	y =
	  Columns 1 through 6
		0.0385    0.0664    0.1379    0.3902    1.0000    0.3902
	  Columns 7 through 9
		0.1379    0.0664    0.0385

	> xx = linspace(-1, 1);
	> yy = spline(x, y, xx);
	> yr = 1 ./ (1 + 25 * xx.^2);
	> plot(x,y,'o',xx,yy,xx,yr,'--')

.. code-block:: matlab

	% Matlab spline function:
	% Clamped condition:
	> yc = [1 y -4]
	yc =
	  Columns 1 through 6
		1.0000    0.0385    0.0664    0.1379    0.3902    1.0000
	  Columns 7 through 11
		0.3902    0.1379    0.0664    0.0385   -4.0000

	> yyc = spline(x, yc, xx);
	> plot(x,y,'o',xx,yyc,xx,yr,'--')

.. code-block:: matlab

	% Matlab interp1 and interp2 functions:

	% method = nearest, linear, spline, pchip (or cubic)
	% yi = f(xi)
	> yi = interp1(x, y, xi, 'method')


	% method = nearest, linear, spline, pchip (or cubic)
	% zi = f(xi, yi)
	> zi = interp2(x, y, z, xi, yi, 'method')
	>

