! -----------------------
! Fortran-FILE
! Example 2: Free Falling Body
! Fortran code: freefall.f90
! Compile: gfortran freefall.f90 -o freefall
! -----------------------
program freefall
implicit none

! Type Declarations:
integer :: i, N = 21
real :: g, m, cd, dt, t(21), v(21)

! Inputs:
g = 9.81e0		! gravity
m = 70.0e0		! mass
cd = 0.25e0		! drag coefficient
dt = 2.0e0		! time step

! Computations: Do-Loop & Arrays
do i = 1,N
    t(i) = (i-1)*dt
    v(i) = sqrt(g*m/cd) * tanh(sqrt(g*cd/m) * t(i))
end do

! Writing Output:
do i = 1,N
    print*, t(i), v(i)
end do

print*, 'Done!'

end program freefall
! -----------------------
