%assume Q is planar
clear;
global camB camC camZ camPsi_roll camPsi_pitch camPsi_yaw camTheta camTheta2 camType p;
global camT_begin camT_end;
global mapSize mapCenter timeSpan;
global robotsetting_table;
timeSpan=100;
mapSize=[100,100];
mapCenter=[0,0];
robotsetting_table=[0;0;0;0;0;0];
p=[1,2,3,4];
camType=[1,1,0,0];
%camType:
%   0=circle
%   1=rectangle with 1 degree of freedom
%   2=rectangle with 6 degrees of freedom
camB=[];
camB=[3,3,3,3];
%camB:
%   focal length of the lens
camC=[1,50,1,50;1,1,50,50];
%camC:
%   (x,y)

camZ=[15,16,17,18];
%camZ:
%   z

camTheta=[1,0.5,1,1];
%camTheta:
%   half-view angles

%======RECTANGLE 1 DEGREE?FREEDOM PROPERTIES=========

camTheta2=[0.5,1,1,1];
camPsi_roll=[1,2,3,4];

%======RECTANGLE 6 DEGREE?FREEDOM PROPERTIES=========
camPsi_pitch=[1,1,1,1];
camPsi_yaw=[1,1,1,1];

camT_begin=[0,0,0,0];
camT_end=[100,100,100,100];
clearRecord();






