function varargout = zoomimage(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zoomimage_OpeningFcn, ...
                   'gui_OutputFcn',  @zoomimage_OutputFcn, ...
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
function zoomimage_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = zoomimage_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function pushbutton1_Callback(hObject, eventdata, handles)
[a, b]=uigetfile ({'*.*', 'All files'});
img=imread ([b a]);
handles.img=img;
guidata(hObject,handles)
imshow (img, 'Parent', handles.axes1);

% ----------------------------KODLAMALARIM--------------------------------%
%YAKINLAÞTIRMA
function pushbutton2_Callback(hObject, eventdata, handles)
img = handles.img;
i=1;
j=1;
zoom=uint8(zeros(size(img,1)*2,size(img,2)*2,3));
for m=1:(size(img,1))*2
    for n=1:(size(img,2))*2
        if((m+1)<=size(img,1) && (n+1)<=size(img,2))
            a=img(m,n,1)/4;
            b=img(m,n+1,1)/4;
            c=img(m+1,n,1)/4;
            d=img(m+1,n+1,1)/4;
            zoom(i,j,1)=a+b+c+d;
            zoom(i,j+1,1)=a+b+c+d;
            zoom(i+1,j,1)=a+b+c+d;
            zoom(i+1,j+1,1)=a+b+c+d;


            a=img(m,n,2)/4;
            b=img(m,n+1,2)/4;
            c=img(m+1,n,2)/4;
            d=img(m+1,n+1,2)/4;
            zoom(i,j,2)=a+b+c+d;
            zoom(i,j+1,2)=a+b+c+d;
            zoom(i+1,j,2)=a+b+c+d;
            zoom(i+1,j+1,2)=a+b+c+d;


            a=img(m,n,3)/4;
            b=img(m,n+1,3)/4;
            c=img(m+1,n,3)/4;
            d=img(m+1,n+1,3)/4;
            zoom(i,j,3)=a+b+c+d;
            zoom(i,j+1,3)=a+b+c+d;
            zoom(i+1,j,3)=a+b+c+d;
            zoom(i+1,j+1,3)=a+b+c+d;

        end
        j=j+2;
    end
    j=1;
    i=i+2;
end
display(size(img));
display(size(zoom));
display('-------------------------------------------------------------------');
figure;
imshow (zoom);
handles.img=zoom;
guidata(hObject,handles)


% --- Executes on button press in pushbutton4.
%UZAKLAÞTIRMA
function pushbutton4_Callback(hObject, eventdata, handles)
img = handles.img;
i=1;
j=1;
zoom=uint8(ones(size(img,1)/2,size(img,2)/2,3));
for m=1:2:size(img,1)
    for n=1:2:size(img,2)
        
        zoom(i,j,1)=img(m,n,1);

        zoom(i,j,2)=img(m,n,2);

        zoom(i,j,3)=img(m,n,3);

        j=j+1;
    end
    j=1;
    i=i+1;
end
display(size(img));
display(size(zoom));
display('-------------------------------------------------------------------');
figure;
imshow(zoom);
handles.img=zoom;
guidata(hObject,handles)
