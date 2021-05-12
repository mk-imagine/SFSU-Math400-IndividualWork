function []= num_diff(f,fprime,x,h)
% Forward, backward and centered difference approximations
% for the first derivative
% Inputs
% f      - the function to be differentiated
% fprime - the exact derivative function
% x      - the point where the derivative is needed
% h      - the step/discretization size
% Output


exact_deriv_value = fprime(x);

%% Forward difference
id = 1;
fpappx = first_diff(f,x,h,id);
error  = abs(exact_deriv_value - fpappx);
eh = error./h;

disp('Forward difference')
fprintf('%12s \t\t %18s \t\t %20s\n','h', 'error', 'error/h')
for i=1:length(h)
    fprintf('%16.12f\t\t %16.12e\t\t %16.12f\n',h(i),error(i),eh(i))
end

%% Backward difference
id = 2;
fpappx = first_diff(f,x,h,id);
error  = abs(exact_deriv_value - fpappx);
eh = error./h;

disp('Backward difference')
fprintf('%12s \t\t %18s \t\t %20s\n','h', 'error', 'error/h')
for i=1:length(h)
    fprintf('%16.12f\t\t %16.12e\t\t %16.12f\n',h(i),error(i),eh(i))
end

%% Centered difference
id = 3;
fpappx = first_diff(f,x,h,id);
error  = abs(exact_deriv_value - fpappx);
eh2 = error./h.^2;

disp('Centered difference')
fprintf('%12s \t\t %18s \t\t %20s\n','h', 'error', 'error/h^2')
for i=1:length(h)
    fprintf('%16.12f\t\t %16.12e\t\t %16.12f\n',h(i),error(i),eh2(i))
end

%%
function [fp]= first_diff(f,x,h,id)
    if     (id==1)
        fp = (f(x+h) - f(x))./h; 
    elseif (id==2)
        fp = (f(x) - f(x-h))./h; 
    else
        fp = (f(x+h) - f(x-h))./(2*h); 
    end
end

end