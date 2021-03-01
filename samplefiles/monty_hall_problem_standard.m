% Monty Hall problem
% January 27, 2021


clear;

numruns=1000000;
noswitchwin=0; switchwin=0;
for i=1:numruns
    %Randomly place money ($300) behind one of three doors
    money=randperm(3,1);
    %Contestant randomly picks a door
    firstpick=randperm(3,1);
    %Note that we don't have to simulate actions of host.
    if(firstpick==money)
    %if(money==1) %  Contestant always picks door k first- Here k = 1
        noswitchwin=noswitchwin+1; 
    else
        switchwin=switchwin+1;
    end
end
prob=[noswitchwin switchwin]/numruns;
prob