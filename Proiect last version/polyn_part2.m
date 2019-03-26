% On this function depends the accuracy of our model
% It creates the polynomial computation for every output and input
% m- degree
% y - real output values
function [y_new] = polyn_part2(m,y)
poz = 1;
y_new = [];
y_new = [y_new 1]; % adds 1 as a first value

for i= 1:1:m
    for j = 1:1:length(y)
        y_new = [y_new (y(j))^i]; % adds new elements to our final vector
    end
end

matrix = [];
k=1;

for  nr_elements = 2 :1: length(y)
    matrix{k} = combnk(y,nr_elements); % creates matrices with every possible combination of our elements
    k=k+1;
end

for i=1:1: length(matrix)
    for j = 1:1: size(matrix{1,i},1) % 1 is used for the number of lines
        y_new= [y_new prod(matrix{1,i}(j,:))]; % calculates the product for every line from our created matrices and adds them in our final vector
    end
end
end
 
         

 