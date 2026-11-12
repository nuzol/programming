============================================================
Fortran
============================================================

.. toctree::
   :caption: Fortran
   :maxdepth: 2

   Fortran/Notes/FortranNotes.rst

----------

Sample Fortran Codes
--------------------------

* **Algebraic Equations / ODEs:**
	* :download:`freefall.f90 <Fortran/Codes/freefall.f90>`


* **To compile Fortran codes:**

.. code-block:: bash

	$ gfortran -c freefall.f90              // Output object file : freefall.o
	$ gfortran -o freefall freefall.f90     // Output executable file : freefall
	$ gfortran freefall.f90                 // Output executable file : a.out
