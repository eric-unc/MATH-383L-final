%% Demonstration of Newton's Law of Cooling
%% Created by Eric Schneider

%% Producing a plot for just the data we found
figure()
T_data = readmatrix('data.csv', 'Range', 'B:B');
t_data = 1:1:size(T_data);
plot(t_data, T_data, 'r-*')