function removeRobot( t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global recX recY recZ recRoll recPitch recYaw;
global camB camC camZ camPsi_roll camPsi_pitch camPsi_yaw camTheta camTheta2 camType p;
    p(t+1:end)=p(t+1:end)-1;
    p=p(:,[1:t-1,t+1:end]);
    camB=camB(:,[1:t-1,t+1:end]);
    camC=camC(:,[1:t-1,t+1:end]);
    camZ=camZ(:,[1:t-1,t+1:end]);
    camPsi_roll=camPsi_roll(:,[1:t-1,t+1:end]);
    camPsi_pitch=camPsi_pitch(:,[1:t-1,t+1:end]);
    camPsi_yaw=camPsi_yaw(:,[1:t-1,t+1:end]);
    camTheta=camTheta(:,[1:t-1,t+1:end]);
    camTheta2=camTheta2(:,[1:t-1,t+1:end]);
    camType=camType(:,[1:t-1,t+1:end]);
    try
        recX=recX(:,[1:t-1,t+1:end]);
        recY=recY(:,[1:t-1,t+1:end]);
        recZ=recZ(:,[1:t-1,t+1:end]);
        recRoll=recRoll(:,[1:t-1,t+1:end]);
        recPitch=recPitch(:,[1:t-1,t+1:end]);
        recYaw=recYaw(:,[1:t-1,t+1:end]);
    catch exceptions;
    end
end

