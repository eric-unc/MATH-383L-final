%% Demonstration of Newton's Law of Cooling
%% Created by Eric Schneider

%% Producing a plot for just the data we found
figure()
T_data = readmatrix('data.csv', 'Range', 'B:B');

% This will convert the data from Fahrenheit to Kelvin
T_data = ((T_data - 32).* (5/9)) + 273.15;

t_data = 1:1:size(T_data);
plot(t_data, T_data, 'r-*')
title('Measured data')
xlabel('Time (minutes)')
ylabel('Temperature (K)')

%% Plot for data + solution
figure()
plot(t_data, T_data, 'r-*')
hold on;
[t_sol, T_sol] = solution(299);
plot(t_sol, T_sol, 'b-*')

title('Measured data v. solution')
xlabel('Time (minutes)')
ylabel('Temperature (K)')
legend('Real data', 'Solution')

%% Comparing solutions to Runge-Kutta 4
figure()
plot(t_sol, T_sol, 'b-*')
hold on;

y0 = 279.3;
t0 = 0;
tf = 299;
h = 1;

[t1, y1] = RungeKutta4(@(t, T) diffeq(t, T), y0, t0, tf, round(tf / h));
plot(t1, y1, 'm-*')
hold on;

title('Solution v. Runge-Kutta (order 4)')
xlabel('Time (minutes)')
ylabel('Temperature (K)')
legend('Solution', 'Runge-Kutta (h = 1)')