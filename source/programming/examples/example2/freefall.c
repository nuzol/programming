// -----------------------
// C-FILE
// Example 2: Free Falling Body
// C code: freefall.c
// Compile: gcc freefall.c -o freefall
// -----------------------
#include "stdio.h"
#include "math.h"

int main(int argc, char** argv) {

// Type Declarations:
int i, N = 21;
float g, m, cd, dt, t[21], v[21];

// Inputs:
g = 9.81e0;		// gravity
m = 70.0e0;		// mass
cd = 0.25e0;	// drag coefficient
dt = 2.0e0;		// time step

// Computations: Do-Loop & Arrays
for(i = 0; i < N; i++) {
    t[i] = (i)*dt;
    v[i] = sqrt(g*m/cd) * tanh(sqrt(g*cd/m) * t[i]);
    }

// Writing Output:
for(i = 0; i < N; i++) {
    printf("%9.7f   %9.7f \n", t[i], v[i]);
    }

printf("Done! \n");

return 0;
}
// -----------------------
