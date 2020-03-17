

x = linspace(-10,10,100);
y = linspace(-10,10,100);
[x,y] = meshgrid(x,y);
contour3(x,y,rosenbrock(x,y),100)
%axis('equal');
view(0,90)
hold on


%% redefine function for optimization.
% in the form that it accepts vector input
f = @(v)(myFun(v));
% gradf = @(v)(rosenbrockGrad(v));
% gradfAuto = @(v)(admDiffFor(@myFun, 1, v)');


x0 = [10;15];

n=2;    .%no.of collums in vector Xo
tol = 1e-8;
err = 1;

for k = 1:40
    k

     g0 = admDiffFor(@rosenbrock, 1, x0)
     B0=ones(size(n))
    % p0= -g0/B0 ;
     x1 = x0 + p0;
     s0=  x1 - x0;
     g1=admDiffFor(@myFun, 1, x1)
     y0= g1 -g0;
     %secant equation
     B1 =s0./ y0  
     %SR rank one model 
  %   B1=B0+(                   )
    
    
    
      %BFGS model
    
  %  
     
    
    
     
%     
    
    plot([x0(1),x1(1)],[x0(2),x1(2)],'--o' );
    hold  on
    
    err = norm(x1-x0);
    if err < tol
        break
    end    
    
    x0 = x1
    %alpha = alphaStart;
    
end
