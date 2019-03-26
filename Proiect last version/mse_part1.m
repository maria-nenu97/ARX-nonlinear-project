%This function finds the mean square error 
%y- input data
%yhat- aproximatted matrix
function [MSE] = mse_part1(y,yhat)
   N = length(y);
   MSE = 1/N *( sum ((y - yhat).^2));
end

