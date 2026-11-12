Programming: Example Codes
=======================================================

.. toctree::
   :caption: Codes
   :maxdepth: 2


Example 1: Serial code and Makefile for C and Fortran
------------------------------------------------------

Codes:
   * :download:`hello.c<programming/examples/example1/hello.c>`
   * :download:`hello.f90<programming/examples/example1/hello.f90>`
   * :download:`Makefile.serial<programming/examples/example1/Makefile.serial>`
   * :download:`MakefileF.serial<programming/examples/example1/MakefileF.serial>`


*Codes:*

 .. tabs::

   .. group-tab:: Hello C
      .. literalinclude:: programming/examples/example1/hello.c
         :language: C

   .. group-tab:: Hello Fortran
      .. literalinclude:: programming/examples/example1/hello.f90
         :language: Fortran


*Makefiles:*

 .. tabs::

   .. group-tab:: Makefile C
      .. literalinclude:: programming/examples/example1/Makefile.serial
         :language: C

   .. group-tab:: Makefile Fortran
      .. literalinclude:: programming/examples/example1/MakefileF.serial
         :language: Fortran


Example 2: Freefall C and Fortran codes
----------------------------------------

Codes:
   * :download:`freefall.c<programming/examples/example2/freefall.c>`
   * :download:`freefall.f90<programming/examples/example2/freefall.f90>`


*Codes:*

.. tabs::

   .. group-tab:: Freefall C
      .. literalinclude:: programming/examples/example2/freefall.c
         :language: C

   .. group-tab:: Freefall Fortran
      .. literalinclude:: programming/examples/example2/freefall.f90
         :language: Fortran


Example 3: Parallel codes
--------------------------

MPI:
  * :download:`hellompi.c<programming/examples/example3/hellompi.c>`
  * :download:`hellompi.f90<programming/examples/example3/hellompi.f90>`
  * :download:`Makefile.parallel<programming/examples/example3/Makefile.parallel>`
  * :download:`MakefileF.parallel<programming/examples/example3/MakefileF.parallel>`


*Codes:*

.. tabs::

   .. group-tab:: Hello MPI C
      .. literalinclude:: programming/examples/example3/hellompi.c
         :language: C

   .. group-tab:: Hello MPI Fortran
      .. literalinclude:: programming/examples/example3/hellompi.f90
         :language: Fortran


*Makefiles:*

 .. tabs::

   .. group-tab:: Makefile C
      .. literalinclude:: programming/examples/example3/Makefile.parallel
         :language: C

   .. group-tab:: Makefile Fortran
      .. literalinclude:: programming/examples/example3/MakefileF.parallel
         :language: Fortran


Job Scripts:
  * :download:`SLURMjob.sh<programming/examples/example3/SLURMjob.sh>` for TRUBA
  * :download:`SLURMARFjob.sh<programming/examples/example3/SLURMARFjob.sh>` for TRUBA ARF
  * :download:`PBSjob.sh<programming/examples/example3/PBSjob.sh>` for POYRAZ


.. tabs::

   .. group-tab:: TRUBA Job Script
      .. literalinclude:: programming/examples/example3/SLURMjob.sh
         :language: C

   .. group-tab:: TRUBA-ARF Job Script
      .. literalinclude:: programming/examples/example3/SLURMARFjob.sh
         :language: C

   .. group-tab:: POYRAZ Job Script
      .. literalinclude:: programming/examples/example3/PBSjob.sh
         :language: C


Example 4: Computational time and performance
----------------------------------------------------

Number of Floating Point Operations:
   * A FLOP (floating point operation) is one arithmetic operation on floating point numbers: an add, subtract, multiply, or divide. 
   * “FLOPs” (lowercase s) is just the plural, a count of operations.
   
Computational Speed:
   * FLOPS (capital S), better written FLOP/s, means floating point operations per second. 
   * FLOP/s is a rate that measures computing speed:

      FLOP/s = (number of floating point operations) / (wall clock time in seconds)

   * The result is usually scaled with prefixes such as MFLOP/s (10⁶), GFLOP/s (10⁹), TFLOP/s (10¹²), and PFLOP/s (10¹⁵). 
   * So “3 GFLOP/s” means the loop completed about three billion floating point operations each second.
   * Divisions, square roots, and functions like exp or sin cost many more clock cycles than an add.

Theoretical Peak Speed:
   * Theoretical peak: A processor’s peak rate is 

      number of cores × clock frequency × FLOPs per cycle per core

Computational Time Measurement:
   * Measured performance is usually well below the theoretical peak.
   * Each language uses its own wall-clock timer:

      C: clock_gettime(CLOCK_MONOTONIC)

      Fortran: system_clock with 64-bit integers, so the counter doesn’t overflow
      
      Python: time.perf_counter()
      
      MATLAB: tic/toc

Computational Performance:
   * Compiler optimization levels can be compared to test the computational performance, e.g., -O0 (no optimization) and -O2.
   * The array length n can be increased to test how the performance depends on problem size. 
   * If the total operation count for the given example is 2·n·nrep (y(i) = y(i) + a*x(i)), this kernel does only 2 FLOPs per 24 bytes of memory traffic. 
   * Once the arrays no longer fit in cache, the data must come from main memory, and the computational speed (GFLOP/s) drops. 
   * The performance is limited by memory bandwidth rather than by arithmetic speed.
   * A code whose speed is limited by how fast data can be moved to and from memory is called memory-bound.
   * A code whose speed is limited by how fast the processor can do arithmetic is called compute-bound.


How to COMPILE and RUN the CODES:
----------------------------------

To compile C or Fortran codes:

.. code-block:: bash

	$ gcc -c freefall.c              // Output object file : freefall.o
	$ gcc freefall.c -o freefall     // Output executable file : freefall
	$ gcc freefall.c                 // Output executable file : a.out

	$ gfortran -c freefall.f90           // Output object file : freefall.o
	$ gfortran freefall.f90 -o freefall  // Output executable file : freefall
	$ gfortran freefall.f90              // Output executable file : a.out

-------------

EXAMPLE 1:

.. code-block:: bash

  $ make -f Makefile.serial
  gcc  hello.c -o hello
  $ ./hello
  Hello World...

.. code-block:: bash
   
  $ make -f MakefileF.serial
  gfortran  hello.f90 -o helloF
  $ ./helloF
   Hello World...

-------------

EXAMPLE 3:

.. code-block:: bash

  $ make -f Makefile.parallel
  mpicc  hellompi.c -o hellompi
  $ mpirun -np 2 hellompi
  Hello World from task            0 on local
  Hello World from task            1 on local

  $ sbatch SLURMARFjob.sh
  $ squeue

.. code-block:: bash

  $ make -f MakefileF.parallel
  mpif90  hellompi.f90 -o hellompiF
  $ mpirun -np 2 hellompiF
   Hello World from task            0 on local
   Hello World from task            1 on local

  $ sbatch SLURMARFjob.sh
  $ squeue
