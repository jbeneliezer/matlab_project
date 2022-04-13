%**************************************************************************
% Program name:     poission.m
% Author:           Judah Ben-Eliezer
% Date Created:     April 9, 2022
%
% Sampling from poission distribution, and computing the mean and variance.
%**************************************************************************

NSize = 50000; % number of samples

l = 10; % lambda (average events in time interval)

rndPoisson = poissrnd(l, [1, NSize]);

% plot
nbins = 30;
edges = 0:1:20;
ha = histogram(rndPoisson, nbins, 'BinEdges', edges, 'FaceColor', [.34 .91 .44]);
xticks(edges);

title('Samples from Poission Distribution', 'Color', [.27 .89 .76])
xlabel('x');

% mean and variance
meanData = mean(rndPoisson);
varData = var(rndPoisson);

% theoretical mean and variance
[muT, varT] = poisstat(l);

disp("mean: theoretical: " + muT + " actual: " + meanData)
disp("var: theoretical: " + varT + " actual: " + varData)
