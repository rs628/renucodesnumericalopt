function alpha=renuzoom(alpha_lo,alpha_hi,phi,gradphi)
c1=.0001;c2=.5;
k = 0;
while 1
 k = k+1;
alpha_j=(alpha_lo+alpha_hi)/2;% interpolation by bisection method

%    alpha_lo
%    alpha_hi
%    alpha_j 

   phi(alpha_j);
   
if phi(alpha_j) > phi(0)+c1*alpha_j*gradphi(0) || phi(alpha_j)>=phi(alpha_lo)
     alpha_hi= alpha_j;


else
    gradphi(alpha_j);
    if  abs(gradphi(alpha_j))<=- c2*gradphi(0)
       
               alpha=alpha_j;
         break
    end
             
    if gradphi(alpha_j)*(alpha_hi-alpha_lo)>=0
      
           alpha_hi=alpha_lo;
    end
           alpha_lo=alpha_j; 
  
    end
         
end             
end
  
    
  
 

 


 
