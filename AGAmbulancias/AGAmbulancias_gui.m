function varargout = AGAmbulancias_gui(varargin)
% AGAMBULANCIAS_GUI MATLAB code for AGAmbulancias_gui.fig
%      AGAMBULANCIAS_GUI, by itself, creates a new AGAMBULANCIAS_GUI or raises the existing
%      singleton*.
%
%      H = AGAMBULANCIAS_GUI returns the handle to a new AGAMBULANCIAS_GUI or the handle to
%      the existing singleton*.
%
%      AGAMBULANCIAS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AGAMBULANCIAS_GUI.M with the given input arguments.
%
%      AGAMBULANCIAS_GUI('Property','Value',...) creates a new AGAMBULANCIAS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AGAmbulancias_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AGAmbulancias_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AGAmbulancias_gui

% Last Modified by GUIDE v2.5 24-Apr-2016 11:05:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AGAmbulancias_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @AGAmbulancias_gui_OutputFcn, ...
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


% --- Executes just before AGAmbulancias_gui is made visible.
function AGAmbulancias_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AGAmbulancias_gui (see VARARGIN)

% Choose default command line output for AGAmbulancias_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AGAmbulancias_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AGAmbulancias_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editNumIndiv_Callback(hObject, eventdata, handles)
% hObject    handle to editNumIndiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNumIndiv as text
%        str2double(get(hObject,'String')) returns contents of editNumIndiv as a double


% --- Executes during object creation, after setting all properties.
function editNumIndiv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNumIndiv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNumGens_Callback(hObject, eventdata, handles)
% hObject    handle to editNumGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNumGens as text
%        str2double(get(hObject,'String')) returns contents of editNumGens as a double


% --- Executes during object creation, after setting all properties.
function editNumGens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNumGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editProbCross_Callback(hObject, eventdata, handles)
% hObject    handle to editProbCross (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editProbCross as text
%        str2double(get(hObject,'String')) returns contents of editProbCross as a double


% --- Executes during object creation, after setting all properties.
function editProbCross_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editProbCross (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editProbMut_Callback(hObject, eventdata, handles)
% hObject    handle to editProbMut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editProbMut as text
%        str2double(get(hObject,'String')) returns contents of editProbMut as a double


% --- Executes during object creation, after setting all properties.
function editProbMut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editProbMut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonEjecutar.
function buttonEjecutar_Callback(hObject, eventdata, handles)
% hObject    handle to buttonEjecutar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.buttonPesos,'enable','off');
set(handles.buttonEjecutar,'enable','off');
drawnow;

numIndiv = str2double(get(handles.editNumIndiv,'string'));
numGens = str2double(get(handles.editNumGens,'string'));
gensPar = str2double(get(handles.editGensPar,'string'));
porcent = str2double(get(handles.editPorcent,'string'));
probCross = str2double(get(handles.editProbCross,'string'));
probMut = str2double(get(handles.editProbMut,'string'));
decim = str2double(get(handles.editDecim,'string'));

switch get(get(handles.buttonGroupApt,'SelectedObject'),'Tag')
     case 'radioButtonRel'
        funcApt = 0;
     case 'radioButtonSum'
        funcApt = 1;
end

switch get(get(handles.buttonGroupSelecc,'SelectedObject'),'Tag')
     case 'radioButtonElit'
        funcSel = 0;
     case 'radioButtonRul'
        funcSel = 1;
end
 
[registro, respuesta] = algoritmoGenetico(numIndiv, numGens, gensPar, ...
    porcent, probCross, probMut, handles.matrix, funcApt, funcSel, decim);

%Guardo el registro en el workspace para poder acceder a todo su contenido
assignin('base', 'registro', registro);

set(handles.editTexto, 'String', respuesta);
set(handles.buttonPesos,'enable','on');
set(handles.buttonEjecutar,'enable','on');
drawnow;


% --- Executes on button press in buttonPesos.
function buttonPesos_Callback(hObject, eventdata, handles)
% hObject    handle to buttonPesos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
set(handles.editTexto, 'String', 'Calculando la matriz de pesos...');
set(handles.buttonPesos,'enable','off');
set(handles.buttonEjecutar,'enable','off');
drawnow;

maxBpv = str2double(get(handles.editBpv,'string'));
[matrix, respuesta] = inicializaAlgoritmo(maxBpv);
set(handles.buttonPesos,'enable','on');

if ~isempty(matrix)
    set(handles.buttonEjecutar,'enable','on');
    handles.matrix = matrix;
    guidata(hObject,handles);
end
set(handles.editTexto, 'String', respuesta);
drawnow;





function editBpv_Callback(hObject, eventdata, handles)
% hObject    handle to editBpv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBpv as text
%        str2double(get(hObject,'String')) returns contents of editBpv as a double


% --- Executes during object creation, after setting all properties.
function editBpv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBpv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTexto_Callback(hObject, eventdata, handles)
% hObject    handle to editTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTexto as text
%        str2double(get(hObject,'String')) returns contents of editTexto as a double


% --- Executes during object creation, after setting all properties.
function editTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editGensPar_Callback(hObject, eventdata, handles)
% hObject    handle to editGensPar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGensPar as text
%        str2double(get(hObject,'String')) returns contents of editGensPar as a double


% --- Executes during object creation, after setting all properties.
function editGensPar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGensPar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPorcent_Callback(hObject, eventdata, handles)
% hObject    handle to editPorcent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPorcent as text
%        str2double(get(hObject,'String')) returns contents of editPorcent as a double


% --- Executes during object creation, after setting all properties.
function editPorcent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPorcent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDecim_Callback(hObject, eventdata, handles)
% hObject    handle to editDecim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDecim as text
%        str2double(get(hObject,'String')) returns contents of editDecim as a double


% --- Executes during object creation, after setting all properties.
function editDecim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDecim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
