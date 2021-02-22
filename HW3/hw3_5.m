% Homework 3
% Problem 4
% Mark Kim
% 2/28/21

acc = 1e-6;
fxk = double(2);
err = fxk - 5^(1/4);
counter = 1;

while err > acc
    fxk = f(fxk);
    err = fxk - 5^(1/4);
    counter = counter + 1;
end

%% Function to be Evaluated
function fx = f(x)
    fx = x - ((x^4 - 5)/(4*x^3));
    return
end