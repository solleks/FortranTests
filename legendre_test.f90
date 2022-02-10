module legendre_test
  use legendre
  implicit none

  public run

contains

  subroutine run()
    integer :: i
    integer :: l
    integer :: m
    real :: xs(4)

    xs = [0.0, 0.25, 0.5, 1.0]

    print *, 'Run Legendre tests'

    do l = 0, 4
       do m = 0, l
          do i = 1, 4
             print *, 'P(', l, ',', m, ',', xs(i), ')', evaluate(l, m, xs(i))
          end do
          print *, ''
       end do
    end do

  end subroutine run

end module legendre_test
