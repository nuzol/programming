! ---------------------------------------------------------------------
!  flops.f90  --  Measuring floating point performance (FLOP/s) in Fortran
!  METU AEE 305 - Numerical Methods, Fall 2026
!
!  Kernel (repeated nrep times over arrays of length n):
!        y(i) = y(i) + a*x(i)      -> 1 multiply + 1 add = 2 FLOPs
!  Total FLOPs = 2 * n * nrep
!
!  Compile and run:
!    gfortran -O2 flops.f90 -o flops_f && ./flops_f
!    gfortran -O0 flops.f90 -o flops_f && ./flops_f   (compare: no optimization)
! ---------------------------------------------------------------------
program flops
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer, parameter :: i8 = selected_int_kind(18)    ! 64-bit integer
  integer,  parameter :: n = 1000000, nrep = 200
  real(dp), parameter :: a = 1.0e-3_dp
  real(dp), allocatable :: x(:), y(:)
  integer(i8) :: nflop, count0, count1, count_rate
  real(dp)    :: elapsed, checksum
  integer     :: i, k

  allocate(x(n), y(n))
  do i = 1, n                         ! initialize (not timed)
     x(i) = 1.0_dp + real(i-1,dp)/n
     y(i) = 0.0_dp
  end do
  nflop = 0

  call system_clock(count0, count_rate)   ! wall clock start
  do k = 1, nrep
     do i = 1, n
        y(i) = y(i) + a*x(i)
     end do
     nflop = nflop + 2_i8*n               ! 2 FLOPs per element per sweep
  end do
  call system_clock(count1)               ! wall clock end
  elapsed = real(count1 - count0, dp)/real(count_rate, dp)

  checksum = sum(y)                       ! use the result

  print '(A)',            'Fortran code'
  print '(A,I8,A,I5)',    '  n, nrep         = ', n, ',', nrep
  print '(A,I12)',        '  FLOP count      = ', nflop
  print '(A,F10.4,A)',    '  wall clock time = ', elapsed, ' s'
  print '(A,F10.3,A)',    '  performance     = ', nflop/elapsed/1.0e9_dp, ' GFLOP/s'
  print '(A,ES14.6)',     '  checksum        = ', checksum

  deallocate(x, y)
end program flops
