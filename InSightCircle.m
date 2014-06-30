function [ insight] = inSightCircle( p,q )
%inSightCircle Summary of this function goes here
%   Detailed explanation goes here
    c=getCamSta(p,camC);
    z=getCamSta(p,camZ);
    theta=getCamSta(p,camTheta);
    b=norm(q-c)/z-tan(theta);
    if b<=0 
        insight=true;
    else
        insight=false;
    end
    
end

