function [N] = avgMM12(lambda,mu,T)
  
  T0 = 0; %current time

  delT = 0; %random var representing stay time for each queue

  state = 0;  %current state
  
  Tcus = 0; %sum of product of no. of cutomers in each delT
  
  N = 0;  %average number of customers
  
  A = [];
 
  D = [];
  
  i = 1;
  
%  lambda = 0;
%  
%  mu = 1;
%  
%  T = 1000;
  
  A(1) = 0;
  
  while (A(i) <= T)
    delT = exprnd(lambda);
    A(i + 1) = A(i) + delT;
    i = i+1;
    disp('A');
    disp(i);
  end
  
  j = 1;
  
  D(1) = 0;
  
  while (D(j) <= T)
    delT = exprnd(mu);
    D(j + 1) = D(j) + delT;
    j = j + 1;
    disp(j);
  end
  
  ai = 2; di = 2;
  
  while (A(ai) <= T)
    if ( A(ai) < D(di) )
      T0 = A(ai -1);
      Tcus = state * (A(ai) - T0);
      ai = ai + 1;
      state = state + 1;
    else
      if (state > 0)
        T0 = D(di - 1);
        Tcus = state * (D(di) - T0);
        di = di + 1;
        state = state - 1;
      else
        T0 = D(di - 1);
        Tcus = state * (D(di) - T0);
        di = di + 1;
      endif
    endif
  end

N = Tcus/A(ai);
end