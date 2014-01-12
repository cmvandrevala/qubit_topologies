function [total_magnetic_field, total_energy] = TorIsing(temperature)

declare_parameters

%% Generate a Random Initial Configuration
grid = (rand(cells_on_side_of_grid) > 0.5)*2 - 1;

%% Evolve the system for a fixed number of steps
for i=1:number_of_potential_spin_flips,

  % Calculate the number of neighbors of each cell
  neighbors = circshift(grid, [ 0 1]) + circshift(grid, [ 0 -1]) + circshift(grid, [ 1 0]) + circshift(grid, [-1 0]);

  % Calculate the change in energy of flipping a spin
  change_in_energy = 2 * interaction_strength * (grid .* neighbors);

  % Calculate the transition probabilities
  probability_of_transmission = exp(-change_in_energy/(boltzmans_constant * temperature));

  % Decide which transitions will occur
  transitions = (rand(cells_on_side_of_grid) < probability_of_transmission ).*(rand(cells_on_side_of_grid) < 0.1) * -2 + 1;

  % Perform the transitions
  grid = grid .* transitions;

  % Sum up our variables of interest
  total_magnetic_field = sum(sum(grid));
  total_energy = -sum(sum(change_in_energy))/2;

end
