# ---------------------------------------------------------------------
#  flops.py  --  Measuring floating point performance (FLOP/s) in Python
#  METU AEE 305 - Numerical Methods, Fall 2026
#
#  Kernel (repeated nrep times over arrays of length n):
#        y[i] = y[i] + a*x[i]      -> 1 multiply + 1 add = 2 FLOPs
#  Total FLOPs = 2 * n * nrep
#
#  Two versions are timed:
#    1) explicit Python loop  (interpreted, very slow -> smaller problem)
#    2) NumPy vectorized       (loop runs in compiled C code)
#
#  Run:  python3 flops.py
# ---------------------------------------------------------------------
import time
import numpy as np

a = 1.0e-3

def report(name, n, nrep, nflop, elapsed, checksum):
    print(name)
    print(f"  n, nrep         = {n}, {nrep}")
    print(f"  FLOP count      = {nflop}")
    print(f"  wall clock time = {elapsed:.4f} s")
    print(f"  performance     = {nflop/elapsed/1e9:.3f} GFLOP/s")
    print(f"  checksum        = {checksum:.6e}")

# ---- 1) explicit loop ------------------------------------------------
n, nrep = 1_000_000, 5                     # fewer sweeps: pure Python is slow
x = [1.0 + i/n for i in range(n)]
y = [0.0]*n
nflop = 0

t0 = time.perf_counter()                   # wall clock start
for k in range(nrep):
    for i in range(n):
        y[i] = y[i] + a*x[i]
    nflop += 2*n                           # 2 FLOPs per element per sweep
elapsed = time.perf_counter() - t0         # wall clock end
report("Python code (explicit loop)", n, nrep, nflop, elapsed, sum(y))

# ---- 2) NumPy vectorized ---------------------------------------------
n, nrep = 1_000_000, 200
x = 1.0 + np.arange(n)/n
y = np.zeros(n)
nflop = 0

t0 = time.perf_counter()
for k in range(nrep):
    y += a*x                               # whole-array operation
    nflop += 2*n
elapsed = time.perf_counter() - t0
report("Python code (NumPy vectorized)", n, nrep, nflop, elapsed, y.sum())
