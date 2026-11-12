============================================================
Matlab Notes 5
============================================================


Basic Commands: Graphics
--------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory

.. code-block:: matlab

	% Graphics
	> t = [0:2:20]'		% Example: Free-falling body
	t =
	0
	2
	4
	6
	8
	10
	12
	14
	16
	18
	20

	> length(t)
	ans =
	11

.. code-block:: matlab

	> g = 9.81;
	> m = 68.1;
	> cd = 0.25;

	> v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t)
	v =
	      0
	18.7292
	33.1118
	42.0762
	46.9575
	49.4214
	50.6175
	51.1871
	51.4560
	51.5823
	51.6416

	> plot (t,v)
	> plot(t,v)
	> title('Plot of v versus t')
	> xlabel('Values of t')
	> ylabel('Values of v')
	> grid
	>

	> plot(t,v)
	> title('Plot of v versus t')
	> xlabel('Values of t')
	> ylabel('Values of v')
	> grid
	> hold on
	> plot(t,v,'o')
	> hold off

	> plot(t,v)
	> plot(t,v,t,v,'o')

	> t = 0:pi/50:10*pi;				% Example: Helix
	> subplot(1,2,1); plot(sin(t),cos(t))		% subplot(m,n,p)
	> axis square
	> title('a')
	> subplot(1,2,2); plot3(sin(t),cos(t),t)	% plot3(x,y,z)
	> title('b')

.. code-block:: matlab

	> help plot
	> lookfor plot
	> lookfor logarithm

.. code-block:: matlab

	% Specifiers: Various colors, plot symbols, line types

           b     blue          .     point              -     solid
           g     green         o     circle             :     dotted
           r     red           x     x-mark             -.    dashdot
           c     cyan          +     plus               --    dashed
           m     magenta       *     star             (none)  no line
           y     yellow        s     square
           k     black         d     diamond
                               v     triangle (down)
                               ^     triangle (up)
                               <     triangle (left)
                               >     triangle (right)
                               p     pentagram
                               h     hexagram

