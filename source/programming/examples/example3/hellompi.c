// -----------------------
// AEE 724 - Nilay Sezer Uzol, Fall 2024
// Example 3: Hello World - Parallel with MPI
// C code : hellompi.c
// Compile: mpicc hello.c -o hellompi
// Run: mpirun -np 2 hellompi
// -----------------------
#include "stdio.h"

#include "mpi.h"
#define MASTER 0

int main(int argc, char** argv) {

int numtasks, taskid, len;
char hostname[MPI_MAX_PROCESSOR_NAME];

// Initialize MPI
MPI_Init(&argc, &argv);
MPI_Comm_size(MPI_COMM_WORLD, &numtasks);
MPI_Comm_rank(MPI_COMM_WORLD, &taskid);
MPI_Get_processor_name(hostname, &len);

// Print a hello world message
printf("Hello World from task %d on %s! \n", taskid, hostname);

MPI_Barrier(MPI_COMM_WORLD);

if (taskid == MASTER)
    printf("MASTER: Number of MPI tasks is: %d \n", numtasks);

// Finalize MPI
MPI_Finalize();

return 0;
}
// -----------------------
