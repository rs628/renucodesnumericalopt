% % g = admDiffFor(@myFun, 1, x)
% % 
% % H = admHessFor(@myFun, 1, x)
% % 
% % p = -H\g'

x = linspace(-10,10,50);
y = linspace(-10,10,50);
[x,y] = meshgrid(x,y);
contour3(x,y,rosenbrock1(x,y),100)
%axis('equal');
view(0,90)
hold on


% %% redefine function for optimization.
% in the form that it accepts vector input
f = @(v)(rosenbrock(v));
gradf = @(v)(rosenbrockGrad(v));
%gradfAuto = @(v)(admDiffFor(@myFun, 1, v)');


x0 = [10;15];
tol = 1e-8;
err = 1;
alphaMax=10;
for k = 1:40
    k
    dir = -gradf(x0)
    %   dir = -admDiffFor(@myFun, 1, x0)
    of = f(x0);

    
    %alpha = mb_nocLineSearch(f,gradf,x0,dir,-dir'*dir,of);
     
    alpha =renumb_backtracking(f,x0,dir,slope0,alphaMax);
     x1 = x0 + alpha*dir;
     plot([x0(1),x1(1)],[x0(2),x1(2)],'--o' );
      hold  on
     err = norm(x1-x0);
     if err < tol
        break
     end    
     x0 = x1;
   
    
end