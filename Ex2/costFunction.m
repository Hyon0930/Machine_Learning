function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%
sum = 0;
double(sum);
h = zeros(m,1);

for i = 1:m
     h(i,1) = sigmoid(theta' * X(i,:)');
    sum = sum + (-y(i) * log(h(i,1)) - (1 - y(i)) * log(1 - h(i,1)));
end
J = sum/m; 


%for iteration = 1:15000
    n = length(X(1,:));
    sum = zeros(n+1,1);
    double(sum);
    
    for j = 1:3
        for i=1:m
        sum(j) = sum(j) + (h(i,1) - y(i)) * X(i,j); 
        end
    theta(j) = sum(j)/m;
    grad(j) = theta(j);
    end
    
    
     
    
    
    %{
    sum = 0;
    sum2 = 0;
    double(sum);
    h = zeros(m,1);

    for i = 1:m
         h(i,1) = theta(1) + theta(2)*X(i,2);
        sum = sum + (h(i,1) - y(i));
        sum2 = sum2 + (h(i,1) - y(i))*X(i,2);
    end
    theta(1) = theta(1) - alpha * sum / m;
    theta(2) = theta(2) - alpha * sum2 / m;
    %}
%end

 
% =============================================================

end
