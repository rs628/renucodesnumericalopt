function alpha = renunocZoom(f,gradF,x,dir,slope0,alphaLo,alphaHi,of_0,ofLo,c1,c2)

while 1
    
    alpha = (alphaLo+alphaHi)/2;
    xc    = x + alpha*dir;
    of    = f(xc);
    
    if of > of_0 + c1*alpha*slope0 || of >= ofLo
        % if we do not observe sufficient decrease in point alpha, we set
        % the maximum of the feasible interval to alpha
        alphaHi = alpha;       
    else
        slopec = gradF(xc)'*dir;
        % strong wolfe fullfilled?
        if abs(slopec) <= -c2*slope0
            return;
        end
        if slopec*(alphaHi-alphaLo) >= 0 % if slope positive and alphaHi > alphaLo  
            alphaHi = alphaLo;
            alphaLo = alpha;
            ofLo    = of;
        end
    end
    
end
