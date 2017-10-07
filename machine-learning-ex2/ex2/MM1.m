N = 0;
C = 0;
n = 1000;

sumA = 0;
sumD = 0;

durA = 0;
durD = 0;

A = exprnd(0.1,n,1);
D = exprnd(1,n,1);

for i = 1:n
    sumA = sumA + A(i);
    A(i) = A(i) + sumA;
    sumD = sumD + D(i);
    D(i) = D(i) + sumD;
end

dur = D(n);

for i = 1:n-1
    durA = durA + [A(i+1) - A(i)]*i;
    durD = durD + [D(i+1) - D(i)]*i;
end
durA = durA + [D(n) - A(n)]*n;
N = (durA - durD)/ dur ;
