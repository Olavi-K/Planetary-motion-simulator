#Fortran compiler 
FC = gfortran

#Source files
SOURCES = params_mod.f90 io_mod.f90 update_mod.f90 initialize_mod.f90 main.f90 
OBJECTS = $(subst .f90,.o,$(SOURCES))

#Final executable
PROGRAM = simulation

$(PROGRAM): $(OBJECTS)
	$(FC) -o $(PROGRAM) $^

## compilation rules
%.o %.mod: %.f90
	$(FC) -c -o $*.o $<
	@touch $(PROGRAM)

update_mod.o: params_mod.mod
io_mod.o: params_mod.mod
initialize_mod.o: params_mod.mod update_mod.mod
main.o: params_mod.f90 io_mod.mod update_mod.mod initialize_mod.mod


.PHONY: clean
clean: 
	rm -rf *.o *.mod $(PROGRAM)