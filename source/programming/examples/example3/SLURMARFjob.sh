#!/bin/bash
# SLURM Job Script for TRUBA ARF
# To submit:                   $ sbatch SLURM_job.sh
# To check the queue:          $ squeue
# To check the output:         $ tail -f slurm-job_ID.out
# To kill the job:             $ scancel job_ID
#
# SBATCH -A nilay              # user account name
# SBATCH -J hellompi           # job name
# SBATCH -p orfoz              # partition name: debug, hamsi, orfoz ...
# SBATCH -N 1                  # number of nodes (-N)
# SBATCH -n 110                # total number of tasks (-n)
# SBATCH --ntasks-per-node=110 # tasks per node
# SBATCH --cpus-per-task=1     # processors per task
# SBATCH --time=0-00:10:00     # max run time (DD-HH:MM:SS)
# SBATCH -C weka               # constraint
#
# SBATCH --nodes=2             # -N
# SBATCH --ntasks=220          # -n
# SBATCH --ntasks-per-node=110
# SBATCH --cpus-per-task=1
# -----------------------------

#SBATCH -A nilay
#SBATCH -J hellompi
#SBATCH -p orfoz
#SBATCH -N 1
#SBATCH -n 110
#SBATCH --time=0-00:10:00
#SBATCH -C weka

# working directory
#SBATCH --workdir=/arf/home/nilay/aee724/example3
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF CORES $SLURM_NTASKS"

# export OMP_NUM_THREADS=1
# module purge
# module load lib/openmpi/5.0.0

mpirun -np 110 hellompi
