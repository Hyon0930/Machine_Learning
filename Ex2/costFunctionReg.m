function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

sum = 0;
double(sum);
h = zeros(m,1);
sum2 = 0;
double(sum2);
h(1,1) = theta(1);
n = length(theta);
for i = 1:m
     h(i,1) = sigmoid(theta' * X(i,:)');
    sum = sum + (-y(i) * log(h(i,1)) - (1 - y(i)) * log(1 - h(i,1)));
end
for i = 2:n
sum2 = sum2 + theta(i)^2;
end
J = sum/m + lambda * sum2/(2 * m);



%----------------------------------------------------------------------



% find summation inside of gradient 
sg = zeros(size(theta));
for i=1:m
    h(i,1) = sigmoid(theta' * X(i,:)');
    sg(1) = sg(1) + (h(i,1) - y(i)) * X(i,1);
end    
 %skip the reguralization for j=0

grad(1) = sg(1)/m; %reguralization

for j = 2:n
    for i=1:m
        h(i,1) = sigmoid(theta' * X(i,:)');
        sg(j) = sg(j) + (h(i,1) - y(i)) * X(i,j);
    end    
    grad(j) = sg(j)/m + lambda * theta(j) / m;
end

% =============================================================

end
