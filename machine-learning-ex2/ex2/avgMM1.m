function [N] = avgMM1(lambda,mu,T)
  
  p =  lambda/(mu+lambda); % Probability for the queque to move to next state

  T0 = 0; %current time

  delT = 0; %random var representing stay time for each queue

  p0 = 0;  %state transition deciding probability

  state = 0;  %current state
  
  Tcus = 0; %sum of product of no. of cutomers in each delT
  
  N = 0;  %average number of customers
  
  while (T0 <= T)
    if(state == 0)
      delT = exp(lambda);
      T0 = T0 + delT;
      state = state + 1;
    else  
      delT = exp(lambda+mu);
      T0 = T0 + delT;
      p0 = unifrnd(0,1);
      if (p0 > p)
        state = state - 1;
      else
        state = state + 1;
      endif
    Tcus = Tcus + delT * (state);
    endif
  end

N = Tcus/T0;
end