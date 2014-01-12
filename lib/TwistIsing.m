function [total_magnetic_field, total_energy] = TwistIsing(temperature)

declare_parameters

%% Generate a Random Initial Configuration
grid = (rand(cells_on_side_of_grid) > 0.5)*2 - 1;

%% Evolve the system for a fixed number of steps
for i=1:number_of_potential_spin_flips,

  % Calculate the number of neighbors of each cell
  neighbors = circshift(grid, [ 0 1]) + circshift(grid, [ 0 -1]) + circshift(grid, [ 1 0]) + circshift(grid, [-1 0]);
    
  neighbors(1,1) = grid(1,2) + grid(2,1) + grid(cells_on_side_of_grid,cells_on_side_of_grid) + grid(cells_on_side_of_grid,cells_on_side_of_grid);
  neighbors(1,cells_on_side_of_grid) = grid(1,cells_on_side_of_grid-1) + grid(cells_on_side_of_grid,1) + grid(2,cells_on_side_of_grid) + grid(cells_on_side_of_grid,1);
  neighbors(cells_on_side_of_grid,1) = grid(1,cells_on_side_of_grid) + grid(cells_on_side_of_grid,2) + grid(cells_on_side_of_grid-1,1) + grid(1,cells_on_side_of_grid);
  neighbors(cells_on_side_of_grid,cells_on_side_of_grid) = grid(cells_on_side_of_grid,cells_on_side_of_grid-1) + grid(1,1) + grid(cells_on_side_of_grid-1,cells_on_side_of_grid) + grid(1,1);
  
  for j=2:cells_on_side_of_grid-1,
    neighbors(1,j) = grid(1,j+1) + grid(1,j-1) + grid(2,j) + grid(cells_on_side_of_grid,cells_on_side_of_grid-j+1);
    neighbors(cells_on_side_of_grid,j) = grid(cells_on_side_of_grid,j+1) + grid(cells_on_side_of_grid,j-1) + grid(cells_on_side_of_grid-1,j) + grid(1,cells_on_side_of_grid-j+1);
    neighbors(j,1) = grid(j,2) + grid(j-1,1) + grid(j+1,1) + grid(cells_on_side_of_grid-j+1,cells_on_side_of_grid);
    neighbors(j,cells_on_side_of_grid) = grid(j,cells_on_side_of_grid-1) + grid(j-1,cells_on_side_of_grid) + grid(j+1,cells_on_side_of_grid) + grid(cells_on_side_of_grid-j+1,1);
  end

  % Calculate the change in energy of flipping a spin
  change_in_energy = 2 * interaction_strength * (grid .* neighbors);

  % Calculate the transition probabilities
  probability_of_transition = exp(-change_in_energy/(boltzmans_constant * temperature));

  % Decide which transitions will occur
  transitions = (rand(cells_on_side_of_grid) < probability_of_transition ).*(rand(cells_on_side_of_grid) < 0.1) * -2 + 1;

  % Perform the transitions
  grid = grid .* transitions;

  % Sum up our variables of interest
  total_magnetic_field = sum(sum(grid));
  total_energy = -sum(sum(change_in_energy))/2;

end
