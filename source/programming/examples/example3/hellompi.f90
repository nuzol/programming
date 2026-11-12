! -----------------------
! AEE 724 - Nilay Sezer Uzol, Fall 2024
! Example 3: Hello World
! Fortran code : hellompi.f90
! Compile: mpif90 hellompi.f90 -o hellompi
! Run: mpirun -np 2 hellompi
! -----------------------
program hello
implicit none

include 'mpif.h'
integer, parameter :: MASTER = 0

integer :: numtasks, taskid, len, ierr
character(MPI_MAX_PROCESSOR_NAME) :: hostname

! Initialize MPI
call MPI_INIT(ierr)
call MPI_COMM_SIZE(MPI_COMM_WORLD, numtasks, ierr)
call MPI_COMM_RANK(MPI_COMM_WORLD, taskid, ierr)
call MPI_GET_PROCESSOR_NAME(hostname, len, ierr)

! Print a hello world message
write(*,*) "Hello World from task ", taskid, "on ", hostname

call MPI_BARRIER(MPI_COMM_WORLD)

if (taskid .eq. MASTER) then
  write(*,*) "MASTER: Number of MPI tasks is: ", numtasks
end if

! Finalize MPI
call MPI_FINALIZE(ierr)

end program hello
! -----------------------
