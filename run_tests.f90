program run_tests
  use legendre_test
  implicit none

  ! Run a set of tests of Fortran modules.
  print *, 'Run all tests'
  call run()
  
end program run_tests
