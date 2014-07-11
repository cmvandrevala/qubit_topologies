Mobius Qubits
=============


Background
----------
This is a simple Matlab program to simulate the macroscopic properties of spin qubits in the [Ising model]("http://en.wikipedia.org/wiki/Ising_model").  It uses a [Monte Carlo simulation]("http://en.wikipedia.org/wiki/Monte_Carlo_method") to estimate the state of the system as a function of temperature.  This code is based off the analysis done by Tobin Fricke in 2006.  A pdf copy of his report is saved in the directory labeled "papers" for reference.  I expand on his work by analyzing qubits on a toroid, a Klein bottle, and a "double Klein bottle".  


Input
-----
The parameters for the simulation are listed in "lib/declare_parameters.m".  They are:

* boltzmans\_constant: The constant k, set to one.
* interaction\_strength: The constant J, set to one.
* maximum\_temperature: The maximum temperature tested, in Kelvins.
* number\_of\_random\_temperatures\_to\_test: Number of data points in the Monte Carlo simulation.
* cells\_on\_side\_of\_grid: The length dimension of the grid.
* number\_of\_potential\_spin\_flips: Number of spin flips within each step of the simulation.


Output
------
The files "lib/TorIsing", "lib/KleinIsing", and "lib/TwistIsing" plot the energy per site, the magnetization per site, and the temperature of the system for the toroid, Klein bottle, and "double Klein bottle" repsectively.


Results
-------
After running the simulations a few times, I have come to the conclusion that the three different topologies do not greatly influence the magnetization or energy curves that we see.  I predict that the reason for this is the fact that the qubits are unaware of a boundary in any of the topologies due to symmetry.  Thus, a qubit near the "edge" of any of these topologies should be indistinguishable from one in the "bulk" of the material.
