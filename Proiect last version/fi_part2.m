% Creates a matrix with the lines after the polynomial computation
% d - delayed matrix
% m - degree
% N - length of the input vector
function [fi] = fi_part2(d,m,N)
fi = [];
for i = 1 : 1 : N
    y_line = polyn_part2(m, (d(:,i))' ); % takes every column from the delayed matrix
    fi = [fi ; y_line]; % adds the column as a line into the new phi matrix
end

