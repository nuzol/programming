============================================================
Compiling and Running SU2 CFD Solver on Poyraz
============================================================

(*Updated on June 2021*)

1. Download SU2 7.1.1 from Github to the SU2 directory you created under your account on hpc as:

.. code-block:: bash
 
	$ pwd
	/home/userid/SU2/
	$ ls
	su2code-SU2-v7.1.1-0-gaec088c.tar.gz
	$ tar -xvf su2code-SU2-v7.1.1-0-gaec088c.tar.gz
	$ mv su2code-SU2-v7.1.1-0-gaec088c SU2-v7.1.1-0
	$ ls
	SU2-v7.1.1-0
	su2code-SU2-v7.1.1-0-gaec088c.tar.gz

2. You may also use already installed versions from /opt directory:

.. code-block:: bash
 
	$ pwd
	/home/userid/
	$ ls /opt/SU2*
	SU2-6.2.0/

or install SU2 into your account and run as described below.

3. Install SU2 (you can force to reconfigure as below), run the meson script as:

.. code-block:: bash
 
	$ python3 meson.py --reconfigure build -Denable-autodiff=true --prefix=/truba/home/userid/SU2/SU2-v7.1.1-0

4. Make ninja as executable if it is not so:

.. code-block:: bash
	
	$ chmod +x ninja or ninja.sh

5. Continue to install SU2, run the ninja script as:

.. code-block:: bash
	
	$ ./ninja -C build install

6. Update ".bashrc" or ".bash_profile" file with SU2 paths (the last rows after ninja install, commands given below)(write your own userid!)

.. code-block:: bash
	
	$ more .bash_profile
	# Setting PATH for SU2
	export SU2_RUN=/users/userid/SU2/SU2-v7.1.1-0/bin
	export SU2_HOME=/users/userid/SU2/SU2-v7.1.1-0
	export PATH=$PATH:$SU2_RUN
	export PYTHONPATH=$PYTHONPATH:$SU2_RUN 

write these into the ".bash_profile" file and load them as:

.. code-block:: bash
 
	$ source .bash_profile

7. Run the code (serial) on the command line under the /cfd directory as:

.. code-block:: bash
	
	$ pwd
	/cfd/userid/SU2/
	$ mkdir run
	$ cd run
	$ ls
	input.cfg
	mesh.su2
	$ SU2_CFD input.cfg

or use a makerun script to run:

.. code-block:: bash
 	
 	$ more makerun
 	SU2_CFD input.cfg
 	$ ./makerun

or submit a pbs job script su2_job.sh (with upto 64 cores on 1 node) to run serial or parallel:

.. code-block:: bash
 	
 	$ chmod +x su2_job.sh

or edit the job script and submit & check the que and job output

.. code-block:: bash
 	
 	$ qsub su2_job.sh
 	$ qstat
 	$ tail -f pbs.out
 	$ qdel job_ID

8. Sample job script:

	* :download:`su2_job.sh<example3/su2-pbs_job.sh>`

.. code-block:: bash
	
	$ more su2_job.sh
	#!/bin/bash	
	# Job Script for Poyraz
	# To submit:            $ qsub su2_job.sh
	# To check the que:     $ qstat
	# To check the output:  $ tail -f pbs-job_ID.out
	# To kill the job       $ qdel job_ID
	
	#PBS -A userid			# user account name
	#PBS -N su2rotor		# job name
	#PBS -l nodes=1:ppn=8		# number of nodes:number of processors
	#PBS -l walltime=04:00:00	# max run time
	
	cd /cfd/userid/SU2/run/		# Go to the run directory
	#PBS -o pbs.out
	#PBS -e pbs.err
	
	mpirun -np 8 SU2_CFD rotor.cfg
