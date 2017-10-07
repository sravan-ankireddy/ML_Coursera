function [N] = avgMD1(lambda,D,T) 

  T0 = 0; %current time

  delT = 0; %random var representing stay time for each queue

  state = 0;  %current state
  
  Tcus = 0; %sum of product of no. of cutomers in each delT
  
  N = 0;  %average number of customers
  
  nd = 0;
  
  while (T0 <= T)
%    disp(state);
%    disp(T0);
    if(state == 0)
      delT = exp(lambda);
      T0 = T0 + delT;
      state = state + 1;
    else  
      delT = exp(lambda);
      if ( D*(nd+1) < T0 + delT)
        Tcus = Tcus + D * (state);
        state = state - 1;
        nd = nd+1;
        T0 = T0 + D;
      else
        Tcus = Tcus + delT * (state);
        T0 = T0 + delT;
        state = state + 1;
      endif
    endif
  end

N = Tcus/T0;
end