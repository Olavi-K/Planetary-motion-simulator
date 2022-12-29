# Contents
This folder contains the input files used to find the reported answers in report.pdf in the parent folder. The names of the input files describe the system that they model. This folder also contains as an example, the output for the solar-system-input.dat file and the plot.py python script for visualisation of the output. Additionally, the solar-system.gif file is included as an example of what the output.xyz files can be used for.

# Run instructions
To run the code, you need the executable simulation. The process of obtaining the executable is explained in the README.md file in the /src folder. To run the executable, if the executable is in this folder you can use the command:

./simulation input-file

or if the executable is in the /src folder:

../src/simulation input-file

where input file is the file that includes all the inputs the program needs. The input file should be formatted in the following way:

n

x1 x2 ... xn

y1 y2 ... yn

z1 z2 ... zn

vx1 vx2 ... vxn

vy1 vy2 ... vyn

vz1 vz2 ... vzn

m1 m2 ... mn

dt

n_iter

n_print

n_output

For more information on the meaning of the above variables, see the report.pdf file in the parent folder.

# Output
The program outputs two files, output.dat and output.xyz. The output.dat file can be used with the plot.py file to create 2D figures of the simulation. The output.xyz can be used with a compatible program, e.g. Ovito, to create 3D animations of the simulation.