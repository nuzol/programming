============================================================
Some Useful Linux Commands
============================================================

----------

.. code-block:: bash

    $ pwd                                  // to show Current Directory
    /Users/userid

    $ ls                                   // to list files
    Applications	Desktop		Documents

    $ mkdir mytestdir                      // to create a directory
    $ ls
    Applications	Desktop		Documents 	mytestdir

    // To create a text file called "mytextfile.txt" using vi :
    $ vi mytextfile.txt                    // to edit a file using vi

    $ cp mytextfile.txt mynewfile.txt      // to copy a file
    $ cp mytextfile.txt mytestdir/.        // to copy a file into a directory
    $ cp -p mytextfile.txt mytestdir/.     // to copy a file with its time properties
    $ cp -p -r mytestdir newtestdir        // to copy a directory

    $ mv mytextfile.txt mynewfile.txt      // move file
    $ mv mynewfile.txt newtestdir/.        // move file
    $ mv mytestdir mynewtestdir            // move directory

.. code-block:: bash

    $ cd test                              // to go into the directory
    $ ls test
    mytextfile.txt

    $ ls -al
    total 8
    drwxr-xr-x   3 userid  staff   96 Apr 20 10:57 .
    drwxr-xr-x  23 userid  staff  736 Apr 20 10:52 ..
    -rw-r--r--@  1 userid  staff   43 Apr 20 10:57 mytextfile.txt
    $ clear                                // to clear the terminal
    $ cd                                   // to go to home directory

.. code-block:: bash

    // Use TAB to fill up in terminal:
    // you just type "my" and then TAB and the terminal fills the rest up
    // makes it "mytextfile.txt"
    $ ls -al my                            // and TAB
    -rw-r--r--@  1 userid  staff   43 Apr 20 10:57 mytextfile.txt

    // Use Ctrl+C to stop any command in terminal safely.
    // If it doesn't stop with that, then Use Ctrl+Z to force stop it.
    // You can exit from the terminal by using the exit command.

.. code-block:: bash

    // To edit a text file:
    $ cat mytextfile.txt | grep Linux      // to search a keyword
    This is my notes on how to use Linux
    with some useful commands...

    $ touch myfile.txt                     // to creat a text file
    $ echo write this message into a text file >> myfile.txt
    $ vi myfile.txt                        // to edit a text file using vi
    $ cat myfile.txt
    $ locate myfile.txt
    $ more myfile.txt
    $ less myfile.txt
    $ more mytextfile.txt                  // more, less, cat
    This is my notes on how to use Linux
    with some useful commands...

    $ tail -f mytextfile.txt

.. code-block:: bash

    $ rm mytextfile.txt                    // to remove a file
    $ ls -al
    total 0
    drwxr-xr-x   3 userid  staff   96 Apr 20 10:57 .
    drwxr-xr-x  23 userid  staff  736 Apr 20 10:52 ..

    $ cd ..
    $ rmdir mytestdir                     // to remove a directory
    $ rm -r mytestdir                     // to remove a directory

.. code-block:: bash

    $ cd 	  // to go to Home directory
    $ pwd
    /Users/userid

    $ df          // to see the available disk space in your system in kbytes
    $ df -m       // to see the available disk space in your system in Mbytes
    $ du
    $ du -m       // to show Disk Usage
    $ du -hs      // to show Disk Usage
    $ du mytestdir
    $ du mytextfile.txt

.. code-block:: bash

    $ man ls      // to show help/manuals for ls
    $ ls --help   // to show help/manuals for ls
    $ passwd      // to change passwd
    $ uname -a    // to show the information about your system
    $ hostname    // to show your hostname or network IP address
    $ ping        // to check your connection to a server
    $ ping google.com

.. code-block:: bash

    // To create tar file
    $ tar -cvf mytarfile.tar mydirectory
    $ tar -cvzf mytarfile.tar.gz mydirectory
    $ tar -cvzf mytarfile.tgz mydirectory

    // To extract tar file
    $ tar -xvf mytarfile.tar
    $ tar -xvf mytarfile.tar.gz

    // To list the content of tar file
    $ tar -tvf mytarfile.tar
    $ tar -tvf mytarfile.tar.gz

    // To create/extract zip file
    $ zip myzipfile.gz mydirectory
    $ unzip myzipfile.gz

.. code-block:: bash

    // To change file permissions
    $ chmod 755 mytextfile.txt
    $ chmod 755 a.out     // to make a file executable
    $ chmod +x a.out      // to make a file executable

.. code-block:: bash

    $ xclock   // show the clock window

.. code-block:: bash

    // To compile a Fortran program:
    $ gfortran mycode.f90             // to compile a Fortran code
    $ ./a.out                         // to run a Fortran code
    $ gfortran mycode.f90 -o mycode   // to compile a Fortran code
    $ ./mycode                        // to run a Fortran code
    $ gfortran --help

.. code-block:: bash

    // To compile a C program:
    $ gcc mycode.c             // to compile a c code
    $ ./a.out                  // to run a c code
    $ gcc mycode.c -o mycode   // to compile a c code
    $ ./mycode                 // to run a c code

.. code-block:: bash

    // To compile a Python program:
    $ python mycode.py         // to run a python code

.. code-block:: bash

    // Login to your account on a remote computer:
    $ ssh userid@computerIPaddress

    // Copy a file to your account:
    $ scp -p -r mytestdir/mytextfile.txt userid@computerIPaddress:.

    // Copy a file from your account:
    $ scp userid@computerIPaddress:mytestdir/mytextfile.txt .

----------
