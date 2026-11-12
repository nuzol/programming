# Python-FILE
# Free-falling body
#

#!/usr/bin/python3

import math
import numpy as np

# Type Declarations:
N = 21;
t = np.zeros((1,N))
v = np.zeros((1,N))

# Inputs:
g = 9.81e0		# gravity
m = 70.0e0		# mass
cd = 0.25e0		# drag coefficient
dt = 2.0e0		# time step

# Computations:
for i in range(0, N):
	t[0,i] = (i) * dt
	v[0,i] = math.sqrt(g*m/cd)*math.tanh(math.sqrt(g*cd/m)*t[0,i])

# Writing Output:
for i in range(0, N):
    print (t[0,i], v[0,i])

print ("Done!")
