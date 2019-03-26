%This function finds the mean square error
%y- real input values
%yhat- model
function [MSE] = mse_part2(y,yhat)
N = length(y);
MSE = 1/N *( sum ((y - yhat).^2));
end

