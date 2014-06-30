function varargout = mainFigure(varargin)
% MAINFIGURE MATLAB code for mainFigure.fig
%      MAINFIGURE, by itself, creates a new MAINFIGURE or raises the existing
%      singleton*.
%
%      H = MAINFIGURE returns the handle to a new MAINFIGURE or the handle to
%      the existing singleton*.
%
%      MAINFIGURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFIGURE.M with the given input arguments.
%
%      MAINFIGURE('Property','Value',...) creates a new MAINFIGURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainFigure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainFigure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainFigure

% Last Modified by GUIDE v2.5 30-Jun-2014 11:38:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainFigure_OpeningFcn, ...
                   'gui_OutputFcn',  @mainFigure_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainFigure is made visible.
function mainFigure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainFigure (see VARARGIN)
global robot_selected;
% Choose default command line output for mainFigure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainFigure wait for user response (see UIRESUME)
% uiwait(handles.fig_main);

robot_selected=1;
mainFigure_Refresh;

% --- Outputs from this function are returned to the command line.
function varargout = mainFigure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_T_current_Callback(hObject, eventdata, handles)
% hObject    handle to edit_T_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_T_current as text
%        str2double(get(hObject,'String')) returns contents of edit_T_current as a double


% --- Executes during object creation, after setting all properties.
function edit_T_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_T_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in list_robots.
function list_robots_Callback(hObject, eventdata, handles)
global robot_selected;
% hObject    handle to list_robots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_robots contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_robots
contents = cellstr(get(hObject,'String'));
robot_selected=str2double(contents{get(hObject,'Value')});

% --- Executes during object creation, after setting all properties.
function list_robots_CreateFcn(hObject, eventdata, handles)
global robot_selected;
% hObject    handle to list_robots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
robot_selected=1;

% --- Executes on button press in btn_add.
function btn_add_Callback(hObject, eventdata, handles)
% hObject    handle to btn_add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h_robotSetting h0;
h0=handles;
h_robotSetting=robotSetting();
uiwait(h_robotSetting);
mainFigure_Refresh;

% --- Executes on button press in btn_edit.
function btn_edit_Callback(hObject, eventdata, handles)
% hObject    handle to btn_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h_robotSetting h0 robot_selected;
h0=handles;
h_robotSetting=robotSetting(robot_selected);
uiwait(h_robotSetting);
mainFigure_Refresh;

% --- Executes on button press in btn_remove.
function btn_remove_Callback(hObject, eventdata, handles)
% hObject    handle to btn_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h_robotSetting robot_selected p;
if ishghandle(h_robotSetting)
    close(h_robotSetting);
end
if size(p,2)>1
    removeRobot(robot_selected);
    if robot_selected>size(p,2)
        robot_selected=robot_selected-1;
        set(handles.list_robots,'Value',robot_selected);    
    end
end
mainFigure_Refresh;



% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes during object creation, after setting all properties.
function fig_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fig_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btn_play.
function btn_play_Callback(hObject, eventdata, handles)
% hObject    handle to btn_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_pause.
function btn_pause_Callback(hObject, eventdata, handles)
% hObject    handle to btn_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_stop.
function btn_stop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
