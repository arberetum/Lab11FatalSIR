% Aiden Maloney-Bertelli
% BMI 500, Fall 2022
% Lab 11

clc
clear all
close all

% parameters for fatal, non-immunizing case
i0 = 0.0008;
r0 = 0.003;
s0 = 1 - i0 - r0;
alpha = 0.5;
beta = 0.05;
gamma = 0.04;
mu_star = 0.00003;
mu_s = 0.00002;
mu_i = 0.0005;
mu_r = 0.00004;
duration = 150;

[s, i, r, births, deaths_s, deaths_i, deaths_r] = fatalSIR(s0, i0, r0, alpha, beta, gamma, mu_star, mu_s, mu_i, mu_r, duration);
t = 0:0.1:duration-0.1;

figure;
plot(t, s, 'LineWidth', 4)
hold on
plot(t, i, 'LineWidth', 4)
plot(t, r, 'LineWidth', 4)
plot(t, births, 'LineWidth', 4)
plot(t, deaths_s + deaths_i + deaths_r, 'LineWidth', 4)
legend("Susceptible", "Infected", "Recovered", "Cumulative Births", "Cumulative Deaths")
set(gca, 'FontSize', 18)
xlabel("Days")
ylabel("Population Ratio")

% immunizing case
gamma = 0;

[s, i, r, births, deaths_s, deaths_i, deaths_r] = fatalSIR(s0, i0, r0, alpha, beta, gamma, mu_star, mu_s, mu_i, mu_r, duration);

figure;
plot(t, s, 'LineWidth', 4)
hold on
plot(t, i, 'LineWidth', 4)
plot(t, r, 'LineWidth', 4)
plot(t, births, 'LineWidth', 4)
plot(t, deaths_s + deaths_i + deaths_r, 'LineWidth', 4)
legend("Susceptible", "Infected", "Recovered", "Cumulative Births", "Cumulative Deaths")
set(gca, 'FontSize', 18)
xlabel("Days")
ylabel("Population Ratio")

% non-immunizing case with twice rate of recovery (beta)
gamma = 0.04;
beta = 0.1;

[s, i, r, births, deaths_s, deaths_i, deaths_r] = fatalSIR(s0, i0, r0, alpha, beta, gamma, mu_star, mu_s, mu_i, mu_r, duration);

figure;
plot(t, s, 'LineWidth', 4)
hold on
plot(t, i, 'LineWidth', 4)
plot(t, r, 'LineWidth', 4)
plot(t, births, 'LineWidth', 4)
plot(t, deaths_s + deaths_i + deaths_r, 'LineWidth', 4)
legend("Susceptible", "Infected", "Recovered", "Cumulative Births", "Cumulative Deaths")
set(gca, 'FontSize', 18)
xlabel("Days")
ylabel("Population Ratio")