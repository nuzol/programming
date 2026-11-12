#!/bin/bash
# SLURM Job Script for TRUBA
# To submit:                   $ sbatch SLURM_job.sh
# To check the queue:          $ squeue
# To check the output:         $ tail -f slurm-job_ID.out
# To kill the job:             $ scancel job_ID
#
# SBATCH -A nilay              # user account name
# SBATCH -J hellompi           # job name
# SBATCH -p debug              # partition name: debug, hamsi ...
# SBATCH -N 1                  # number of nodes (-N)
# SBATCH -n 16                 # total number of tasks / cores (-n / -c)
# SBATCH --time=0-00:10:00     # max run time (DD-HH:MM:SS)
# SBATCH --constraint=barbun   # constraint: barbun, hamsi ...
# -----------------------------

#SBATCH -A nilay
#SBATCH -J hellompi
#SBATCH -p debug
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=0-00:10:00

# working directory
#SBATCH --workdir=/truba/home/nilay/aee724/example3
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

mpirun -np $SLURM_NTASKS hellompi
