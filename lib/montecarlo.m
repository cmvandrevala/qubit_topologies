clear all
clf

% Initial Configuration
cells_on_side_of_grid = 10;
number_of_random_temperatures_to_test = 10;
number_of_potential_spin_flips = 10;

% Pre-calculate Values
number_of_cells = cells_on_side_of_grid^2;

% Toroidal Topology
% Periodic Boundary Conditions at All Edges
toroid_magnetic_field_per_site = [];
toroid_temperature = [];
toroid_energy_per_site = [];

% Klein Bottle Topology
% Periodic Boundary Conditions on Sides, Anti-Periodic on Top and Bottom
klein_magnetic_field_per_site = [];
klein_temperature = [];
klein_energy_per_site = [];

% "Double Twist" Klein Bottle Topology
% Anti-Periodic Boundary Conditions on All Edges
twist_magnetic_field_per_site = [];
twist_temperature = [];
twist_energy_per_site = [];


% Perform the Set of Simulations
for count = 1:number_of_random_temperatures_to_test,

  temperature = rand()*5;
  
  [total_magnetic_field, total_energy] = TorIsing(cells_on_side_of_grid, temperature, number_of_potential_spin_flips);
  toroid_magnetic_field_per_site = [toroid_magnetic_field_per_site total_magnetic_field/number_of_cells];
  toroid_energy_per_site = [toroid_energy_per_site total_energy/number_of_cells];
  toroid_temperature = [toroid_temperature temperature];
  
  [total_magnetic_field, total_energy] = KleinIsing(cells_on_side_of_grid, temperature, number_of_potential_spin_flips);
  klein_magnetic_field_per_site = [klein_magnetic_field_per_site total_magnetic_field/number_of_cells];
  klein_energy_per_site = [klein_energy_per_site total_energy/number_of_cells];
  klein_temperature = [klein_temperature temperature];
  
  [total_magnetic_field, total_energy] = TwistIsing(cells_on_side_of_grid, temperature, number_of_potential_spin_flips);
  twist_magnetic_field_per_site = [twist_magnetic_field_per_site total_magnetic_field/number_of_cells];
  twist_energy_per_site = [twist_energy_per_site total_energy/number_of_cells];
  twist_temperature = [twist_temperature temperature];

end

% Create Plots

subplot(2,2,1);
plot(toroid_temperature, toroid_energy_per_site, 'o', klein_temperature, klein_energy_per_site, 'x', twist_temperature, twist_energy_per_site, '+');
ylabel("Energy Per Site (J)");
xlabel("Temperature (K)");
%legend("Toroidal", "Klein Bottle", "Twisted Klein Bottle");
title("Energy Per Site vs. Temperature");

subplot(2,2,2);
plot(toroid_temperature, toroid_magnetic_field_per_site, 'o', klein_temperature, klein_magnetic_field_per_site, 'x', twist_temperature, twist_magnetic_field_per_site, '+');
ylabel("Magnetization Per Site");
xlabel("Temperature");
%legend("Toroidal", "Klein Bottle", "Twisted Klein Bottle");
title("Magnetization Per Site vs. Temperature");

subplot(2,2,3);
plot(toroid_energy_per_site, toroid_magnetic_field_per_site, 'o', klein_energy_per_site, klein_magnetic_field_per_site, 'x', twist_energy_per_site, twist_magnetic_field_per_site, '+');
xlabel("Energy Per Site");
ylabel("Magnetization Per Site");
%legend("Toroidal", "Klein Bottle", "Twisted Klein Bottle");
title("Magnetization Per Site vs. Energy Per Site");

