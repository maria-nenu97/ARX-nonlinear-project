clear;
% load our data set
load('iddata-11.mat');
uid = id.U; % real input
yid = id.Y; % real output
Nid = length(uid); % length of the input vector

% IDENTIFICATION
figure;
plot(uid,yid);
title('DATA identification');
xlabel('input identification');
ylabel('output identification');

m = 1; %degree
na = 1; % order
nb = 1; % order
nk = 1; % delay

pid = prediction_part2(na,nb,nk,uid,yid,Nid); % delayed matrix
fiidp = fi_part2(pid,m,Nid);
teta = fiidp\yid; % constants of the polynomial
yhatpid = fiidp * teta; % one-step-ahead prediction model

sid = simulation_part2(uid, na,nb,nk,Nid);
fiidd = fi_part2(sid,m,Nid);
yhatsid = fiidd * teta  ; % simulation model

MSEidp = mse_part2(yid,yhatpid); %MSE for the one-step-ahead predicion
MSEids = mse_part2(yid,yhatsid); %MSE for the simulation

figure
plot(yid);hold on
plot(yhatpid);hold on
legend('real output','prediction method model');
title('Fit on the training data set for prediction');
xlabel('time identification');
ylabel('output identification');

figure
plot(yid);hold on
plot(yhatsid); 
legend('real output','simulation method model');
title('Fit on the training data set for simulation');
xlabel('time identification');
ylabel('output identification');

%% VALIDATION
uval = val.U;
yval = val.Y;
Nval = length(uval);

pval = prediction_part2(na,nb,nk,uval,yval,Nval); % delayed matrix
fivalp = fi_part2(pval,m,Nval);
yhatpval = fivalp * teta; % one-step-ahead prediction model

sval = simulation_part2(uval, na,nb,nk,Nval);
fivals = fi_part2(sval,m,Nval);
yhatsval = fivals * teta; % simulation model

MSEvalp = mse_part2(yval,yhatpval); %MSE for the one-step-ahead predicion
MSEvals = mse_part2(yval,yhatsval); %MSE for the simulation

figure
plot(yval);hold on
plot(yhatpval); 
legend('real output','prediction method model');
title('Fit on the validation data set for prediction');
xlabel('time validation');
ylabel('output validation');

figure
plot(yval);hold on
plot(yhatsval);
legend('real output','simulation method model');
title('Fit on the validation data set for simulation');
xlabel('time validation');
ylabel('output validation');



