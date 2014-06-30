global p h0;
current_p=get(handles.fig_robotSetting,'UserData');
h=get(handles.group_camType,'SelectedObject');
type=get(h,'UserData');
    switch type
        case 0
            set(handles.edit_yaw,'Enable','off');
            set(handles.edit_pitch,'Enable','off');
            set(handles.edit_roll,'Enable','off');
            set(handles.edit_theta2,'Enable','off');
        case 1
            set(handles.edit_yaw,'Enable','on');
            set(handles.edit_pitch,'Enable','off');
            set(handles.edit_roll,'Enable','off');
            set(handles.edit_theta2,'Enable','on');
        case 2
            set(handles.edit_yaw,'Enable','on');
            set(handles.edit_pitch,'Enable','on');
            set(handles.edit_roll,'Enable','on');
            set(handles.edit_theta2,'Enable','on');
    end

B=str2double(get(handles.edit_b,'String'));
x=str2double(get(handles.edit_x,'String'));
y=str2double(get(handles.edit_y,'String'));    
C=[x;y];
Z=str2double(get(handles.edit_z,'String'));
Psi_yaw=str2double(get(handles.edit_yaw,'String'));
Psi_pitch=str2double(get(handles.edit_pitch,'String'));
Psi_roll=str2double(get(handles.edit_roll,'String'));
Theta1=str2double(get(handles.edit_theta1,'String'));
Theta2=str2double(get(handles.edit_theta2,'String'));

figure(h0.fig_main);
cla();
hold on;
if current_p>size(p,2)
    add_in=true;
else 
    add_in=false;
end
camDraw(current_p,type,C,Z,Psi_yaw,Psi_pitch,Psi_roll,B,Theta1,Theta2,h0.axes_main,add_in);

for k=1:size(p,2)
    if k~=current_p
    camDrawIndex(k,h0.axes_main,add_in);
    end
end
hold off;
figure(handles.fig_robotSetting);
