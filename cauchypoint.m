function p=cauchypoint(g,delta0,B)
%Cauchy Direction:
  p0s=-(delta0*g)/norm(g);
if (g'*B*g)<=0 
    tau=1;
else
    tau=min(   ( norm(g)^3)/(delta0*g'*B*g),    1);
   
end
%cauchy point
    p=(tau*p0s);
end
