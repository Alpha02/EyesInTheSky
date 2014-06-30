
function [ insight] = inSightCircleMat( p,x,y,w,h )
global camC camZ camTheta;
%inSightCircle Summary of this function goes here
%   Detailed explanation goes here
    c=getCamSta(p,camC);
    z=getCamSta(p,camZ);
    theta=getCamSta(p,camTheta);
    [PX,PY]=meshgrid([x:x+w-1],[y:y+h-1]);
    PX=PX-c(1);
    PY=PY-c(2);
    insight=1-im2bw(((PX.^2+PY.^2).^0.5)./(z)-tan(theta),0);
end

