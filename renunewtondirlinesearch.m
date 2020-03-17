clc
clear

x = linspace(10,-10,50);
y = linspace(10,-30,50);
[x,y] = meshgrid(x,y);
contour3(x,y,rosenbrock1(x,y),50)
axis('equal');
view(0,90)
hold on

% %% redefine function for optimization.
% % in the form that it accepts vector input
 f = @(v)(rosenbrock(v));
% gradfAuto = @(v)(admDiffFor(@rosenbrock, 1, v)');% automatic differentiation
 x0 = [5;5];
 tol = 1e-8;


for k = 1:100
     k
     
         dir = admDiffFor(@rosenbrock, 1, x0);
         dir=dir';
         %for newton direction
          H = admHessFor(@rosenbrock, 1, x0);
          slope0=-H\dir
        
         alpha=1;       
         x1 = x0 + alpha*slope0;   % Newton direction
         plot([x0(1),x1(1)],[x0(2),x1(2)],'--o' );
         hold  on
    
        err = norm(x1-x0);
         if err < tol
          break
         end 
        x0 = x1;
    
    
end