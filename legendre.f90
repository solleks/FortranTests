module legendre
  implicit none
  private

  ! Return the value of the renormalized associated Legendre polynomial
  ! of degree l and order m at point x.
  public evaluate

contains

  function evaluate(l, m, x) result(val)
    integer, intent(in) :: l
    integer, intent(in) :: m
    real, intent(in) :: x
    real :: val

    integer :: i
    ! Value of renormalized associated Legendre polynomial with l = m.
    real :: pmm
    ! Product of odd numbers less than or equal to 2*m - 1.
    real :: odd_fact
    ! Factor of 1 - x**2
    real :: omx2

    ! TODO: Rename these variables
    real :: oldfact
    real :: fact
    real :: pll
    real :: pnmp1
    integer :: ll

    
    real, parameter :: PI = 3.1415926535897932384626433833;

    if (m < 0 .or. m > l .or. abs(x) > 1.0) then
       print *, 'Bad arguments in legendre.evaluate'
       stop 1
    end if

    pmm = 1.0
    if (m > 0) then
       omx2 = (1.0 - x) * (1.0 + x)
       odd_fact = 1.0
       do i = 1, m
          pmm = pmm * omx2 * odd_fact / (odd_fact + 1.0)
          odd_fact = odd_fact + 2.0
       end do
    end if

    pmm = sqrt((2.0 * m + 1.0) * pmm/(4.0 * PI))

    if (and(m, 1) == 1) then
       pmm = -pmm
    end if

    if (l == m) then
       val = pmm
    else
       pnmp1 = x * sqrt(2.0 * m + 3.0) * pmm
       if (l == (m + 1)) then
          val = pnmp1
       else
          oldfact = sqrt(2.0 * m + 3.0)
          do ll = m + 2, l
             fact = sqrt((4.0 * ll * ll - 1.0)/(ll * ll - m * m))
             pll = (x * pnmp1 - pmm/oldfact) * fact
             oldfact = fact
             pmm = pnmp1
             pnmp1 = pll
          end do
          val = pll
       end if
    end if
  end function evaluate
  
end module legendre
