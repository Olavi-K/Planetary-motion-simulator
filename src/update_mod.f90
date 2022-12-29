module update
   use params
   implicit none

contains

   !Functions that update a single variable
   function update_position(x, v, a, dt) result(new_x)
      real(kind = rk), intent(in) :: x(n), v(n), a(n), dt
      real(kind = rk) :: new_x(n)

      new_x = x + v*dt + 0.5*a*dt**2

      return

   end function update_position

   function update_velocity(v, a_old, a_new, dt) result(new_v)
      real(kind = rk), intent(in) :: v(n), a_old(n), a_new(n), dt
      real(kind = rk) :: new_v(n)

      new_v = v + 0.5*(a_old + a_new)*dt

      return

   end function update_velocity

   function update_acceleration(f, m) result(new_a)
      real(kind = rk), intent(in) :: f(n), m(n)
      real(kind = rk) :: new_a(n)

      new_a = f/m

      return

   end function update_acceleration

   function update_force(x, y, z, m) result(new_f)
      real(kind = rk), intent(in) :: x(n), y(n), z(n), m(n)
      real(kind = rk) :: new_f(n), temp_f

      do k = 1, n
         temp_f = 0
         do j = 1, n
            if (k == j) then
               continue
            else
               temp_f = temp_f + G * m(k) * m(j) * (x(j) - x(k)) / ((x(j) - x(k))**2 + (y(j) - y(k))**2 + (z(j) - z(k))**2)**(1.5)
            end if
         end do
         new_f(k) = temp_f
      end do

   end function update_force

   !Updates all variables using functions defined above
   subroutine update_all(x, y, z, vx, vy, vz, ax, ay, az, fx, fy, fz, m, dt)
      real(kind = rk), intent(inout) :: x(n), vx(n), ax(n), fx(n), y(n), vy(n), ay(n), fy(n), z(n), vz(n), az(n), fz(n), m(n), dt
      real(kind = rk) :: new_x(n), new_vx(n), new_ax(n), new_fx(n), new_y(n), new_vy(n), new_ay(n), new_fy(n),&
         new_z(n), new_vz(n), new_az(n), new_fz(n)

      new_x = update_position(x, vx, ax, dt)
      new_y = update_position(y, vy, ay, dt)
      new_z = update_position(z, vz, az, dt)

      new_fx = update_force(new_x, new_y, new_z, m)
      new_fy = update_force(new_y, new_z, new_x, m)
      new_fz = update_force(new_z, new_x, new_y, m)

      new_ax = update_acceleration(fx, m)
      new_ay = update_acceleration(fy, m)
      new_az = update_acceleration(fz, m)

      new_vx = update_velocity(vx, ax, new_ax, dt)
      new_vy = update_velocity(vy, ay, new_ay, dt)
      new_vz = update_velocity(vz, az, new_az, dt)

      x = new_x
      vx = new_vx
      ax = new_ax
      fx = new_fx

      y = new_y
      vy = new_vy
      ay = new_ay
      fy = new_fy

      z = new_z
      vz = new_vz
      az = new_az
      fz = new_fz

   end subroutine update_all

end module update
