function [M, E] = TwistIsing(N,T,steps)

J = 1; % Strength of Interaction in Joules
k = 1; % Joules Per Kelvin

Ms = [];
Es = [];

%% Generate a Random Initial Configuration
grid = (rand(N) > 0.5)*2 - 1;

%% Evolve the system for a fixed number of steps
for i=1:steps,

  % Calculate the number of neighbors of each cell
  neighbors = circshift(grid, [ 0 1]) + ...
    circshift(grid, [ 0 -1]) + ...
    circshift(grid, [ 1 0]) + ...
    circshift(grid, [-1 0]);
    
  neighbors(1,1) = grid(1,2) + grid(2,1) + grid(N,N) + grid(N,N);
  neighbors(1,N) = grid(1,N-1) + grid(N,1) + grid(2,N) + grid(N,1);
  neighbors(N,1) = grid(1,N) + grid(N,2) + grid(N-1,1) + grid(1,N);
  neighbors(N,N) = grid(N,N-1) + grid(1,1) + grid(N-1,N) + grid(1,1);
  
  for j=2:N-1,
    neighbors(1,j) = grid(1,j+1) + grid(1,j-1) + grid(2,j) + grid(N,N-j+1);
    neighbors(N,j) = grid(N,j+1) + grid(N,j-1) + grid(N-1,j) + grid(1,N-j+1);
    neighbors(j,1) = grid(j,2) + grid(j-1,1) + grid(j+1,1) + grid(N-j+1,N);
    neighbors(j,N) = grid(j,N-1) + grid(j-1,N) + grid(j+1,N) + grid(N-j+1,1);
  end

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
