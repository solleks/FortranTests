module legendre_test
  use legendre
  implicit none

  public run

contains

  subroutine run()
    integer :: l
    integer :: m
    real :: x

    print *, 'Run Legendre tests'

    do l = 0, 4
       do m = 0, l
          print *, 'P(', l, ',', m, ',', 0.0, ')', evaluate(l, m, 0.0)
          print *, 'P(', l, ',', m, ',', 0.25, ')', evaluate(l, m, 0.25)
          print *, 'P(', l, ',', m, ',', 0.5, ')', evaluate(l, m, 0.5)
          print *, 'P(', l, ',', m, ',', 1.0, ')', evaluate(l, m, 1.0)
          print *, ''
       end do
    end do

  end subroutine run

end module legendre_test
