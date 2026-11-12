Linear Algebra
============================================================

.. toctree::
   :caption: Linear Algebra
   :maxdepth: 2

   IterativeMethods.rst


Governing Equations and Numerical Methods for Engineering Applications
-----------------------------------------------------------------------

* Algebraic Equations
* ODEs
	* System of Equations
* PDEs:
	* Laplace Equation
	* Poisson Equation
	* Heat Equation
	* Wave Equation
	* Burger's Equation
	* Euler Equations
	* Navier-Stokes Equations

Linear Algebra
--------------------------

* Vectors, vector spaces, matrices
* Linear transformations 
* Systems of linear equations
* Eigenvalues and Eigenvectors


Matrix Types
--------------------------

**Full (Dense) Matrix**
   All :math:`n^2` entries may be non-zero.
   Storage requirement: :math:`O(n^2)`.

**Sparse Matrix**
   Only a small fraction of entries are non-zero.
   Efficient storage uses compressed formats (CSR, CSC, etc.).

**Tridiagonal (Banded) Matrix**
   Non-zeros confined to the main diagonal and the first sub/super-diagonals.
   Storage requirement: :math:`O(n)`.

**Block-Tridiagonal Matrix**
   Composed of block sub-matrices arranged in tridiagonal pattern.
   Arises from 2-D discretizations.

**Block-Pentadiagonal Matrix**
   Five non-zero block diagonals.
   Arises from 2-D problems with 9-point stencils or cross-derivative terms.


Numerical Methods:
--------------------------

* Direct Methods
* Iterative Methods

