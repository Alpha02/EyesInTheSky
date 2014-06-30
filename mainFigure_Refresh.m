global p;
set(handles.list_robots,'string',{});
cla();
hold on;
for k=1:size(p,2)
    str=get(handles.list_robots,'string');
    str{end+1}=int2str(p(k));
    set(handles.list_robots,'string',str);  
    camDrawIndex(k,handles.axes_main,false);
end
hold off;
rotate3d('on');