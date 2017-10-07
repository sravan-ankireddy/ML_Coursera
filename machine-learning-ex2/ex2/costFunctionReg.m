function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



J = (-1/m)*[log(sigmoid((theta')*(X')))*y + (log(1 - sigmoid((theta')*(X'))))*(1 - y)] + (lambda/(2*m))*[sum(theta (2:n).*theta(2:n))];

grad_old = (1/m)*(sum((X .* repmat((sigmoid(X * theta) - y), 1, size(X,2)))));
grad_old = grad_old';

grad(1) = grad_old(1);
grad(2:n) = grad_old(2:n) + (lambda/m)*[theta(2:n)];

% =============================================================

end
