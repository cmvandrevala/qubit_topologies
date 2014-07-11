tic

clear all
clf

declare_parameters
number_of_cells = cells_on_side_of_grid^2;

simulation_temperature = [];

toroid_magnetic_field_per_site = [];
toroid_energy_per_site = [];

klein_magnetic_field_per_site = [];
klein_energy_per_site = [];

twist_magnetic_field_per_site = [];
twist_energy_per_site = [];

parfor count = 1:number_of_random_temperatures_to_test,

  temperature = determine_temperature;
  simulation_temperature = [simulation_temperature temperature];
  
  [total_magnetic_field, total_energy] = TorIsing(temperature);
  toroid_magnetic_field_per_site = [toroid_magnetic_field_per_site total_magnetic_field/number_of_cells];
  toroid_energy_per_site = [toroid_energy_per_site total_energy/number_of_cells];
  
  [total_magnetic_field, total_energy] = KleinIsing(temperature);
  klein_magnetic_field_per_site = [klein_magnetic_field_per_site total_magnetic_field/number_of_cells];
  klein_energy_per_site = [klein_energy_per_site total_energy/number_of_cells];
  
  [total_magnetic_field, total_energy] = TwistIsing(temperature);
  twist_magnetic_field_per_site = [twist_magnetic_field_per_site total_magnetic_field/number_of_cells];
  twist_energy_per_site = [twist_energy_per_site total_energy/number_of_cells];

end

toc

subplot(2,2,1);
plot(simulation_temperature, toroid_energy_per_site, 'o', simulation_temperature, klein_energy_per_site, 'x', simulation_temperature, twist_energy_per_site, '+');
ylabel('Energy Per Site');
xlabel('Temperature (K)');
title('Energy Per Site vs. Temperature');

subplot(2,2,2);
plot(simulation_temperature, toroid_magnetic_field_per_site, 'o', simulation_temperature, klein_magnetic_field_per_site, 'x', simulation_temperature, twist_magnetic_field_per_site, '+');
ylabel('Magnetization Per Site');
xlabel('Temperature (K)');
title('Magnetization Per Site vs. Temperature');

subplot(2,2,3);
plot(toroid_energy_per_site, toroid_magnetic_field_per_site, 'o', klein_energy_per_site, klein_magnetic_field_per_site, 'x', twist_energy_per_site, twist_magnetic_field_per_site, '+');
xlabel('Energy Per Site');
ylabel('Magnetization Per Site');
title('Magnetization Per Site vs. Energy Per Site');

hleg = legend('Toroidal', 'Klein Bottle', 'Twisted Klein Bottle');
set(hleg, 'position', [0.53 0.06 0.42 0.42])

