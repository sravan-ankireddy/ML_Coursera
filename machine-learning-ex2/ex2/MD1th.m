clear;

lambda = [0:0.01:0.99];

avg = lambda + (0.5)*(lambda.*lambda).*(1 - lambda).^-1;

plot(lambda, avg);