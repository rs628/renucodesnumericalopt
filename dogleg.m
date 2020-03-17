function p=dogleg(g,B,delta0)



pb=-B\g;
if norm(pb)<=delta0 
    p=pb;
end   
pu=-((g'*g)/(g'*B*g))*g;

tau=delta0/norm(pu);
if tau<=1 && tau>=0
    
p=tau*pu;


else
a=(norm(pb-pu))^2;
b=2*(-a+pu'*(pb-pu));
c=(norm(pu))^2+a-2*pu'*(pb-pu)-(delta0)^2;

 tau1= (-b-sqrt(  b^2-(4*a*c)) )/(2*a);
 tau2=(-b+sqrt(b^2-(4*a*c)) )/(2*a);
if tau2>=1 &&  tau2<=2
    
    p=pu+(tau2-1) *(pb-pu) ;
else
    if tau1>=1 &&  tau1<=2
    
    p=pu+(tau1-1) *(pb-pu) ;
    
end

end 
end