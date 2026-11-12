============================================================
Matlab Notes 7
============================================================


Basic Commands: Regression / Polynomials
-----------------------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory

.. code-block:: matlab

	% Regression
	% Polynomials

	> x = [ 10 20 30 40 50 60 70 80 ]
	x =
		10    20    30    40    50    60    70    80

	> y = [ 25 70 380 550 610 1220 830 1450 ]
	y =
	  Columns 1 through 5
          25          70         380         550         610
	  Columns 6 through 8
        1220         830        1450

.. code-block:: matlab

	% Polynomials
	> p = polyfit(x,y,1)
	p =
		19.4702 -234.2857

	> yvalue = polyval(p,25)
	yvalue =
	252.4702

	> p = polyfit(x,y,2)
	p =
		0.0372   16.1220 -178.4821

	> yvalue = polyval(p,25)
	yvalue =
	247.8199

	> ynew = polyval(p,x)
	ynew =
		1.0e+003 *

	  Columns 1 through 6
		-0.0135    0.1588    0.3387    0.5259    0.7206    0.9228
	  Columns 7 through 8
		1.1324    1.3494

	> plot(x,y,'o',x,ynew)

.. code-block:: matlab

	% Regression
	> [a,r2]=linregr(x,y)
	a =
		19.4702 -234.2857

	r2 =
	0.8805

	> [a,r2]=linregr(log10(x),log10(y))
	a =
		1.9842   -0.5620

	r2 =
	0.9481

	> [a,r2]=linregr2b(x,y)
	a =
		1.9842   -0.5620

	r2 =
	0.9481

	> [a,r2]=linregr2a(x,y)
	a =
		0.0528    3.5267

	r2 =
	0.8155

	> [a,r2]=linregr2c(x,y)
	a =
		0.4596   -0.0077

	r2 =
	0.9652
	>

