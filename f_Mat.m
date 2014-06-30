function [ f_all ] = f( p,x,y,w,h)
global camB camZ camTheta camType;
%f_area_per_pixel Summary of this function goes here
% p:camera id
% q:a part of Q
% a:area of one pixel divided by the square of the focal length of the lens
%   Detailed explanation goes here
        b=getCamSta(p,camB);
        a=b.^(-2);
        z=getCamSta(p,camZ);
        theta=getCamSta(p,camTheta);
        type=getCamSta(p,camType);
        f_all=zeros(w,h);
    for i=1:size(p,2)
        switch type(i)
            case 0 
                ins=inSightCircleMat(p(i),x,y,w,h);
            case 1 
                ins=inSightRectMat(p(i),x,y,w,h);
            case 2 
                ins=inSightRectMat(p(i),x,y,w,h);
        end
        f=a(i).*((b(i)-z(i)).^2);
        w_prior=10;
        f_all=f_all+ins.*f.^(-1)+1/w_prior;
    end
    f_all=f_all.^(-1);
   image(f_all,'CDataMapping','Scaled');

end

