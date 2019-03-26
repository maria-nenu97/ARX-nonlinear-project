% This function computes the approximated matrix)
% fi - regressors matrix
% y- input data
function [yhat] = yhat_part1(fi, y)
 N = length(y);
 y= y(:);
 theta = fi\y;  %matrix for the constants of the polynomial
 yhat = fi * theta; 
 yhat = reshape(yhat , [N N]);
end

