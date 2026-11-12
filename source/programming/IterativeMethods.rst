Linear Algebra and Iterative Methods for Linear Systems
========================================================

.. toctree::
   :caption: Iterative Methods
   :maxdepth: 2


Introduction
------------------

Numerical methods for solving systems of linear algebraic equations:

:math:`[A]\{x\} = \{b\}` 

where :math:`[A]` is an :math:`n \times n` coefficient matrix, 
:math:`\{x\}` is the unknown vector, and :math:`\{b\}` is the right-hand-side vector.


Numerical Methods
------------------

Direct Methods:
    * Cramer's Rule
    * Gauss-Jordan Elimination
    * Gaussian Elimination
    * LU Decomposition
    * Thomas Algorithm
    * Cholesky Decomposition (symmetric positive-definite matrices)

Iterative Methods
    * Jacobi Method
    * Gauss-Seidel Method
    * SOR Method


Direct Methods
------------------

Cramer's Rule:
~~~~~~~~~~~~~~~~~~~~~~~~

The solution is obtained via determinant expansion:

.. math::

   x_1 = \frac{D_1}{D}, \quad x_2 = \frac{D_2}{D}, \quad \ldots, \quad x_n = \frac{D_n}{D}

where :math:`D = \det([A])` and :math:`D_i` is the determinant of the matrix
obtained by replacing the :math:`i`-th column of :math:`[A]` with :math:`\{b\}`.

.. admonition:: Example

   For a :math:`2 \times 2` system:

   .. math::

      x_1 = \frac{b_1 a_{22} - b_2 a_{12}}{a_{11}a_{22} - a_{12}a_{21}}

**Limitation**: Operation count is :math:`O(n!)` — not applicable to large systems.

Cramer's rule is practical only for :math:`n \leq 3`. For larger systems, Gaussian elimination or LU decomposition is preferred.


Gauss-Jordan Elimination
~~~~~~~~~~~~~~~~~~~~~~~~

Reduces the matrix :math:`[A|\mathbf{b}]` to the identity form
:math:`[I|\mathbf{x}]` by forward *and* backward operations simultaneously.

Example (4×4 system)::

   Step 1: Normalise row 1 by a_{11}, eliminate column 1 from rows 2,3,4
   Step 2: Normalise row 2 by a_{22}, eliminate column 2 from rows 1,3,4
   Step 3: Normalise row 3 by a_{33}, eliminate column 3 from rows 1,2,4
   Step 4: Normalise row 4 by a_{44}, eliminate column 4 from rows 1,2,3

Result: :math:`x_i = b_i^{(i-1)}` directly (no back substitution).

Operation count: :math:`n^3 + O(n^2)`.


Gaussian Elimination
~~~~~~~~~~~~~~~~~~~~

Two-phase approach:

1. **Forward Elimination** — reduce :math:`[A]` to upper-triangular :math:`[U]`.
2. **Back Substitution** — solve for unknowns from the last row upward.

Back substitution formula:

.. math::

   x_i = \frac{b_i^{(i-1)} - \displaystyle\sum_{j=i+1}^{n} a_{ij}^{(i-1)}\,x_j}{a_{ii}^{(i-1)}}, \quad i = n, n-1, \ldots, 1

Operation count: :math:`\dfrac{2n^3}{3} + O(n^2)`. Less expensive compared to full elimination of Gauss-Jordan.


LU Decomposition
~~~~~~~~~~~~~~~~

Factors :math:`[A] = [L][U]` where :math:`[L]` is lower-triangular (unit diagonal) and
:math:`[U]` is upper-triangular.

Solution procedure for multiple right-hand sides:

1. Forward substitution — solve :math:`[L]\{y\} = \{b\}`.
2. Back substitution — solve :math:`[U]\{x\} = \{y\}`.

Advantage: once :math:`[L]` and :math:`[U]` are computed in :math:`O(n^3)`, 
additional right-hand sides cost only :math:`O(n^2)`.


Thomas Algorithm
~~~~~~~~~~~~~~~~

Specialised LU decomposition for **tridiagonal** systems:

.. math::

   \begin{bmatrix}
   b_1 & c_1 \\
   a_2 & b_2 & c_2 \\
       & a_3 & b_3 & c_3 \\
       &     & \ddots & \ddots & \ddots \\
       &     &        & a_n    & b_n
   \end{bmatrix}
   \{x\} = \{d\}

.. math::

   a_i x_{i-1} + b_i x_i + c_i x_{i+1} = d_i, \quad i = 1, \ldots, n

**Forward sweep** (modify coefficients):

.. math::

   c_i' = \frac{c_i}{b_i - a_i c_{i-1}'}, \qquad
   d_i' = \frac{d_i - a_i d_{i-1}'}{b_i - a_i c_{i-1}'}

**Back substitution**:

.. math::

   x_n = d_n', \qquad x_i = d_i' - c_i' x_{i+1}, \quad i = n-1, \ldots, 1

Operation count: :math:`O(n)`. Highly efficient for tridiagonal systems.


Iterative Methods
------------------

Iterative methods start from an initial guess :math:`\{x\}^{(0)}` and 
refine the solution through repeated applications of an update rule.

Convergence is guaranteed when the coefficient matrix is
**strictly diagonally dominant**:

.. math::

   |a_{ii}| > \sum_{j \neq i} |a_{ij}|, \quad \forall\, i


Jacobi Method
~~~~~~~~~~~~~

Each new iteration uses **only old (previous) values**:

.. math::

   x_i^{(m)} = \frac{1}{a_{ii}}\left(b_i - \sum_{j \neq i} a_{ij}\,x_j^{(m-1)}\right)

All components of :math:`\{x\}^{(m)}` are computed from :math:`\{x\}^{(m-1)}`
before any update is applied (can be parallelised trivially).

Suitable for parallel computation. Generally converges more slowly than
Gauss-Seidel.

Gauss-Seidel Method
~~~~~~~~~~~~~~~~~~~

Each new iteration uses **the most recently available (updated) values**:

.. math::

   x_i^{(m)} = \frac{1}{a_{ii}}\left(b_i
   - \sum_{j=1}^{i-1} a_{ij}\,x_j^{(m)}
   - \sum_{j=i+1}^{n} a_{ij}\,x_j^{(m-1)}\right)

Updated values are used immediately; typically converges roughly twice as fast
as Jacobi for the same problem.

Convergence is guaranteed when the coefficient matrix is **diagonally dominant**.


Successive Over-Relaxation (SOR)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Accelerates Gauss-Seidel by introducing a relaxation factor :math:`\omega`:

.. math::

   x_i^{(m)} = \omega\,\tilde{x}_i^{(m)} + (1-\omega)\,x_i^{(m-1)}

where :math:`\tilde{x}_i^{(m)}` is the Gauss-Seidel update.

A weighted average between the Gauss-Seidel update :math:`\{x\}^m_{GS}`
and the previous iterate :math:`\{x\}^{m-1}`.

- :math:`\omega = 1` — recovers Gauss-Seidel.
- :math:`1 < \omega < 2` — over-relaxation (SOR), accelerates convergence.
- :math:`0 < \omega < 1` — under-relaxation, stabilizes diverging iterations.

Optimal :math:`\omega` depends on the spectral radius of the iteration matrix.


Convergence Criteria
--------------------

Iteration stops when the approximate relative error falls below a tolerance
:math:`\varepsilon_s`:

.. math::

   |\varepsilon_a|_i = \left|\frac{x_i^{\text{new}} - x_i^{\text{old}}}{x_i^{\text{new}}}\right| \times 100\% < \varepsilon_s, \quad \forall\, i


**Diagonal dominance condition** (sufficient for convergence):

.. math::

   |a_{ii}| \geq \sum_{j \neq i} |a_{ij}|, \quad \forall\, i


Method Comparison
-----------------

.. list-table::
   :header-rows: 1
   :widths: 25 15 35

   * - Method
     - Type
     - Operation Count
   * - Cramer's Rule
     - Direct
     - :math:`O(n!)`
   * - Gaussian Elimination
     - Direct
     - :math:`\frac{2}{3}n^3 + O(n^2)`
   * - Gauss-Jordan
     - Direct
     - :math:`n^3 + O(n^2)`
   * - LU Decomposition
     - Direct
     - :math:`\frac{2}{3}n^3` (+:math:`O(n^2)` per RHS)
   * - Thomas Algorithm
     - Direct
     - :math:`O(n)` (tridiagonal only)
   * - Jacobi
     - Iterative
     - :math:`O(n^2)` per iteration
   * - Gauss-Seidel
     - Iterative
     - :math:`O(n^2)` per iteration
   * - SOR
     - Iterative
     - :math:`O(n^2)` per iteration, optimal :math:`\lambda`
