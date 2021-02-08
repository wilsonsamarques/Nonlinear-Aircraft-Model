%Initialize constants for the RCAM simulation
clear
clc
close all


%% Define constants

x0 = [85;                % approx 165 knots
      0;
      0;
      0;
      0;
      0;
      0;
      0.1;               % approx 5.73 deg         
      0];      
 
  
 
u = [0;
     -0.1;               % approx -5.73 deg
     0;
     0.08*0;               % recall minimum throttles are 0.5*pi/180 = 0.0087
     0.08];
 
 
 TF = 3*60;
 
 
% Define min/max control values
 
u1min = -25*pi/180;
u1max = 25*pi/180;

u2min = -25*pi/180;
u2max = 10*pi/180;

u3min = -30*pi/180;
u3max = 30*pi/180;

u4min = 0.5*pi/180*0;
u4max = 10*pi/180;

u5min = 0.5*pi/180;
u5max = 10*pi/180;


 
 % Run the model
 simOut = sim('RCAMSimulation.slx');
 
 
 %% Plot the results
t = simOut.simX.Time;

u1 = simOut.simU.Data(:,1);
u2 = simOut.simU.Data(:,2);
u3 = simOut.simU.Data(:,3);
u4 = simOut.simU.Data(:,4);
u5 = simOut.simU.Data(:,5);

x1 = simOut.simX.Data(:,1);
x2 = simOut.simX.Data(:,2);
x3 = simOut.simX.Data(:,3);
x4 = simOut.simX.Data(:,4);
x5 = simOut.simX.Data(:,5);
x6 = simOut.simX.Data(:,6);
x7 = simOut.simX.Data(:,7);
x8 = simOut.simX.Data(:,8);
x9 = simOut.simX.Data(:,9);

figure;
subplot(5,1,1);
plot(t,u1);
legend('Aileron');
grid on


subplot(5,1,2);
plot(t,u2);
legend('Elevator');
grid on


subplot(5,1,3);
plot(t,u3);
legend('Rudder');
grid on


subplot(5,1,4);
plot(t,u4);
legend('Throttle 1');
grid on


subplot(5,1,5);
plot(t,u5);
legend('Throttle 2');
grid on

% Plot the states
figure
% u, v, w
subplot(3,3,1)
plot(t, x1)
legend('u')
grid on

subplot(3,3,4)
plot(t, x2)
legend('v')
grid on

subplot(3,3,7)
plot(t, x3)
legend('w')
grid on

% p, q, r
subplot(3,3,2)
plot(t, x4)
legend('p')
grid on

subplot(3,3,5)
plot(t, x5)
legend('q')
grid on

subplot(3,3,8)
plot(t, x6)
legend('r')
grid on

% phi, theta, psi
subplot(3,3,3)
plot(t, x7)
legend('\phi')
grid on

subplot(3,3,6)
plot(t, x8)
legend('\theta')
grid on

subplot(3,3,9)
plot(t, x9)
legend('\psi')
grid on
 
 
 
 
 