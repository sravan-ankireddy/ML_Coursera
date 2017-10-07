function [N] = avgMD12(lambda,mu,T)

  T0 = 0; %current time

  delT = 0; %random var representing stay time for each queue

  state = 0;  %current state
  
  Tcus = 0; %sum of product of no. of cutomers in each delT
  
  N = 0;  %average number of customers
  
  A = zeros(1,1000000);
  
  D = zeros(1,1000000);
  
  i = 2;
  
%  lambda = 0.2;
%  
%  mu = 1;
%  
%  T = 1000;
%  
  A(1) = exp(lambda);
  
  while (A(i) <= T)
    delT = exp(lambda);
    A(i) = A(i - 1) + delT;
    i = i+1;
  end
  
  j = 2;
  
  D(1) = mu;
  
  while (D(j) <= T)
    delT = mu;
    D(j) = D(j - 1) + delT;
    j = j + 1;
  end
  
  ai = 1; di = 1;
  
  while (A(ai) <= T)
    if ( A(ai) < D(di) )
      Tcus = state * (A(ai + 1) - A(ai));
      ai = ai + 1;
      state = state + 1;
    else
      Tcus = state * (D(di) - A(ai));
      di = di + 1;
      state = state + 1;
    endif
  end

N = Tcus/A(ai);
end