%**************************************************************************
% Program name:     beta.m
% Author:           Judah Ben-Eliezer
% Date Created:     April 9, 2022
%
% Sampling from beta distribution, and computing the mean and variance.
%**************************************************************************

NSize = 1000; % number of samples

%****** a and b are the parameters of the Beta Distribution
a = 700;
b = 300;

% Draw samples from the beta distribution, with parameters Ap and Bp;
rndBeta = betarnd(a, b, [1, NSize]);

% Plot a histogram
NBins = 100;   % number of bins in the histogram
histogram(rndBeta, NBins);

title('Samples from Beta Distribution', 'Color', [.27 .89 .76]);
xlabel('x');

% Compute the sample mean and variance
meanData = mean(rndBeta);
varData = var(rndBeta);

% Compute the theoretical mean and variance utilizing the 'betastat'
% function.
[muT, varT] = betastat(a, b);

disp(mean: theoretical:  + muT +  actual:  + meanData)
disp(var: theoretical:  + varT +  actual:  + varData)

