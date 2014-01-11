Mobius Qubits
=============

Background
----------
This is a simple Matlab code to simulate the Ising model on a toroid, a Klein bottle, and a "double Klein bottle".  This code is based heavily off the analysis and report done by Tobin Fricke (2006).  A pdf copy of the report is saved along with the code for reference.

Picture of Each Setup
---------------------

--->---
|     |
^     ^
|     |
--->---
Toroid

---<---
|     |
^     ^
|     |
--->---
Klein Bottle

--->---
|     |
/\   \/
|     |
---<---
"Double" Klein Bottle


Output
------
The output of the code plots the energy per site, the magnetization per site, and the temperature of the system in different ways.  By default the values of J (the coupling constant) and K (Boltzman's constant) are set to one.  They can be changed within each simulation file.

Results
-------

After running the simulations a few times, I have come to the conclusion that the topology of the system (i.e. the boundary conditions) do not greatly influence the magnetization or energy curves that we see.
