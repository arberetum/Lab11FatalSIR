% Aiden Maloney-Bertelli
% BMI 500, Fall 2022
% Lab 11
function [s, i, r, births, deaths_s, deaths_i, deaths_r] = fatalSIR(s0, i0, r0, alpha, beta, gamma, mu_star, mu_s, mu_i, mu_r, duration, dt)
    % fatalSIR.m simulates the proportions of susceptible, infected,
    %   recovered, born, and dead people with the given parameters, initial
    %   conditions, and simulation duration using the fatal susceptible-
    %   infected-recovered (SIR) compartmental model as defined in the 
    %   following paper:
    %       R. Sameni, “Mathematical Modeling of Epidemic Diseases; A Case Study of 
    %   the COVID-19 Coronavirus," Mar. 2020.
    %
    % Inputs:
    %   s0  = initial proportion of population that is susceptible
    %   i0  = initial proportion of population that is infected
    %   r0  = initial proportion of population that is recovered
    %   alpha = the contagion factor between the susceptible and infected
    %           populations
    %   beta  = the recovery rate
    %   gamma = the rate of returning from the recovered population back to 
    %           the susceptible group
    %   mu_star = the birth rate
    %   mu_s = the death rate for the susceptible population
    %   mu_i = the death rate for the infected population
    %   mu_r = the death rate for the recovered population
    %   duration = the number of days to simulate
    %   dt = the time resolution of the simulation
    %
    % Outputs:
    %   s = row vector of the proportion of the population that is
    %       susceptible over the simulation duration
    %   i = row vector of the proportion of the population that is
    %       infected over the simulation duration
    %   r = row vector of the proportion of the population that is
    %       recovered over the simulation duration
    %   births = row vector of the cumulative amount of te
    %
    % preallocate output vectors 
    s = zeros(1, round(duration * 1/dt));          % susceptible people (population ratio)
    i = zeros(1, round(duration * 1/dt));          % infected people (population ratio)
    r = zeros(1, round(duration * 1/dt));          % recovered people (population ratio)
    births = zeros(1, round(duration * 1/dt));     % births (cumulative population ratio)
    deaths_s = zeros(1, round(duration * 1/dt));   % deaths of susceptible people (cumulative, population ratio)
    deaths_i = zeros(1, round(duration * 1/dt));   % deaths of infected people (cumulative, population ratio))
    deaths_r = zeros(1, round(duration * 1/dt));  % deaths of recovered people (cumulative, population ratio))
    % set initial conditions
    s(1) = s0;
    i(1) = i0;
    r(1) = r0;
    % calculate values over time
    for index = 2:length(s)
        ds = (gamma * r(index-1) - alpha * s(index-1) * i(index-1) - mu_s * s(index-1) + mu_star) * dt;
        di = (alpha * s(index-1) * i(index-1) - beta * i(index-1) - mu_i * i(index-1)) * dt;
        dr = (beta * i(index-1) - gamma * r(index-1) - mu_r * r(index-1)) * dt;
        s(index) = s(index-1) + ds;
        i(index) = i(index-1) + di;
        r(index) = r(index-1) + dr;
        births(index) = births(index-1) + mu_star * dt;
        deaths_s(index) = deaths_s(index-1) + mu_s * s(index-1) * dt;
        deaths_i(index) = deaths_i(index-1) + mu_i * i(index-1) * dt;
        deaths_r(index) = deaths_r(index-1) + mu_r * r(index-1) * dt;
    end
end