clear all
clf

% Initial Configuration

N = 50;              % Size of Grid (NxN)
steps = 1000;         % Total Number of Simulations to Perform
iterations = 2500;     % Number of Potential Spin Flips Within Ising Model

% Toroidal Topology 
% Periodic Boundary Conditions at All Edges
TorMs = [];         % Magnetic Field Per Site of Each Simulation
TorTs = [];         % Temperature of Each Simulation
TorNs = [];         % Total Number of Sites of Each Simulation
TorEs = [];         % Energy Per Site of Each Simulation

% Klein Bottle Topology
% Periodic Boundary Conditions on Sides, Anti-Periodic on Top and Bottom
KleinMs = [];         % Magnetic Field Per Site of Each Simulation
KleinTs = [];         % Temperature of Each Simulation
KleinNs = [];         % Total Number of Sites of Each Simulation
KleinEs = [];         % Energy Per Site of Each Simulation

% "Double Twist" Klein Bottle Topology (Can't Think of the Real Name)
% Anti-Periodic Boundary Conditions on All Edges
TwistMs = [];         % Magnetic Field Per Site of Each Simulation
TwistTs = [];         % Temperature of Each Simulation
TwistNs = [];         % Total Number of Sites of Each Simulation
TwistEs = [];         % Energy Per Site of Each Simulation


% Perform the Set of Simulations

for i=1:steps,

  T = rand()*5;
  
  [M, E] = TorIsing(N, T, iterations);
  TorMs = [TorMs M/(N^2)];
  TorEs = [TorEs E/(N^2)];
  TorNs = [TorNs N];
  TorTs = [TorTs T];
  
  [M, E] = KleinIsing(N, T, iterations);
  KleinMs = [KleinMs M/(N^2)];
  KleinEs = [KleinEs E/(N^2)];
  KleinNs = [KleinNs N];
  KleinTs = [KleinTs T];
  
  [M, E] = TwistIsing(N, T, iterations);
  TwistMs = [TwistMs M/(N^2)];
  TwistEs = [TwistEs E/(N^2)];
  TwistNs = [TwistNs N];
  TwistTs = [TwistTs T];

end

% Create Plots

subplot(2,2,1);
plot(TorTs, TorEs, 'o', KleinTs, KleinEs, 'x', TwistTs, TwistEs, '+');
ylabel("Energy Per Site (J)");
xlabel("Temperature (K)");
%legend("Toroidal", "Klein Bottle", "Twisted Klein Bottle");
title("Energy Per Site vs. Temperature");

subplot(2,2,2);
plot(TorTs, TorMs, 'o', KleinTs, KleinMs, 'x', TwistTs, TwistMs, '+');
ylabel("Magnetization Per Site");
xlabel("Temperature");
%legend("Toroidal", "Klein Bottle", "Twisted Klein Bottle");
title("Magnetization Per Site vs. Temperature");

subplot(2,2,3);
plot(TorEs, TorMs, 'o', KleinEs, KleinMs, 'x', TwistEs, TwistMs, '+');
xlabel("Energy Per Site");
ylabel("Magnetization Per Site");
%legend("Toroidal", "Klein Bottle", "Twisted Klein Bottle");
title("Magnetization Per Site vs. Energy Per Site");

