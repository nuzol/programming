============================================================
Matlab Notes 11
============================================================


Basic Commands: Integration
----------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory


.. code-block:: matlab

	% Matlab's Trapezoidal Integration Functions: trapz, cumtrapz

	> x = [0 0.12 0.22 0.32 0.36 0.4 0.44 0.54 0.64 0.7 0.8 ];

	> y = 0.2 + 25 * x - 200 * x .^ 2 + 675 * x .^ 3 - 900 * x .^ 4 + 400 * x .^ 5;

	> plot(x,y)
	> xlabel('x')
	> ylabel('y')


.. code-block:: matlab

	% trapz:
	> trapz(x,y)
	ans =
	1.5948

	% cumtrapz:
	> z = cumtrapz(x,y)
	z =
	  Columns 1 through 7
		0    0.0906    0.2213    0.3738    0.4501    0.5407    0.6467
	  Columns 8 through 11
		0.9642    1.2987    1.4651    1.5948

	> plot(x,z)
	> xlabel('x')
	> ylabel('z')
	>

