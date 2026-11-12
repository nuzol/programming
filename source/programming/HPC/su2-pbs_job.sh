#!/bin/bash	
# Job Script for Poyraz
# To submit:                    $ qsub su2_job.sh
# To check the que:             $ qstat
# To check the output:          $ tail -f pbs-job_ID.out
# To kill the job               $ qdel job_ID

#PBS -A userid                  # user account name
#PBS -N su2rotor                # job name
#PBS -l nodes=1:ppn=8           # number of nodes:number of processors
#PBS -l walltime=04:00:00       # max run time

cd /cfd/userid/SU2/run/         # Go to the run directory
#PBS -o pbs.out
#PBS -e pbs.err

mpirun -np 8 SU2_CFD rotor.cfg
