function [ f ] = f( p,q )
global camB camZ camTheta;
%f_area_per_pixel Summary of this function goes here
% p:camera id
% q:a part of Q
% a:area of one pixel divided by the square of the focal length of the lens
%   Detailed explanation goes here
    b=getCamSta(p,camB);
    a=b.^(-2);
    z=getCamSta(p,camZ);
    theta=getCamSta(p,camTheta);
    if inSightCircle(p,q)
        f=a.*((b-z).^2);
    else
        f=Inf;
    end
end

