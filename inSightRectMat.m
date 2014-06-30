function [ insight] = inSightRectMat( p,x,y,w,h )
global camC camZ camTheta camTheta2 camPsi_roll;
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
    [PX,PY]=meshgrid(x:x+w-1,y:y+h-1);
    AXY1=kron(R(:,1),PX-c(1));
    AXY2=kron(R(:,2),PY-c(2));
    AXY3=AXY1+AXY2;
    AX=AXY3(1:h,1:w);
    AY=AXY3(1+h:2*h,1:w);
    bx=1-im2bw(abs(AX)-tan(theta).*z);
    by=1-im2bw(abs(AY)-tan(theta2).*z);
    insight=bx.*by;
end

