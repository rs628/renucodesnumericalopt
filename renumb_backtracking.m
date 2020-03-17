function alpha =renumb_backtracking(f,x0,dir,slope0,alpha)

c_1  = 0.0001;
c_2  =0.5;        % < 1 reduction factor of alpha

  while ( f(x0+alpha*dir)>f(x0)+c_1*alpha*slope0)
  
      alpha =c_2*alpha;
        
  end
    
