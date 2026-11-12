// -----------------------
// AEE 724 - Nilay Sezer Uzol
// Example 4: Send Receive
// C code : sendreceivempi.c
// Compile: mpicc sendreceivempi.c -o sendreceivempi
// Run: mpirun -np 2 sendreceivempi
// -----------------------
#include "stdio.h"

#include "mpi.h"
#define MASTER 0

int main(int argc, char** argv) {

int n, i, j;
int sender, receiver;
int numtasks, taskid, len;
char hostname[MPI_MAX_PROCESSOR_NAME];
MPI_Status status;

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

// MPI Send/Receive
receiver = 0;

for (i = 0; i < 10; i++) {
    sender = (i%(numtasks-1)) + 1;    // skip 0 as sender

    if(taskid == receiver) {
        MPI_Recv(&j, 1, MPI_INTEGER, sender, 0, MPI_COMM_WORLD, &status);
        printf("%d %d %d \n", i, j, sender);
        }
    else if (taskid == sender) {
        MPI_Send(&i, 1, MPI_INTEGER, receiver, 0, MPI_COMM_WORLD);
        }
    }

// Finalize MPI
MPI_Finalize();

return 0;
}
// -----------------------
