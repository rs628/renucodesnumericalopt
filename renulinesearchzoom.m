
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
 gradf = @(v)(rosenbrockGrad(v)) ;                 % continous differentiation
%  gradf = @(v)(admDiffFor(@myFun, 1, v)');        % automatic differentiation
 
 x0 = [1;5];
 tol = 1e-8;
 err=1;
 i=1;

 while 1
  i=i+1   
 dir = -gradf(x0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 % code for alpha
 alphamax=100;
 alpha0=0;%initial value of alpha (i-1)
 alpha1=1;
 phi=@(alpha)(f(x0 + alpha*dir));
 gradphi=@(alpha)(gradf(x0+alpha*dir)'*dir);
 
 phialpha_prev=phi(alpha0);
 c1=.0001;c2=.5;

 
  while 1
      
 
       
   if  (phi(alpha1) > phi(0)+c1*alpha1*gradphi(0))||( phi(alpha1)>= phi(alpha0))
           
                alpha_lo=alpha0; alpha_hi=alpha1;
                alpha=renuzoom(alpha_lo,alpha_hi,phi,gradphi)
                break
                
   end         
     
   if  abs(gradphi(alpha1))<=- c2*gradphi(0)
                alpha=alpha1; 
                 break
                 
   end
                  
   if     gradphi(alpha1) >=0
          alpha_lo=alpha1; alpha_hi=alpha0 ; %  alphamax;
          alpha=renuzoom(alpha_lo,alpha_hi,phi,gradphi); break
          
   end 
    

       alpha0=alpha1; % alpha from previous iterations
       alpha = min(alphamax,alpha1*2);
       alpha1=alpha ;
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha1 = alpha;  

      x1=x0 + alpha1.*dir;
      plot([x0(1),x1(1)],[x0(2),x1(2)],'--o' );
      pause(0.01)  
      hold  on
      err = norm(x1-x0);
      if err < tol
      break
      end
       
     x0 = x1
       
 end 
           

    