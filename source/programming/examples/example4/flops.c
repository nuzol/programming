/* ---------------------------------------------------------------------
   flops.c  --  Measuring floating point performance (FLOP/s) in C
   METU AEE 305 - Numerical Methods, Fall 2026

   Kernel (repeated nrep times over arrays of length n):
         y(i) = y(i) + a*x(i)      -> 1 multiply + 1 add = 2 FLOPs
   Total FLOPs = 2 * n * nrep

   Compile and run:
     gcc -O2 flops.c -o flops_c && ./flops_c
     gcc -O0 flops.c -o flops_c && ./flops_c     (compare: no optimization)
   --------------------------------------------------------------------- */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* wall clock time in seconds */
double wall_time(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + 1.0e-9*ts.tv_nsec;
}

int main(void)
{
    const int n    = 1000000;     /* array length                  */
    const int nrep = 200;         /* how many times we sweep       */
    const double a = 1.0e-3;
    double *x = malloc(n*sizeof(double));
    double *y = malloc(n*sizeof(double));
    long long nflop = 0;          /* floating point operation count */
    double t0, t1, elapsed, checksum = 0.0;
    int i, k;

    for (i = 0; i < n; i++) {     /* initialize (not timed) */
        x[i] = 1.0 + (double)i/n;
        y[i] = 0.0;
    }

    t0 = wall_time();
    for (k = 0; k < nrep; k++) {
        for (i = 0; i < n; i++)
            y[i] = y[i] + a*x[i];
        nflop += 2LL*n;           /* 2 FLOPs per element per sweep */
    }
    t1 = wall_time();
    elapsed = t1 - t0;

    /* use the result so the compiler cannot skip the loop */
    for (i = 0; i < n; i++) checksum += y[i];

    printf("C code\n");
    printf("  n, nrep         = %d, %d\n", n, nrep);
    printf("  FLOP count      = %lld\n", nflop);
    printf("  wall clock time = %.4f s\n", elapsed);
    printf("  performance     = %.3f GFLOP/s\n", nflop/elapsed/1.0e9);
    printf("  checksum        = %.6e\n", checksum);

    free(x); free(y);
    return 0;
}
