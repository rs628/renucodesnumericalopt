function G = rosenbrockGrad(x)
%G = [-200*(x(2) - x(1).^2)*2*x(1)-2*(1-x(1));
 %       200*(x(2) - x(1).^2)];
 G = [20* x(1);2*x(2)];
 
end