A simple Matlab code to simulate the Ising model on a toroid, a Klein bottle, and a
"double Klein bottle".  This code is based off the report by Tobin Fricke (2006).  A
pdf copy of the report is saved along with the code for reference.

The output of the code plots the energy per site and magnetization per site with respect 
to temperature and each other.  By default the values of J and K are set to one in this 
code.  They can be changed within each "____Ising.m" file.

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



After running the simulations a few times, I have come to the conclusion that the 
topology of the system (i.e. the boundary conditions) do not greatly influence the
magnetization or energy curves that we see.
