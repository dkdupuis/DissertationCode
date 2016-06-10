function varargout = coherenceGUI(varargin)
% COHERENCEGUI MATLAB code for coherenceGUI.fig
%      COHERENCEGUI, by itself, creates a new COHERENCEGUI or raises the existing
%      singleton*.
%
%      H = COHERENCEGUI returns the handle to a new COHERENCEGUI or the handle to
%      the existing singleton*.
%
%      COHERENCEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COHERENCEGUI.M with the given input arguments.
%
%      COHERENCEGUI('Property','Value',...) creates a new COHERENCEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before coherenceGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to coherenceGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help coherenceGUI

% Last Modified by GUIDE v2.5 28-Jan-2013 12:53:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @coherenceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @coherenceGUI_OutputFcn, ...
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


% --- Executes just before coherenceGUI is made visible.
function coherenceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to coherenceGUI (see VARARGIN)

% Choose default command line output for coherenceGUI
handles.output = hObject;

axes(handles.plot1);
T=125;
dT=1.5;
handles.t=-25:dT:T;
handles.b=((2*pi)/125);
offset=.25;
phase=offset*2*pi;
handles.Ft1=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft1,'color',[1 .5 0],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider1,'value',3.5);
set(handles.ySlider1,'value',.5);


axes(handles.plot2);
offset=.25;
phase=offset*2*pi;
handles.Ft2=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft2,'color',[0 1 0],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider2,'value',3.5);
set(handles.ySlider2,'value',.5);

axes(handles.plot3);
offset=.25;
phase=offset*2*pi;
handles.Ft3=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft3,'color',[0 .5 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider3,'value',3.5);
set(handles.ySlider3,'value',.5);

axes(handles.plot4);
offset=.25;
phase=offset*2*pi;
handles.Ft4=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft4,'color',[1 0 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider4,'value',3.5);
set(handles.ySlider4,'value',.5);

a=.5;
handles.a1=.5;
handles.a2=.5;
handles.a3=.5;
handles.a4=.5;

handles.o1=phase;
handles.o2=phase;
handles.o3=phase;
handles.o4=phase;

%handles.lastPosXSlid1=.5;
%handles.lastPosXSlid2=.5;
%handles.lastPosXSlid3=.5;
%handles.lastPosXSlid4=.5;
%handles.lastPosXSlid5=.5;

% axes(handles.plot1b);
% cla;
% axis([-1 1 -1 1]);
% x=a*cos(2*pi*offset);
% y=a*sin(2*pi*offset);
% arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 .5 0],'FaceColor',[1 .5 0]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');
% 
% axes(handles.plot2b);
% cla;
% axis([-1 1 -1 1]);
% x=a*cos(2*pi*offset);
% y=a*sin(2*pi*offset);
% arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 1 0],'FaceColor',[0 1 0]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');
% 
% axes(handles.plot3b);
% cla;
% axis([-1 1 -1 1]);
% x=a*cos(2*pi*offset);
% y=a*sin(2*pi*offset);
% arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 .5 1],'FaceColor',[0 .5 1]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');
% 
% axes(handles.plot4b);
% cla;
% axis([-1 1 -1 1]);
% x=a*cos(2*pi*offset);
% y=a*sin(2*pi*offset);
% arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 0 1],'FaceColor',[1 0 1]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');
% 
% axes(handles.avgSigMag);
% cla;
% avgSig=(handles.a1+handles.a2+handles.a3+handles.a4)/4;
% axis([-1 1 -1 1]);
% x=avgSig*cos(2*pi*offset);
% y=avgSig*sin(2*pi*offset);
% arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*avgSig+8),'Width', 2*avgSig+1.5, 'EdgeColor','k','FaceColor','k');
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');


axes(handles.coherence);
cla;
axis([-1 1 -1 1]);

handles.showRight=0;

% x=.25*cos(handles.o1);
% y=.25*sin(handles.o1);
% arrow('Start',[0 0],'Stop',[x y],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[1 .5 0]);
% hold on;
% x2=.25*cos(handles.o1)+x;
% y2=.25*sin(handles.o1)+y;
% arrow('Start',[x y],'Stop',[x2 y2],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[0 1 0]);
% hold on;
% x3=.25*cos(handles.o1)+x2;
% y3=.25*sin(handles.o1)+y2;
% arrow('Start',[x2 y2],'Stop',[x3 y3],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[0 .5 1]);
% hold on;
% x4=.25*cos(handles.o1)+x3;
% y4=.25*sin(handles.o1)+y3;
% arrow('Start',[x3 y3],'Stop',[x4 y4],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[1 0 1]);
% hold on;
% viscircles([0 0],1,'EdgeColor','k');
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');


%%Plotting arrows via annotation
% axes(handles.plot1b);
% %viscircles([0 0],1);
% a=.5;
% d=.25;
% pos=get(handles.plot1b,'Position');
% handles.scale=pos(3);
% handles.midX1=pos(1)+.5*handles.scale;
% handles.midY1=pos(2)+.5*handles.scale;
% x=handles.scale*((a*cos(2*pi*d))/2)+handles.midX1;
% y=handles.scale*((a*sin(2*pi*d))/2)+handles.midY1;
% annotation('arrow',[handles.midX1 x],[handles.midY1 y],'color',[1 .5 0],'linewidth',2);
% 
% axis([-1 1 -1 1]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');

reCalcSummary(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes coherenceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = coherenceGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function reCalcSummary(handles)
axes(handles.plotAvg);

totSum=sum(vertcat(handles.Ft1,handles.Ft2,handles.Ft3,handles.Ft4),1);
plot(handles.t,totSum,'color','k','LineWidth',2);
axis([-25 125 -4 4]);
line([0 0],[-4 4],'color','k');
line([100 100],[-4 4],'color','k');

set(gca,'ytick',[]);
%%set(gca,'xtick',[]);

avgAmp=0;
for i=17:1:83   
    avgAmp=avgAmp+totSum(i);    
end

set(handles.avgAmp,'String',[num2str(round(100*avgAmp)/100) 'm']);



if(handles.showRight==1)
    
    axes(handles.avgSigMag);
    cla;
    avgSig=(handles.a1+handles.a2+handles.a3+handles.a4)/4;
    axis([-1 1 -1 1]);
    x=0;
    y=avgSig;
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*avgSig+8),'Width', 2*avgSig+1.5, 'EdgeColor','k','FaceColor','k');
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');

    axes(handles.coherence);
    cla;
    axis([-1 1 -1 1]);
    
    
    x=.25*cos(handles.o1);
    y=.25*sin(handles.o1);
    arrow('Start',[0 0],'Stop',[x y],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[1 .5 0]);
    hold on;
    x2=.25*cos(handles.o2)+x;
    y2=.25*sin(handles.o2)+y;
    arrow('Start',[x y],'Stop',[x2 y2],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[0 1 0]);
    hold on;
    x3=.25*cos(handles.o3)+x2;
    y3=.25*sin(handles.o3)+y2;
    arrow('Start',[x2 y2],'Stop',[x3 y3],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[0 .5 1]);
    hold on;
    x4=.25*cos(handles.o4)+x3;
    y4=.25*sin(handles.o4)+y3;
    arrow('Start',[x3 y3],'Stop',[x4 y4],'Length',11,'Width',2, 'EdgeColor','k','FaceColor',[1 0 1]);
    hold on;
    viscircles([0 0],1,'EdgeColor','k');
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');

    set(handles.avgSig,'String',round(100*avgSig)/100);
    set(handles.avgCoherence,'String',round(100*sqrt(x4*x4+y4*y4))/100);
    
end


% --- Executes on slider movement.
function xSlider1_Callback(hObject, eventdata, handles)
% hObject    handle to xSlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(handles.ySlider1,'Value');

axes(handles.plot1);
offset=-get(hObject, 'Value')-.25;
phase=offset*2*pi;

handles.o1=phase;
handles.Ft1=a*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft1,'color',[1 .5 0],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot1b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(offset*2*pi);
    y=a*sin(offset*2*pi);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 .5 0],'FaceColor',[1 .5 0]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');
    
end

reCalcSummary(handles);


% --- Executes during object creation, after setting all properties.
function xSlider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xSlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xSlider2_Callback(hObject, eventdata, handles)
% hObject    handle to xSlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(handles.ySlider2,'Value');

 pos=get(hObject,'Value');
% if(pos==1 && handles.lastPosXSlid2>=.99)
%     set(hObject,'Value',.01);
%     pos=.01;
% else if (pos==0 && handles.lastPosXSlid2<=.01)
%         set(hObject,'Value',.99);
%         pos=.99;
%     end
% end
% 
% handles.lastPosXSlid2=pos;
% last=handles.lastPosXSlid2;

axes(handles.plot2);
offset=-pos-.25;
phase=offset*2*pi;
handles.Ft2=a*sin(handles.b*handles.t+phase);
handles.o2=phase;
plot(handles.t,handles.Ft2,'color',[0 1 0],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot2b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 1 0],'FaceColor',[0 1 0]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');

end

reCalcSummary(handles);


% --- Executes during object creation, after setting all properties.
function xSlider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xSlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xSlider3_Callback(hObject, eventdata, handles)
% hObject    handle to xSlider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(handles.ySlider3,'Value');
axes(handles.plot3);
offset=-get(hObject, 'Value')-.25;
phase=offset*2*pi;
handles.Ft3=a*sin(handles.b*handles.t+phase);
handles.o3=phase;
plot(handles.t,handles.Ft3,'color',[0 .5 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot3b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 .5 1],'FaceColor',[0 .5 1]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');
    
end

reCalcSummary(handles);

% --- Executes during object creation, after setting all properties.
function xSlider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xSlider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xSlider4_Callback(hObject, eventdata, handles)
% hObject    handle to xSlider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(handles.ySlider4,'Value');
axes(handles.plot4);
offset=-get(hObject, 'Value')-.25;
phase=offset*2*pi;
handles.Ft4=a*sin(handles.b*handles.t+phase);
handles.o4=phase;
plot(handles.t,handles.Ft4,'color',[1 0 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot4b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 0 1],'FaceColor',[1 0 1]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');
    
end

reCalcSummary(handles);

% --- Executes during object creation, after setting all properties.
function xSlider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xSlider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ySlider1_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(hObject,'Value');
handles.a1=a;
axes(handles.plot1);
offset=-get(handles.xSlider1, 'Value')-.25;
phase=offset*2*pi;
handles.Ft1=a*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft1,'color',[1 .5 0],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot1b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(offset*2*pi);
    y=a*sin(offset*2*pi);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 .5 0],'FaceColor',[1 .5 0]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');

end
reCalcSummary(handles);

% --- Executes during object creation, after setting all properties.
function ySlider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ySlider2_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(hObject,'Value');
handles.a2=a;
axes(handles.plot2);
offset=-get(handles.xSlider2, 'Value')-.25;
phase=offset*2*pi;
handles.Ft2=a*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft2,'color',[0 1 0],'LineWidth',2);
axis([-25 125 -1 1]);
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot2b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 1 0],'FaceColor',[0 1 0]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');

end

reCalcSummary(handles);

% --- Executes during object creation, after setting all properties.
function ySlider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ySlider3_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(hObject,'Value');
handles.a3=a;
axes(handles.plot3);
offset=-get(handles.xSlider3, 'Value')-.25;
phase=offset*2*pi;
handles.Ft3=a*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft3,'color',[0 .5 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot3b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 .5 1],'FaceColor',[0 .5 1]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');
    
end

reCalcSummary(handles);

% --- Executes during object creation, after setting all properties.
function ySlider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ySlider4_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a=get(hObject,'Value');
handles.a4=a;
axes(handles.plot4);
offset=-get(handles.xSlider4, 'Value')-.25;
phase=offset*2*pi;
handles.Ft4=a*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft4,'color',[1 0 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
guidata(hObject,handles);

if(handles.showRight==1)
    
    axes(handles.plot4b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 0 1],'FaceColor',[1 0 1]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');
    
end

reCalcSummary(handles);

% --- Executes during object creation, after setting all properties.
function ySlider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function plot1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot1


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Show.
function Show_Callback(hObject, eventdata, handles)
% hObject    handle to Show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.showRight=1;
set(handles.plot1b,'Visible','On');
set(handles.plot2b,'Visible','On');
set(handles.plot3b,'Visible','On');
set(handles.plot4b,'Visible','On');
set(handles.avgSigMag,'Visible','On');
set(handles.coherence,'Visible','On');
set(handles.text4,'Visible','On');
set(handles.avgSig,'Visible','On');
set(handles.text6,'Visible','On');
set(handles.text10,'Visible','On');
set(handles.avgCoherence,'Visible','On');
set(handles.Show,'Visible','Off');


a=handles.a1;
offset=-get(handles.xSlider1, 'Value')-.25;

% axes(handles.plot1b);
% cla;
% axis([-1 1 -1 1]);
% x=a*cos(offset*2*pi);
% y=a*sin(offset*2*pi);
% arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 .5 0],'FaceColor',[1 .5 0]);
% set(gca,'ytick',[]);
% set(gca,'xtick',[]);
% set(gca, 'Box', 'on');

a=handles.a1;
offset=-get(handles.xSlider1, 'Value')-.25;
axes(handles.plot1b);
cla;
axis([-1 1 -1 1]);
x=a*cos(2*pi*offset);
y=a*sin(2*pi*offset);
arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 .5 0],'FaceColor',[1 .5 0]);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
set(gca, 'Box', 'on');


a=handles.a2;
offset=-get(handles.xSlider2, 'Value')-.25;
axes(handles.plot2b);
cla;
axis([-1 1 -1 1]);
x=a*cos(2*pi*offset);
y=a*sin(2*pi*offset);
arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 1 0],'FaceColor',[0 1 0]);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
set(gca, 'Box', 'on');

a=handles.a3;
offset=-get(handles.xSlider3, 'Value')-.25;
axes(handles.plot3b);
cla;
axis([-1 1 -1 1]);
x=a*cos(2*pi*offset);
y=a*sin(2*pi*offset);
arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 .5 1],'FaceColor',[0 .5 1]);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
set(gca, 'Box', 'on');

a=handles.a4;
offset=-get(handles.xSlider4, 'Value')-.25;
axes(handles.plot4b);
cla;
axis([-1 1 -1 1]);
x=a*cos(2*pi*offset);
y=a*sin(2*pi*offset);
arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 0 1],'FaceColor',[1 0 1]);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
set(gca, 'Box', 'on');

reCalcSummary(handles);


guidata(hObject,handles);
%xSlider1_Callback(hObject,eventdata,handles);
%xSlider2_Callback(hObject,eventdata,handles);
%xSlider3_Callback(hObject,eventdata,handles);
%xSlider4_Callback(hObject,eventdata,handles);


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.plot1);
T=125;
dT=1.5;
handles.t=-25:dT:T;
handles.b=((2*pi)/125);
offset=.25;
phase=offset*2*pi;
handles.Ft1=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft1,'color',[1 .5 0],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider1,'value',3.5);
set(handles.ySlider1,'value',.5);


axes(handles.plot2);
offset=.25;
phase=offset*2*pi;
handles.Ft2=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft2,'color',[0 1 0],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider2,'value',3.5);
set(handles.ySlider2,'value',.5);

axes(handles.plot3);
offset=.25;
phase=offset*2*pi;
handles.Ft3=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft3,'color',[0 .5 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider3,'value',3.5);
set(handles.ySlider3,'value',.5);

axes(handles.plot4);
offset=.25;
phase=offset*2*pi;
handles.Ft4=.5*sin(handles.b*handles.t+phase);
plot(handles.t,handles.Ft4,'color',[1 0 1],'LineWidth',2);
axis([-25 125 -1 1])
set(gca,'ytick',[]);
%set(gca,'xtick',[]);
set(handles.xSlider4,'value',3.5);
set(handles.ySlider4,'value',.5);

handles.a1=.5;
handles.a2=.5;
handles.a3=.5;
handles.a4=.5;

handles.o1=phase;
handles.o2=phase;
handles.o3=phase;
handles.o4=phase;

if(handles.showRight==1)

    a=handles.a1;
    offset=-get(handles.xSlider1, 'Value')-.25;
    axes(handles.plot1b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 .5 0],'FaceColor',[1 .5 0]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');


    a=handles.a2;
    offset=-get(handles.xSlider2, 'Value')-.25;
    axes(handles.plot2b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 1 0],'FaceColor',[0 1 0]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');

    a=handles.a3;
    offset=-get(handles.xSlider3, 'Value')-.25;
    axes(handles.plot3b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[0 .5 1],'FaceColor',[0 .5 1]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');

    a=handles.a4;
    offset=-get(handles.xSlider4, 'Value')-.25;
    axes(handles.plot4b);
    cla;
    axis([-1 1 -1 1]);
    x=a*cos(2*pi*offset);
    y=a*sin(2*pi*offset);
    arrow('Start',[0 0],'Stop',[x y],'Length',max(15,12*a+8),'Width', 2*a+1.5, 'EdgeColor',[1 0 1],'FaceColor',[1 0 1]);
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    set(gca, 'Box', 'on');
    
end


guidata(hObject,handles);
reCalcSummary(handles);
