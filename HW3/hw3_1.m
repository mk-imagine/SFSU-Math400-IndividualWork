% Homework 3
% Problem 1
% Mark Kim
% 2/28/21

% a. Plot f(x)
fplot(@(x) f(x),[0 5])

% b. Bisection routine
continueLoop = true;

% initialize array in following format
% (n, an, bn, xn, f(an), f(bn), f(xn), Emax)
global mainArr;
mainArr = zeros(1, 8);

while continueLoop == true
    mainArr(2) = input('Enter lower bound of interval: ');
    mainArr(3) = input('Enter upper bound of interval: ');
    calcArr(1);

    if sign(mainArr(5)) == sign(mainArr(5))
        fprintf('\nThe function must have different signs at a and b.\n');
        userAns = input('Would you like to continue? (y,n) [y]: ','s');
        if userAns == "n"
            continueLoop = false;
            fprintf('\nThank you. Goodbye.\n');
        else
            continueLoop = true;
        end
    end
end

% Define the function
function fx = f(x)
    fx = (5-x).*exp(x)-5;
    return;
end

% Calculate Array function
function calcArr(row)
    global mainArr;
    tempArr = mainArr;
    tempArr(4) = (tempArr(2) + tempArr(3))/2;

    tempArr(5) = f(tempArr(2));
    tempArr(6) = f(tempArr(3));
    tempArr(7) = f(tempArr(4));
    
    tempArr(8) = abs(tempArr(3) - tempArr(2))/2;
    
    mainArr(row, 1:8) = tempArr;
end