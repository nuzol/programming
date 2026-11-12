#!/bin/bash
# PBS Job Script for Poyraz
# To submit:                   $ qsub PBS_job.sh
# To check the queue:          $ qstat
# To check the output:         $ tail -f pbs-job_ID.out
# To kill the job              $ qdel job_ID
#
# PBS -A nilay                 # user account name
# PBS -N hellompi              # job name
# PBS -l nodes=1:ppn=64        # number of nodes:number of processors
# PBS -l walltime=00:10:00     # max run time (HH:MM:SS)
# -----------------------------

#PBS -A nilay
#PBS -N hellompi
#PBS -l nodes=1:ppn=64
#PBS -l walltime=00:10:00

# go to the run directory
cd /users/nilay/aee724/example3/
#PBS -o pbs.out
#PBS -e pbs.err

mpirun -np 2 hellompi
