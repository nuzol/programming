! -----------------------
! AEE 724 - Nilay Sezer Uzol
! Example 4: Send Receive
! Fortran code : sendreceivempi.f90
! Compile: mpif90 sendreceivempi.f90 -o sendreceivempi
! Run: mpirun -np 2 sendreceivempi
! -----------------------
program main
implicit none

include 'mpif.h'
integer, parameter :: MASTER = 0

integer :: n, i, j
integer :: sender, receiver
integer :: numtasks, taskid, len, ierr
integer :: status(MPI_STATUS_SIZE)
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

! MPI Send/Receive
receiver = 0
do i = 1, 10
    sender = mod(i-1, numtasks-1) + 1    ! skip 0 as sender

    if(taskid == receiver) then
        call MPI_Recv(j, 1, MPI_INTEGER, sender, 0, MPI_COMM_WORLD, status, ierr)
        write(*,*) i, j, sender
    else if (taskid == sender) then
        call MPI_Send(i, 1, MPI_INTEGER, receiver, 0, MPI_COMM_WORLD, ierr)
    end if

end do

! Finalize MPI
call MPI_FINALIZE(ierr)

end program main
! -----------------------
