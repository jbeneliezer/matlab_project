%**************************************************************************
% Program name:     betabinomial.m
% Author:           Judah Ben-Eliezer
% Date Created:     April 9, 2022
%
% Sampling from beta-binomial distribution, and computing the mean and variance.
%**************************************************************************

NSize = 1000; % number of samples

N = 100;
alpha = 700;
beta = 300;

rndBetaBinomial = bbinornd(N, alpha, beta, NSize);

% Plot a histogram
NBins = 100;   % number of bins in the histogram
histogram(rndBetaBinomial, NBins);

title('Samples from Beta Binomial Distribution', 'Color', [.27 .89 .76])
xlabel('x');

meanData = mean(rndBetaBinomial);
varData = var(rndBetaBinomial);

[muT, varT] = bbinostat(N, alpha, beta);

disp("mean: theoretical: " + muT + " actual: " + meanData)
disp("var: theoretical: " + varT + " actual: " + varData)

function y = bbinornd(n, ai, bi, sz)
    y = [];
    a = ai;
    b = bi;
    for i = 1:sz
        for j = 1:n
            ra = randi([1, (a + b)]);
            if ra <= a + 1
                a = a + 1;
            else
                b = b + 1;
            end
        end
        y = [y, (a - ai)];
        a = ai;
        b = bi;
    end
end

function [m, v] = bbinostat(n, a, b)
    m = (n * a) / (a + b);
    v = (n * a * b * (n + a + b))/((a + b) ^ 2 * (1 + a + b));
end

