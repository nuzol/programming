#!/bin/bash
#SBATCH -p orfoz
#SBATCH -A nsuzol
#SBATCH -J openmpi-test
#SBATCH --nodes=1
#SBATCH --ntasks=110
#SBATCH --cpus-per-task=1
#SBATCH -C weka
# #SBATCH --ntasks-per-node=110
#SBATCH --time=0-00:30:00
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

export OMP_NUM_THREADS=1

echo "SLURM_NODELIST $SLURM_NODELIST"
echo "NUMBER OF TASKS $SLURM_NTASKS"

module purge

# module load lib/openmpi/4.0.5
# mpicc mpi-hello.c -o mpi-hello

module load lib/openmpi/5.0.0
mpicc mpi-hello.c -o mpi-hello

# module load oneapi
# mpiicx mpi-hello.c -o mpi-hello

mpirun -np $SLURM_NTASKS ./mpi-hello

exit

