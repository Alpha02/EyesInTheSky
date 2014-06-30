function [ output_args ] = camDrawIndex( p ,axes_handle,add_in)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    global camB camC camZ camPsi_roll camPsi_pitch camPsi_yaw camTheta camTheta2 camType;
    b=getCamSta(p,camB);   
    type=getCamSta(p,camType);   
    c=getCamSta(p,camC);
    z=getCamSta(p,camZ);
    roll=getCamSta(p,camPsi_roll);
    pitch=getCamSta(p,camPsi_pitch);
    yaw=getCamSta(p,camPsi_yaw);
    theta=getCamSta(p,camTheta);
    theta2=getCamSta(p,camTheta2);
    camDraw( p,type,c,z,yaw,pitch,roll,b,theta,theta2,axes_handle,add_in )
end

