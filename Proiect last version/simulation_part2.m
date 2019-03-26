% Simulation method
% Knowledge about the real outputs is not available
% We can only use previous outputs of the model
% u - real input values
% na, nb - orders
% nk - delay
% N - length of the input vector
function [y] = simulation_part2( u,na,nb,nk,N)
yhat = [];
for k=1:1:N
    v = [];
    for i = 1:1:na
        if ((k-i)<=0)
            v= [v,0];
        else
            v =[v, yhat(k-i)]; % simulated values of the output
        end
    end
    
    for j = 1:1:nb
        if ((k-nk-j+1<=0))
            v =[v,0];
        else
            v =[v, u(k-nk-j+1)]; % real delayed inputs
        end
    end
    yhat = [yhat; v];
end
y = yhat';
end