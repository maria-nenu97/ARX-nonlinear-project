% This function returns the matrix of the regressors
% m - the degree of the approximator
% x1,x2, y - input data
function [fi] = fi_part1(m,x1,x2,y)
 N = length(y);
 poz = 1;
 fi = ones(N*N,1); % creates a column of ones

  for i =1:1:m
      vx1= [];
      vx2 = [];
      for k= 1:1:N
          for j=1:1:N
      vx1 = [vx1 x1(k)^(i)];
      vx2 = [vx2 x2(j)^(i)];
          end
      end
      poz = poz+1;
      fi(:,poz) = vx1()';
      poz=poz+1;
      fi(:,poz) =  vx2()'; 
  end
 
   for i = 1:1:m-1
       for j = 1:1:i
           if (i~=j)
                vx1 = [];
                vx2 = [];
                for k=1:1:N
                    for l = 1:1:N
                        vx1= [vx1 (x1(k)^(i)* x2(l)^(j))];
                        vx2= [vx2 (x2(l)^(i)* x1(k)^(j))];
                    end
                end
                poz = poz+1;
                fi(:,poz) = vx1()';
                poz = poz+1;
                fi(:,poz) = vx2()';
           else
                if ( i == 1 && j == 1) % for x1*x2
                    vx1 = [];
                    for k=1:1:N
                        for l=1:1:N
                            vx1 = [vx1 x1(k)^(i)* x2(l)^(j)];
                        end
                    end
                poz = poz+1;
                fi(:,poz) = vx1()';
                end
           end
       end
   end
end