% Spring 2021 - MATH 400
% Example - barycentric Lagrange interpolation
% May 05, 2021
clear all
clc
% 5a
n = 1000; 
%f = @(x) 1./(1+25*x.^2); 
f = @(x) abs(x) + 0.5*x - x.^2;


%% Chebyshev points
xc = cos(pi*(0:n)'/n); % Chebyshev points of the 2nd kind
wc = [1/2; ones(n-1,1); 1/2].*(-1).^((0:n)'); % Weight at Chebyshev points
fc = f(xc); % Function at Chebyshev points
xx = linspace(-1,1,5000); % 5000 points between -1 and 1
numer = zeros(size(xx)); % numerator of barycentric Lagrange polynomial
denom = zeros(size(xx)); % denominator of barycentric Lagrange polynomial
exact = zeros(size(xx)); % Identifies possible divisions by zero
for j = 1:n+1
    xdiff = xx-xc(j); 
    temp  = wc(j)./xdiff; % The jth contribution
    numer = numer + temp*fc(j); % sum up to get the numerator
    denom = denom + temp; % sum up to get the denominator
    exact(xdiff==0) = j; % Find indices where division by zero occurs
end
ffc = numer./denom; % Approximation
jj = find(exact); % Assess the indices where there was division by zero
ffc(jj) = fc(exact(jj)); % These should just be the function value

subplot(2,1,1),plot(xc,fc,'.--',xx,ffc,'-','MarkerSize',20)
%legend('f(x) = |x| + x/2 - x^2','barycentric Lagrange approximation')
legend('f(x) = 1/(1+25x^2)','barycentric Lagrange approximation')
title(['Chebyshev points, max error = ',num2str(norm(f(xx)-ffc,'inf'))])

%% Equidistant points

clear jj numer denom exact
xe=-1+2*(0:n)'/n; %equidistant points
we=zeros(n+1,1); % equidistant weights
% weight at equidistant points
for j=0:n
    we(j+1)=(-1)^j*nchoosek(n,j);
end
fe = f(xe); % Function at Chebyshev points
numer = zeros(size(xx)); % numerator of barycentric Lagrange polynomial
denom = zeros(size(xx)); % denominator of barycentric Lagrange polynomial
exact = zeros(size(xx)); % Identifies possible divisions by zero
for j = 1:n+1
    xdiff = xx-xe(j); 
    temp  = we(j)./xdiff; % The jth contribution
    numer = numer + temp*fe(j); % sum up to get the numerator
    denom = denom + temp; % sum up to get the denominator
    exact(xdiff==0) = j; % Find indices where division by zero occurs
end
ffe = numer./denom; % Approximation
jj = find(exact); % Assess the indices where there was division by zero
ffe(jj) = fe(exact(jj)); % These should just be the function value

subplot(2,1,2),plot(xe,fe,'.--',xx,ffe,'-','MarkerSize',20)
%legend('f(x) = |x| + x/2 - x^2','barycentric Lagrange approximation')
legend('f(x) = 1/(1+25x^2)','barycentric Lagrange approximation')
title(['Equidistant points, max error = ',num2str(norm(f(xx)-ffe,'inf'))])



