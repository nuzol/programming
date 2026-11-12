============================================================
C
============================================================

.. toctree::
   :caption: C
   :maxdepth: 2

   C/Notes/CNotes.rst

----------

Sample C Codes
--------------------------

* **Algebraic Equations / ODEs:**
	* :download:`freefall.c <C/Codes/freefall.c>`

* **To compile C codes:**

.. code-block:: bash

	$ gcc -c freefall.c              // Output object file : freefall.o
	$ gcc -o freefall freefall.c     // Output executable file : freefall
	$ gcc freefall.c                 // Output executable file : a.out
