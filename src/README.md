# Content
In this folder you will find five .f90 files. For a figure of the file structure, see report.pdf in the parent folder. The main.f90 file includes the main program. It depends on all four other files. In initialize_mod.f90, the module initialize, that includes functions and subroutines related to the initialization of the values of the variables in main.90, is defined. This module depends on params_mod.90, update_mod.f90, and io_mod.90. In io_mod.90, the module io is defined. This module is responsible for input and output. In update_mod.90, the module update is defined. This module includes functions and subroutines that update the values of the variables in main.f90 during the simulation. Finally, in params_mod.90, the module params is defined. Here, all the parameters that the other files use are defined. Also included is the compiled executable called simulation.

# Compilation instructions
The program can be compiled with the following command:

make

This creates the executable called simulation that can then be executed according to the instruction found in the README.md file in the /run folder. If you do not want to use make you can also compile the program with the following commands:

gfortran -c params_mod.f90 io_mod.f90 update_mod.f90 initialize_mod.f90 main.f90

gfortran params_mod.o io_mod.o update_mod.o initialize_mod.o main.o
If you want to remove all *.mod and *.o files this can be done either with:

make clean

or

rm -f *.o

rm -f *.mod
