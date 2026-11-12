// C-FILE
// Free-falling body

#include <stdio.h>
#include <math.h>

int main() {

// Type Declarations:
int i, N = 21;
double g, m, cd, dt, t[21], v[21];

// Inputs:
g = 9.81e0;		// gravity
m = 70.0e0;		// mass
cd = 0.25e0;		// drag coefficient
dt = 2.0e0;		// time step

// Computations: Do-Loop & Arrays
for (i = 0; i < N; i++){
    t[i] = ((double) (i)) * dt;
    v[i] = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t[i]);
}

// Writing Output:
for (i = 0; i < N; i++){
    printf("%f %f \n",t[i], v[i]);
}

printf("Done! \n");

return 0;
}