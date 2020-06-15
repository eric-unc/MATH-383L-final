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