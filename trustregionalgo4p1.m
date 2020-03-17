x = linspace(10,-10,50);
y = linspace(10,-10,50);
[x,y] = meshgrid(x,y);
contour3(x,y,rosenbrock1(x,y),50)
axis('equal');
view(0,90)
hold on
%  redefine function for optimization.
% in the form that it accepts vector input
 f = @(v)(rosenbrock(v));
% gradf = @(v)(rosenbrockGrad(v)) ;% continous differentiation
 gradf = @(v)(admDiffFor(@rosenbrock, 1, v));        % automatic differentiation
  H =@(v)(admHessFor(@rosenbrock, 1, v));
  tol = 1e-8;
  err=1;
  i=1;
 deltabar=1; delta0=0.5; eta=0.15;
 x0 = [5;5];
 
 for k=1:10000
     k
 g = gradf(x0)';
%  F=f(x0);
 B=H(x0)';
 m=@(p)(f(x0)+g'*p+0.5*p'*B*p) ;
%p=cauchypoint(g,delta0,B);
 p=dogleg(g,B,delta0);
 p0=p;
 vec0=zeros(size(x0));
 rho=(f(x0)-f(x0+p0))/(m(vec0)-m(p0));
 if rho < 0.25
        delta = 0.25*norm(p0);  
 end
         if rho > 0.75 && norm(p0) < delta0
                delta1 = min(2*delta0, deltabar);
         else
                delta1=delta0;

         end     
    
   if rho > eta
        x1 = x0 + p0;
   else
        x1 = x0;
   end
   
 
      plot([x0(1),x1(1)],[x0(2),x1(2)],'--o' );
      pause(0.01)  
      hold  on
       err = norm(x1-x0);
      if err < tol
      break
      end
       
     x0 = x1
       
 end 
           
