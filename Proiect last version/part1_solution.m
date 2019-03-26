clear;
% Load our data set
load('proj_fit_22');

x1=id.X{1, 1};
x2=id.X{2, 1};
y=id.Y;

m=2; % degree for the polynomial approximator

fii = fi_part1(m,x1,x2,y); % regressors matrix
yhi= yhat_part1(fii,y); % the approximated matrix
MSEi = mse_part1(y,yhi); % mean square error
figure;
plot(MSEi);
title('MSE for identification');
xlabel('degree');
ylabel('MSE');
mean(MSEi);

% Identification DATA
figure;
mesh(x1,x2,y);
title('DATA identification'); 
xlabel('X.1 identification');
ylabel('X.2 identification');
zlabel('Y identification');

% Validation data

x1v=val.X{1, 1};
x2v=val.X{2, 1};
yv=val.Y;

fiv = fi_part1(m,x1v,x2v,yv); % regressors matrix
yhv= yhat_part1(fiv, yv); % the approximated matrix
MSEv = mse_part1(yv,yhv); % mean square error
figure;
plot(MSEv);
title('MSE for validation');
xlabel('degree');
ylabel('MSE');
mean(MSEv);

figure;
mesh(x1v,x2v,yv,'edgecolor','r');hold on; % plot of the given set
mesh(x1v,x2v,yhv,'edgecolor','g'); % plot of the model
title('DATA '); 
xlabel('X.1');
ylabel('X.2');
zlabel('Y');







