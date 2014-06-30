function [ insight] = inSightRect( p,q )
%inSightCircle Summary of this function goes here
%   Detailed explanation goes here
    c=getCamSta(p,camC);
    z=getCamSta(p,camZ);
    theta=getCamSta(p,camTheta);
    theta2=getCamSta(p,camTheta2);
    psi=getCamSta(p,camPsi_roll);   
    R=[ cos(psi),   sin(psi);
        -sin(psi),  cos(psi)
      ];
    b=R*abs(q-c)-tan([theta;theta2]).*z;
    if (b(1)<=0 && b(2)<=0) 
        insight=true;
    else
        insight=false;
    end
    
end

