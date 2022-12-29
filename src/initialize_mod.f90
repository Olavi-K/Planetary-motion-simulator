module initialize
   use io
   use update
   implicit none

contains
   !Read input file
   subroutine initial_values(x, y, z, vx, vy, vz, m, dt)
      real(kind = rk), allocatable, intent(inout) :: x(:), y(:), z(:), vx(:), vy(:), vz(:), m(:)
      real(kind = rk) :: dt

      call get_command_argument(1,argu)

      open(1, file = argu, iostat = ios, status = "old")

      if (ios /= 0) then
         print *, "Error opening file."
         stop
      end if

      read(1,*, iostat = ios) n

      !Check if read was succesful
      if (ios /= 0) then
         call input_error()
         stop
      end if

      allocate(x(n), y(n), z(n), vx(n), vy(n), vz(n), m(n))

      read(1,*, iostat = ios) x, y, z, vx, vy, vz, m, dt, n_iter, n_print, n_output

      !Check if read was succesful
      if (ios /= 0) then
         call input_error()
         stop
      end if

      close(1)

   end subroutine initial_values

   !Initialize all variables
   subroutine initialize_all(x, y, z, vx, vy, vz, ax, ay, az, fx, fy, fz, m, dt)
      real(kind = rk), allocatable, intent(inout) :: x(:), y(:), z(:), vx(:), vy(:), vz(:),&
         ax(:), ay(:), az(:), fx(:), fy(:), fz(:), m(:)
      real(kind = rk) :: dt

      !Initialize values from input file
      call initial_values(x, y, z, vx, vy, vz, m, dt)

      allocate(ax(n), ay(n), az(n), fx(n), fy(n), fz(n))

      !Initialize values not given in input file
      fx = update_force(x, y, z, m)
      fy = update_force(y, z, x, m)
      fz = update_force(z, x, y, m)

      ax = fx/m
      ay = fy/m
      az = fz/m

   end subroutine initialize_all

end module initialize
