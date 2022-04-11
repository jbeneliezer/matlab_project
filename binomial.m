%**************************************************************************
% Program name:     binomial.m
% Author:           Judah Ben-Eliezer
% Date Created:     April 9, 2022
%
% Sampling from binomial distributions, and computing the mean and variance.
%**************************************************************************

NSize = 500; % number of samples

%****** Parameters of the binomial distribution bin(Na, pa)
Na = 100;
pa = 0.2;

%**************************************************************************
% Sample from the Binomial Distribution bin(Na, pa)
%**************************************************************************
rndBinomial = binornd(Na, pa, [1, NSize]);

%**************************************************************************
% Plot a histogram
%**************************************************************************
nbins = 30; % number of bins for histogram plot
edges = 10:1:29;
ha = histogram(rndBinomial, nbins, 'BinEdges', edges, 'FaceColor', [.34 .91 .44]);
xticks(edges);

title('Samples from Binomial Distribution', 'Color', [.27 .89 .76])
xlabel('x');

% Compute the sample mean and variance
meanData = mean(rndBinomial);
varData = var(rndBinomial);

% Compute the theoretical mean and variance utilizing the 'binostat'
% function.
[muT, varT] = binostat(Na, pa);

disp("mean: theoretical: " + muT + " actual: " + meanData)
disp("var: theoretical: " + varT + " actual: " + varData)
