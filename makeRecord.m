function [ rec ] = makeRecord( t,p )
global recX recY recZ recRoll recPitch recYaw recF recExist;
global camC camZ camPsi_roll camPsi_pitch camPsi_yaw;
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
        recX(t,p)=camC(1,p);
        recY(t,p)=camC(2,p);
        recZ(t,p)=camZ(p);
        recRoll(t,p)=camPsi_roll(p);
        recPitch(t,p)=camPsi_pitch(p);
        recYaw(t,p)=camPsi_yaw(p);
        recF(t,p)=0;
        recExist(t,p)=1;

end

