// -----------------------
// AEE 724 - Nilay Sezer Uzol, Fall 2024
// Example 4: Bandwidth - Parallel with MPI
// C code : bandwidthmpi.c
// Compile: mpicc bandwidthmpi.cc -o bandwidthmpi
// Run: mpirun -np 2 bandwidthmpi
//
// Original FILE: mpi_bandwidth.c
// DESCRIPTION:
//   Provides point-to-point communications timings for any even
//   number of MPI tasks.
// AUTHOR: Blaise Barney
// LAST REVISED: 04/13/05
// -----------------------
#include "stdio.h"
#include "stdlib.h"
#include "sys/time.h"
#include "time.h"

#include "mpi.h"
#define MASTER 0

#define MAXTASKS      8192
/* Change the next four parameters */
#define STARTSIZE     1
#define ENDSIZE       10
#define INCREMENT     1
#define ROUNDTRIPS    1

int main(int argc, char** argv) {

int     n, i, j, rndtrps, nbytes, start, end, incr;
double  thistime, bw, bestbw, worstbw, totalbw, avgbw,
        bestall, avgall, worstall,
        timings[MAXTASKS/2][3], tmptimes[3],
        resolution, t1, t2;
struct 	timeval tv1, tv2;

int numtasks, taskid, len;
int src, dest, rc, tag0=0, tag1=1, tag2=2, taskpairs[MAXTASKS];
char hostname[MPI_MAX_PROCESSOR_NAME];
char msgbuf[ENDSIZE], hostmap[MAXTASKS][MPI_MAX_PROCESSOR_NAME];
MPI_Status status;

// Initialize MPI
MPI_Init(&argc, &argv);
MPI_Comm_size(MPI_COMM_WORLD, &numtasks);
if (numtasks % 2 != 0) {
    printf("ERROR: Must be an even number of tasks!  Quitting...\n");
    MPI_Abort(MPI_COMM_WORLD, rc);
    exit(0);
    }
MPI_Comm_rank(MPI_COMM_WORLD, &taskid);
MPI_Get_processor_name(hostname, &len);

// Print a hello world message
printf("Hello World from task %d on %s! \n", taskid, hostname);
MPI_Barrier(MPI_COMM_WORLD);

// Initialize
start = STARTSIZE;
end = ENDSIZE;
incr = INCREMENT;
rndtrps = ROUNDTRIPS;
for (i = 0; i < end; i++)
    msgbuf[i] = 'x';

if (taskid == MASTER)
    for (i = 0; i < end; i++)
        printf("i = %d msgbuf[i]: %c \n", i, msgbuf[i]);
MPI_Barrier(MPI_COMM_WORLD);

// All tasks send their host name to task 0:
MPI_Gather(&hostname, MPI_MAX_PROCESSOR_NAME, MPI_CHAR, &hostmap,
    MPI_MAX_PROCESSOR_NAME, MPI_CHAR, 0, MPI_COMM_WORLD);

// Determine who my send/receive partner is and tell task 0:
if (taskid < numtasks/2) {
    src = numtasks/2 + taskid;
    printf("taskid: %d & src: %d \n", taskid, src);}
if (taskid >= numtasks/2) {
    dest = taskid - numtasks/2;
    printf("taskid: %d & dest: %d \n", taskid, dest);}
MPI_Gather(&dest, 1, MPI_INT, &taskpairs, 1, MPI_INT, 0, MPI_COMM_WORLD);

if (taskid == 0) {
    resolution = MPI_Wtick();
    printf("\n******************** MPI Bandwidth Test ********************\n");
    printf("Message start size= %d bytes\n",start);
    printf("Message finish size= %d bytes\n",end);
    printf("Incremented by %d bytes per iteration\n",incr);
    printf("Roundtrips per iteration= %d\n",rndtrps);
    printf("MPI_Wtick resolution = %e\n",resolution);
    printf("************************************************************\n");
    for (i=0; i<numtasks; i++)
        printf("task %4d is on %s partner=%4d\n",i,hostmap[i],taskpairs[i]);
    printf("************************************************************\n");
    }
MPI_Barrier(MPI_COMM_WORLD);

// First half of tasks:
/* These tasks send/receive messages with their partner task, and then do a  */
/* few bandwidth calculations based upon message size and timings.           */

if (taskid < numtasks/2) {
    printf("First Half - taskid: %d \n", taskid);

    for (n=start; n<=end; n=n+incr) {
        printf("1. start = %d n = %d end = %d \n", start, n, end);

        bestbw = 0.0;
        worstbw = .99E+99;
        totalbw = 0.0;
        nbytes =  sizeof(char) * n;

        for (i=1; i<=rndtrps; i++) {
            printf("1. rndtrps n = %d i = %d \n", n, i);
            t1 = MPI_Wtime();
            MPI_Send(&msgbuf, n, MPI_CHAR, dest, tag1, MPI_COMM_WORLD);
            MPI_Recv(&msgbuf, n, MPI_CHAR, src, tag2, MPI_COMM_WORLD, &status);
            MPI_Barrier(MPI_COMM_WORLD);
            t2 = MPI_Wtime();
            thistime = t2 - t1;
            bw = ((double)nbytes * 2) / thistime;
            totalbw = totalbw + bw;
            if (bw > bestbw ) bestbw = bw;
            if (bw < worstbw ) worstbw = bw;
            }

        // Convert to megabytes per second:
        bestbw = bestbw/1000000.0;
        avgbw = (totalbw/1000000.0)/(double)rndtrps;
        worstbw = worstbw/1000000.0;

        // Task 0 collects timings from all relevant tasks:
        if (taskid == 0) {
            /* Keep track of my own timings first */
            timings[0][0] = bestbw;
            timings[0][1] = avgbw;
            timings[0][2] = worstbw;

            /* Initialize overall averages */
            bestall = 0.0;
            avgall = 0.0;
            worstall = 0.0;

            /* Now receive timings from other tasks and print results. Note */
            /* that this loop will be appropriately skipped if there are    */
            /* only two tasks. */
            for (j=1; j<numtasks/2; j++)
                MPI_Recv(&timings[j], 3, MPI_DOUBLE, j, tag0, MPI_COMM_WORLD, &status);

            printf("***Message size: %8d *** best  /  avg  / worst (MB/sec)\n",n);

            for (j=0; j<numtasks/2; j++) {
                printf("   task pair: %4d - %4d:    %4.2f / %4.2f / %4.2f \n",
                    j, taskpairs[j], timings[j][0], timings[j][1], timings[j][2]);

            bestall += timings[j][0];
            avgall += timings[j][1];
            worstall += timings[j][2];
            }

            printf("   OVERALL AVERAGES:          %4.2f / %4.2f / %4.2f \n\n",
                bestall/(numtasks/2), avgall/(numtasks/2), worstall/(numtasks/2));
        }
        else {
            /* Other tasks send their timings to task 0 */
            tmptimes[0] = bestbw;
            tmptimes[1] = avgbw;
            tmptimes[2] = worstbw;
            MPI_Send(tmptimes, 3, MPI_DOUBLE, 0, tag0, MPI_COMM_WORLD);
            }
        }
    }

// Second half of tasks:
/* These tasks do nothing more than send and receive with their partner task */
if (taskid >= numtasks/2) {
    printf("Second Half - taskid: %d \n", taskid);

    for (n=start; n<=end; n=n+incr) {
        printf("2. start = %d n = %d end = %d \n", start, n, end);
        for (i=1; i<=rndtrps; i++){
            printf("2. rndtrps n = %d i = %d \n", n, i);
            MPI_Recv(&msgbuf, n, MPI_CHAR, src, tag1, MPI_COMM_WORLD, &status);
            MPI_Send(&msgbuf, n, MPI_CHAR, dest, tag2, MPI_COMM_WORLD);
            MPI_Barrier(MPI_COMM_WORLD);
            }
        }
    }

if (taskid == MASTER)
    printf("Done! \n");

// Finalize MPI
MPI_Finalize();

return 0;
}
// -----------------------
