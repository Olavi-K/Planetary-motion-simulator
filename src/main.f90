program main
   use initialize
   implicit none
   real(kind = rk), allocatable :: x(:), y(:), z(:), m(:), vx(:), vy(:), vz(:), ax(:), ay(:), az(:), fx(:), fy(:), fz(:)
   real(kind = rk) :: dt

   !Initialize variables
   call initialize_all(x, y, z, vx, vy, vz, ax, ay, az, fx, fy, fz, m, dt)

   !Initialize files
   open(1, file = "output.dat", iostat = ios, status = "replace")

   if (ios /= 0) then
      print *, "Error opening file."
      stop
   end if

   call init_ovito()
   call print_ovito(x, y, z, 0.0_8)

   write(1,*) x
   write(1,*) y
   write(1,*) z

   call print_status(x, y, z, 0, 1)

   !Main iteration
   do i = 1, n_iter
      !Update variables
      call update_all(x, y, z, vx, vy, vz, ax, ay, az, fx, fy, fz, m, dt)
      !Write to file
      if (mod(i, n_output) == 0) then
         write(1,*) x
         write(1,*) y
         write(1,*) z
         call print_ovito(x, y, z, i*dt)
      end if
      !Write to terminal
      if (mod(i, n_print) == 0) then
         call print_status(x, y, z, i, i/n_output + 1)
      end if
   end do

   close(1)

   call print_status(x, y, z, i - 1, (i-1)/n_output + 1)

end program main
