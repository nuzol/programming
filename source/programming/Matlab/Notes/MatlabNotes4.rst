============================================================
Matlab Notes 4
============================================================


Basic Commands: Functions
--------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory

.. code-block:: matlab

	% Built-in Functions

	> help log
	LOG    Natural logarithm.
	LOG(X) is the natural logarithm of the elements of X.
	Complex results are produced if X is not positive.

	See also log1p, log2, log10, exp, logm, reallog.

	Overloaded functions or methods (ones with the same name in other directories)
       help gf/log.m
       help fints/log.m
       help designdev/log.m
       help sym/log.m

	Reference page in Help browser
       doc log

	> help elfun
	Elementary math functions.

	Trigonometric.
    sin         - Sine.
    sind        - Sine of argument in degrees.
    sinh        - Hyperbolic sine.
    asin        - Inverse sine.
    asind       - Inverse sine, result in degrees.
    asinh       - Inverse hyperbolic sine.
    cos         - Cosine.
    cosd        - Cosine of argument in degrees.
    cosh        - Hyperbolic cosine.
    acos        - Inverse cosine.
    acosd       - Inverse cosine, result in degrees.
    acosh       - Inverse hyperbolic cosine.
    tan         - Tangent.
    tand        - Tangent of argument in degrees.
    tanh        - Hyperbolic tangent.
    atan        - Inverse tangent.
    atand       - Inverse tangent, result in degrees.
    atan2       - Four quadrant inverse tangent.
    atanh       - Inverse hyperbolic tangent.
    sec         - Secant.
    secd        - Secant of argument in degrees.
    sech        - Hyperbolic secant.
    asec        - Inverse secant.
    asecd       - Inverse secant, result in degrees.
    asech       - Inverse hyperbolic secant.
    csc         - Cosecant.
    cscd        - Cosecant of argument in degrees.
    csch        - Hyperbolic cosecant.
    acsc        - Inverse cosecant.
    acscd       - Inverse cosecant, result in degrees.
    acsch       - Inverse hyperbolic cosecant.
    cot         - Cotangent.
    cotd        - Cotangent of argument in degrees.
    coth        - Hyperbolic cotangent.
    acot        - Inverse cotangent.
    acotd       - Inverse cotangent, result in degrees.
    acoth       - Inverse hyperbolic cotangent.
    hypot       - Square root of sum of squares.

	Exponential.
    exp         - Exponential.
    expm1       - Compute exp(x)-1 accurately.
    log         - Natural logarithm.
    log1p       - Compute log(1+x) accurately.
    log10       - Common (base 10) logarithm.
    log2        - Base 2 logarithm and dissect floating point number.
    pow2        - Base 2 power and scale floating point number.
    realpow     - Power that will error out on complex result.
    reallog     - Natural logarithm of real number.
    realsqrt    - Square root of number greater than or equal to zero.
    sqrt        - Square root.
    nthroot     - Real n-th root of real numbers.
    nextpow2    - Next higher power of 2.

	Complex.
    abs         - Absolute value.
    angle       - Phase angle.
    complex     - Construct complex data from real and imaginary parts.
    conj        - Complex conjugate.
    imag        - Complex imaginary part.
    real        - Complex real part.
    unwrap      - Unwrap phase angle.
    isreal      - True for real array.
    cplxpair    - Sort numbers into complex conjugate pairs.

	Rounding and remainder.
    fix         - Round towards zero.
    floor       - Round towards minus infinity.
    ceil        - Round towards plus infinity.
    round       - Round towards nearest integer.
    mod         - Modulus (signed remainder after division).
    rem         - Remainder after division.
    sign        - Signum.

.. code-block:: matlab

	> A = [ 1 2 3 ; 4 5 6 ; 7 8 9 ]
	A =
		1     2     3
		4     5     6
		7     8     9

	> log(A)
	ans =
		     0    0.6931    1.0986
		1.3863    1.6094    1.7918
		1.9459    2.0794    2.1972

	> sqrt(A)
	ans =
		1.0000    1.4142    1.7321
		2.0000    2.2361    2.4495
		2.6458    2.8284    3.0000

	> sqrtm(A)
	ans =
		0.4498 + 0.7623i   0.5526 + 0.2068i   0.6555 - 0.3487i
		1.0185 + 0.0842i   1.2515 + 0.0228i   1.4844 - 0.0385i		1.5873 - 0.5940i   1.9503 - 0.1611i   2.3134 + 0.2717i

	> E = [-1.6 -1.5 -1.4 1.4 1.5 1.6]
	E =
		-1.6000   -1.5000   -1.4000    1.4000    1.5000    1.6000

	> round(E)			% rounding
	ans =
		-2    -2    -1     1     2     2

	> ceil(E)			% rounding to nearest integer toward infinity
	ans =
		-1    -1    -1     2     2     2

	> floor(E)			% rounding to nearest integer toward minus infinity
	ans =
		-2    -2    -2     1     1     1

	> F = [ 3 5 4 6 1];
	> sum(F)
	ans =
	19

	> min(F), max(F), mean(F), prod(F), sort(F)
	ans =
	1

	ans =
	6

	ans =
	3.8000

	ans =
	360

	ans =
		1     3     4     5     6
	>

