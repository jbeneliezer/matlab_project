%**************************************************************************
% Program name:     normal.m
% Author:           Judah Ben-Eliezer
% Date Created:     April 9, 2022
%
% Sampling from normal distribution, and computing the mean and variance.
%**************************************************************************

NSize = 500; % number of samples

u = 10;
s2 = 16;

rndNormal = normrnd(u, sqrt(s2), [1, NSize]);

% plot
nbins = 30;
edges = 0:1:20;
ha = histogram(rndNormal, nbins, 'BinEdges', edges, 'FaceColor', [.34 .91 .44]);
xticks(edges);

title('Samples from Normal Distribution', 'Color', [.27 .89 .76])
xlabel('x');

% mean and variance
meanData = mean(rndNormal);
varData = var(rndNormal);

% theoretical mean and variance
[muT, varT] = normstat(u, sqrt(s2));

disp(mean: theoretical:  + muT +  actual:  + meanData)
disp(var: theoretical:  + varT +  actual:  + varData)


