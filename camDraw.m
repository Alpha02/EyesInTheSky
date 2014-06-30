function camDraw( current_p,types,c,z,yaw,pitch,roll,b,theta,theta2,axes_handle,add_in)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global mapSize mapCenter p;
    myColor=hsv2rgb([(current_p-1)/(size(p,2)+add_in),1,1]);
    if current_p>size(p,2)
        myAlpha=0.6;
    else
        myAlpha=0.3/(size(p,2)+add_in)+0.2;    
    end
    axis([mapCenter(1)-mapSize(1),mapCenter(1)+mapSize(1),mapCenter(2)-mapSize(2),mapCenter(2)+mapSize(2)]);
    set(axes_handle,'Color',[0,0,0]);
    r=z.*tan(theta);
    
    switch types
        case 0
            [X0,Y0,Z0]=cylinder([r,0]);
            X0=X0+c(1);
            Y0=Y0+c(2);
            Z0=Z0.*z;
            
            surf(X0,Y0,Z0,'EdgeAlpha',0,'FaceAlpha',myAlpha,'FaceColor',myColor);            
        case 1
            dx=z*tan(theta);
            dy=z*tan(theta2);
            xy_list=[-dx,-dx,dx,dx;dy,-dy,-dy,dy];
            R=[ cos(yaw),   sin(yaw);
                -sin(yaw),  cos(yaw)
              ];
            xy_list=R*xy_list;
            X0=[0,xy_list(1,1);0,xy_list(1,2);0,xy_list(1,3);0,xy_list(1,4);0,xy_list(1,1)];
            Y0=[0,xy_list(2,1);0,xy_list(2,2);0,xy_list(2,3);0,xy_list(2,4);0,xy_list(2,1)];
            X0=X0+c(1);
            Y0=Y0+c(2);
            Z0=[z,0;z,0;z,0;z,0;z,0];
            surf(X0,Y0,Z0,'EdgeAlpha',0,'FaceAlpha',myAlpha,'FaceColor',myColor);       
        case 2
    end
    if current_p>max(p)
    plot3(c(1),c(2),z,'o','MarkerSize',15,'MarkerFaceColor',[1,1,1])
    
    else
    plot3(c(1),c(2),z,'o','MarkerSize',15,'MarkerFaceColor',myColor)
    end
    text(c(1),c(2),z*1.2,int2str(current_p), 'HorizontalAlignment','center');
end

