function [M, E] = TorIsing(N,T,steps)

J = 1; % Strength of Interaction in Joules
k = 1; % Joules Per Kelvin

%% Generate a Random Initial Configuration
grid = (rand(N) > 0.5)*2 - 1;

%% Evolve the system for a fixed number of steps
for i=1:steps,

  % Calculate the number of neighbors of each cell
  neighbors = circshift(grid, [ 0 1]) + ...
    circshift(grid, [ 0 -1]) + ...
    circshift(grid, [ 1 0]) + ...
    circshift(grid, [-1 0]);

  % Calculate the change in energy of flipping a spin
  DeltaE = 2 * J * (grid .* neighbors);

  % Calculate the transition probabilities
  p_trans = exp(-DeltaE/(k * T));

  % Decide which transitions will occur
  transitions = (rand(N) < p_trans ).*(rand(N) < 0.1) * -2 + 1;

  % Perform the transitions
  grid = grid .* transitions;

  % Sum up our variables of interest
  M = sum(sum(grid));
  E = -sum(sum(DeltaE))/2;

end
