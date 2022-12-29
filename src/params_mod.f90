module params
   implicit none
   integer, parameter :: rk = selected_real_kind(10,40), ik = selected_int_kind(8) !double precision
   real(kind = rk), parameter :: G = 4*(4*atan2(1.0,1.0))**2 ! 4 pi^2 au**3 * yr**(-2) * M_Sun**(-1)
   integer(kind = ik) :: i, j, k, ios, n, n_iter, n_print, n_output
   character(len = 80) :: argu

end module params
