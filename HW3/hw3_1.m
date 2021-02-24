% Homework 3
% Problem 1
% Mark Kim
% 2/28/21

clear;
clc;


%% a. Plot f(x)

fplot(@(x) f(x),[0 5])

%% b. Bisection routine

% continueLoop = true; % for user entry loop

%% initialize array in following format
% [n, an, bn, xn, f(an), f(bn), f(xn), an-bn, Emax]
mainArr = zeros(1, 9);
accuracy = 1e-6;
index = 1;

mainArr(2:3) = [4 5];
mainArr(index, 1:9) = calcArr(mainArr);

%% User Entry Loop (not necessary)
% while continueLoop == true
%     mainArr(2) = input('Enter lower bound of interval: ');
%     mainArr(3) = input('Enter upper bound of interval: ');
%     mainArr(index, 1:8) = calcArr(mainArr);
%     if sign(mainArr(5)) == sign(mainArr(6))
%         fprintf('\nThe function must have different signs at a and b.\n');
%         userAns = input('Would you like to continue? (y,n) [y]: ','s');
%         if userAns == "n"
%             continueLoop = false;
%             fprintf('\nThank you. Goodbye.\n');
%             return;
%         else
%             continueLoop = true;
%         end
%     else
%         continueLoop = false;
%     end
% end

%% Main Array Population Routine
while mainArr(index,8)*2 > accuracy
    newArr = zeros(1,8);
    newArr(1) = index;
    if sign(mainArr(index,5)) == sign(mainArr(index,7))
        newArr(2) = mainArr(index,4);
        newArr(3) = mainArr(index,3);
    else
        newArr(2) = mainArr(index,2);
        newArr(3) = mainArr(index,4);
    end
    index = index + 1;
    mainArr = [mainArr; calcArr(newArr)];
end
b = array2table(mainArr, 'VariableNames', { 'n', 'an', 'bn', 'xn', 'f(an)', 'f(bn)', 'f(xn)', '|an-bn|', 'Emax' });

%% Function to be Evaluated
function fx = f(x)
    fx = (5-x).*exp(x)-5;
    return;
end

%% Calculate Array function
function tempArr = calcArr(arr)
    tempArr = arr;
    tempArr(4) = (tempArr(2) + tempArr(3))/2;

    tempArr(5) = f(tempArr(2));
    tempArr(6) = f(tempArr(3));
    tempArr(7) = f(tempArr(4));
    
    tempArr(8) = abs(tempArr(3) - tempArr(2)); 
    tempArr(9) = abs(tempArr(3) - tempArr(2))/2;
    return;
end