
% Initial Configuration

N = 20;               % Size of Grid
T = rand()*5;         % Set a Temperature
steps = 100;          % Total Number of Time Steps to Evolve the System
iterations = 100;     % Number of Iterations Within Ising Model

Ms = [steps];         % Magnetic Field at Each Time Step
Ts = [steps];         % Temperature at Each Time Step
Ns = [steps];         % Total Number of Particles at Each Time Step
Es = [steps];         % Total Energy at Each Time Step


for i=1:steps,

  % Perform a Time Step
  [M, E] = ising(N, T, iterations);

  % Record the results
  Ms = [Ms M/(N^2)];
  Es = [Es E/(N^2)];
  Ns = [Ns N];
  Ts = [Ts T];

end


% Figure Generation
% Energy per site, versus temperature
plot(Ts, Es);
ylabel('energy per site');
xlabel('temperature');

% Magnetization per site, versus temperature
plot(Ts, Ms);
ylabel('magnetization per site');
xlabel('temperature');
ylim([-1.1 1.1]);

% Magnetization per site, versus Energy per site
plot(Es, Ms);
xlabel('Energy per site');
ylabel('Magnetization per site');

