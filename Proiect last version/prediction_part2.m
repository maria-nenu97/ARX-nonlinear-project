% One-step-ahead prediction method
% Uses knowledge of the real delayed outputs of the system
% na,nb- orders
% nk- delay
% u- real input values
% y - real output values
% N - length of the input vector
function [d] = prediction_part2(na,nb,nk,u,y,N)
d = [];
for k=1:1:N
    v = [];
    for i = 1:1:na
        if ((k-i)<=0)
            v= [v,0];
        else
            v =[v, y(k-i)]; % real delayed outputs of the system
        end
    end
    
    for j = 1:1:nb
        if ((k-nk-j+1<=0))
            v =[v,0];
        else
            v =[v, u(k-nk-j+1)]; % real delayed inputs
        end
    end
    d = [d;v];
end
d = d';
end

