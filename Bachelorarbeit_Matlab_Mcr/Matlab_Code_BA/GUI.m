function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 24-Aug-2019 16:08:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function boxIy_Callback(hObject, eventdata, handles)
% hObject    handle to boxIy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxIy as text
%        str2double(get(hObject,'String')) returns contents of boxIy as a double


% --- Executes during object creation, after setting all properties.
function boxIy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxIy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxIz_Callback(hObject, eventdata, handles)
% hObject    handle to boxIz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxIz as text
%        str2double(get(hObject,'String')) returns contents of boxIz as a double


% --- Executes during object creation, after setting all properties.
function boxIz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxIz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxIw_Callback(hObject, eventdata, handles)
% hObject    handle to boxIw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxIw as text
%        str2double(get(hObject,'String')) returns contents of boxIw as a double


% --- Executes during object creation, after setting all properties.
function boxIw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxIw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxIt_Callback(hObject, eventdata, handles)
% hObject    handle to boxIt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxIt as text
%        str2double(get(hObject,'String')) returns contents of boxIt as a double


% --- Executes during object creation, after setting all properties.
function boxIt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxIt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxE_Callback(hObject, eventdata, handles)
% hObject    handle to boxE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxE as text
%        str2double(get(hObject,'String')) returns contents of boxE as a double


% --- Executes during object creation, after setting all properties.
function boxE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxG_Callback(hObject, eventdata, handles)
% hObject    handle to boxG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxG as text
%        str2double(get(hObject,'String')) returns contents of boxG as a double


% --- Executes during object creation, after setting all properties.
function boxG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxzEinzel_Callback(hObject, eventdata, handles)
% hObject    handle to boxzEinzel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxzEinzel as text
%        str2double(get(hObject,'String')) returns contents of boxzEinzel as a double


% --- Executes during object creation, after setting all properties.
function boxzEinzel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxzEinzel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxPsi_Callback(hObject, eventdata, handles)
% hObject    handle to boxPsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxPsi as text
%        str2double(get(hObject,'String')) returns contents of boxPsi as a double


% --- Executes during object creation, after setting all properties.
function boxPsi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxPsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxMcr_Callback(hObject, eventdata, handles)
% hObject    handle to boxMcr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxMcr as text
%        str2double(get(hObject,'String')) returns contents of boxMcr as a double


% --- Executes during object creation, after setting all properties.
function boxMcr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxMcr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonBerechnen.
function pushbuttonBerechnen_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonBerechnen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
L = str2num(get(handles.boxFeldlaenge,'String'));
Iy = str2num(get(handles.boxIy,'String'));
Iz = str2num(get(handles.boxIz,'String'));
Iw = str2num(get(handles.boxIw,'String'));
It = str2num(get(handles.boxIt,'String'));
E = str2num(get(handles.boxE,'String'));
G = str2num(get(handles.boxG,'String'));
zPz = str2num(get(handles.boxzEinzel,'String'));
zpz = str2num(get(handles.boxzLinie,'String'));
psi = str2num(get(handles.boxPsi,'String'));

if zPz>0
    f = warndlg('zPz darf nicht größer 0 sein! Für Lastangriff unterhalb des Schubmittelpunkts muss Mcr interpoliert werden.','Warnung')
end

if zpz>0
    f = warndlg('zpz darf nicht größer 0 sein! Für Lastangriff unterhalb des Schubmittelpunkts muss Mcr interpoliert werden.','Warnung')
end
    
System_index = get(handles.Systemauswahl, 'Value'); %Welches Statische System wurde ausgewählt

switch System_index
    case 1
        Mcr = GabellagerEinzellastGUI(L,psi,Iy,Iz,It,Iw,E,G,zPz);
        set(handles.boxMcr,'String',num2str(Mcr));
    case 2
        Mcr=EingespanntEinzellastGUI(L,psi,Iy,Iz,It,Iw,E,G,zPz);
        set(handles.boxMcr,'String',num2str(Mcr));
    case 3
        Mcr=GabellagerLinienlastGUI(L,psi,Iy,Iz,It,Iw,E,G,zpz);
        set(handles.boxMcr,'String',num2str(Mcr));
    case 4
        Mcr=EingespanntLinienlastGUI(L,psi,Iy,Iz,It,Iw,E,G,zpz);
        set(handles.boxMcr,'String',num2str(Mcr));    
end


% --- Executes on button press in checkboxGabellager.
function checkboxGabellager_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxGabellager (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxGabellager


% --- Executes on button press in checkboxEinspannung.
function checkboxEinspannung_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxEinspannung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxEinspannung


% --- Executes on selection change in Systemauswahl.
function Systemauswahl_Callback(hObject, eventdata, handles)
% hObject    handle to Systemauswahl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Systemauswahl contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Systemauswahl


% --- Executes during object creation, after setting all properties.
function Systemauswahl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Systemauswahl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', {'Beiseitig Gabellager Einzellast Mitte', 'Beidseitig Einspannung Einzellast Mitte', 'Beiseitig Gabellager Linienlast','Beidseitig Einspannung Linienlast'}); 



function boxFeldlaenge_Callback(hObject, eventdata, handles)
% hObject    handle to boxFeldlaenge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxFeldlaenge as text
%        str2double(get(hObject,'String')) returns contents of boxFeldlaenge as a double


% --- Executes during object creation, after setting all properties.
function boxFeldlaenge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxFeldlaenge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function boxzLinie_Callback(hObject, eventdata, handles)
% hObject    handle to boxzLinie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boxzLinie as text
%        str2double(get(hObject,'String')) returns contents of boxzLinie as a double


% --- Executes during object creation, after setting all properties.
function boxzLinie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boxzLinie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
