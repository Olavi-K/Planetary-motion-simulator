module io
   use params
   implicit none

contains

   !Print message to terminal
   subroutine print_status(x, y, z, i, k)
      real(kind = rk) :: x(n), y(n), z(n)
      integer(kind = ik) :: i, k

      print *, "Number of objects: ", n
      print *, "Number of steps completed: ", i
      print *, "Number of values written to file: ", k
      print *, "Position of objects: "
      do j = 1, n
         print *, x(j), y(j), z(j)
      end do
      print *, ""

   end subroutine print_status

   !Error message due to incorrectly formatted input file
   subroutine input_error()

      print *, "Error reading input. Correct format: "
      print *, "n"
      print *, "x1 x2 ... xn"
      print *, "y1 y2 ... yn"
      print *, "z1 z2 ... zn"
      print *, "vx1 vx2 ... vxn"
      print *, "vy1 vy2 ... vyn"
      print *, "vz1 vz2 ... vzn"
      print *, "m1 m2 ... mn"
      print *, "dt"
      print *, "n_iter"
      print *, "n_print"
      print *, "n_output"

   end subroutine input_error

   !Initialize .xyz output file
   subroutine init_ovito()

      open(2, file = "output.xyz", iostat = ios, status = "replace")

      if (ios /= 0) then
         print *, "Error opening file."
         stop
      end if

      close(2)

   end subroutine init_ovito

   !Print to .xyz output file
   subroutine print_ovito(x, y, z, time)
      real(kind = rk) :: x(n), y(n), z(n), time
      character(len = 80) :: labels
      labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" !To distinguish all objects in ovito

      open(2, file = "output.xyz", iostat = ios, position = "append", status = "old")

      if (ios /= 0) then
         print *, "Error opening file."
         stop
      end if

      write(2,*) n

      write(2,*) "Time: ", time

      !If there are over 27 objects, the labels start repeating.
      !If you want, you can add more labels.
      do j = 1, n
         write(2,*) labels(mod(j,27):mod(j,27)), x(j), y(j), z(j)
      end do

      close(2)

   end subroutine print_ovito

end module io
