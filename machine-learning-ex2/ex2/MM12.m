clear;

mu = 1;

lambda = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.92 0.94 0.96 0.98];

%lambda = [0.2];

%lambda = [0:0.01:0.99];

T = 100; %Total time in sec

D = 1;

avgC = zeros(size(lambda));

avgD = zeros(size(lambda));

i = 1;
for i = 1:size(lambda,2)
  avgC(i) = avgMM12(lambda(i),mu,T);
%  avgD(i) = avgMD12(lambda(i),D,T);
end

figure(1);
plot(lambda, avgC);

%figure(2);
%plot(lambda, avgD);