% Spring 2021
% January 31, 2021
% Central Limit Theorem
% h.a. boateng

n=10000;        % Number of experiments
an=zeros(n,1);   % stores sample average of each experiment
m = 1000;       % number of elements we generate from exponential distribution.
for i=1:n        % Doing experiments
    x=exprnd(5,[m,1]); % 
    an(i)=sum(x)/m; % Average 
end

histogram(an,100) % This should show a normal distribution even though
% the distribution of the random variables is uniform