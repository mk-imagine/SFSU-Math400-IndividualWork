% Ehrenfests' urn
clear all;
clc
nruns=1000; % number of experiments
nsteps=1000; % number of steps in each experiment

Xt = 0; 
for i=1:nruns
    X=0; % initial number of balls in left urn
    for j=1:nsteps
        n=randperm(100,1);
        if n > X
            X = X+1; 
        else
            X = X-1;
        end
    end
    Xt = Xt + X;
end
Xt/nruns


