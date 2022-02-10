
all:	run_tests

SYSTEM_LIB = /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib

legendre.o:	legendre.f90
	ifort -c legendre.f90

legendre_test.o:	legendre_test.f90 legendre.o
	ifort -c legendre_test.f90

run_tests:	run_tests.f90 legendre_test.o legendre.o
	ifort -o run_tests run_tests.f90 legendre_test.o legendre.o -L$(SYSTEM_LIB)


clean:
	rm run_tests
	rm legendre.o legendre.mod
	rm legendre_test.o legendre_test.mod

