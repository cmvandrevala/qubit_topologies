
% Initial Configuration

N = 100;              % Size of Grid (NxN)
steps = 100;          % Total Number of Simulations to Perform
iterations = 100;     % Number of Time Steps Within Ising Model

Ms = [];         % Magnetic Field Per Site of Each Simulation
Ts = [];         % Temperature of Each Simulation
Ns = [];         % Total Number of Sites of Each Simulation
Es = [];         % Energy Per Site of Each Simulation


% Perform the Set of Simulations

for i=1:steps,

  T = rand()*5;
  [M, E] = ising(N, T, iterations);

  Ms = [Ms M/(N^2)];
  Es = [Es E/(N^2)];
  Ns = [Ns N];
  Ts = [Ts T];

end

% Create Plots

subplot(1,3,1);
plot(Ts, Es, '+');
ylabel("Energy Per Site (J)");
xlabel("Temperature (K)");
title("Energy Per Site vs. Temperature");

subplot(1,3,2);
plot(Ts, Ms, '+');
ylabel("Magnetization Per Site");
xlabel("Temperature");
title("Magnetization Per Site vs. Temperature");

subplot(1,3,3);
plot(Es, Ms, 'o');
xlabel("Energy Per Site");
ylabel("Magnetization Per Site");
title("Magnetization Per Site vs. Energy Per Site");

