clear all
addpath('./PESQ');
%% GSC Beamforming
%
%  Autores -> Juan Manuel L�pez Torralba
%             Jose Manuel Garcia Gim�nez
%             Ismael Yeste Esp�n
%             Daniel Melgarejo Garc�a


% Definition of Parameters:

Fs=16000; %sampling rate
nc=15;    %number of channels
L=400;    %STFT Length
N=15;
c=340;
f=1:L/2;
win=sqrt(hanning(L)); 
win_mat = repmat(win,1,N)';
load('steering_vector.mat')

clear angle



w=(1/N)*ds.';                %%%%%%%%%%%% method Ai/N 



% ds2 = exp(j*angle(ds));       %%%%%%%%%%%%%% m�todo normalizar vector, ya
%                                       %%%%%%%% har�a falta el 1/N
% w=ds2.';



% ds2 = exp(j*angle(ds));      %%%%%%%%%%%%% M�todo 1/Ai
% w = ds2.';
% Ai = abs(ds)';


% ds2 = exp(j*angle(ds));      %%%%%%%%%%%%% M�todo Ai/ds^2
% w = ds2.';
% Ai = abs(ds)';
% mod_ds = ds * ds';
% Ai2 = (Ai/mod_ds); 

% We generate the blocking matrix

B = [zeros(1,N-1)' -1*eye(N-1)] + [eye(N-1) zeros(1,N-1)'];


%Load the signals
Leer_Array_Signals;

%Divide the message into frames
ntrama=Nsamp/(L/2);
ntrama=round(ntrama)-1;

xout=zeros(length(x{1}),1); %We create the output vector with zeros.

mat_temp = zeros(15,L/2+1);
matout = zeros(N,Nsamp);

ini=1;
ak = zeros(14,L/2+1);
%mu = 0.002271;
mu=0.0003;

for k=1:ntrama-1
   xtemp=zeros;
    for nc=1:N
        x1=fft((win.*x{nc}(ini:ini+(L-1)))); %We apply the Hanning window to each frame of each channel and we do the FFT
        
        mat_temp(nc,:) = (w(:,nc).*x1(1:(L/2)+1)).';  % auxiliary matrix to pass the synchronized channels to the blocking matrix
        
% % % % % %      This xtemp is valid for Ai / N methods 
       xtemp=xtemp+w(:,nc).*x1(1:(L/2)+1); %We multiply by the vector of weights and add each of the channels, in order to have a constructive result signal
             
                                            
                                            
% % % % % % % % % % % % % % % % % % % % % % % % % % %     Method 1/Ai                                    
%         Ainvers = (1./Ai);                                    
%         xtemp=xtemp+Ainvers(:,nc).*w(:,nc).*x1(1:(L/2)+1);                                



% % % % % % % % % % % % % % % % % % % % %  % % % % % % Method Ai/||ds||^2;
%         
%                                             
%          xtemp=xtemp+Ai2(:,nc).*w(:,nc).*x1(1:(L/2)+1); 

    end
    %matout(:,ini:ini+L-1)=matout(:,ini:ini+L-1)+win_mat.*real(ifft([mat_temp conj(mat_temp(:,end-1:-1:2))],[],1)); %Formamos la otra mitad de xtemp, hacemos la ifft y la multiplicamos por la ventana.
   
    x2 = B*mat_temp;                          % We apply the blocking matrix to the frame of the 15 channels                            
    [yout, ak] = lms_eq(ak,x2,xtemp,mu);      % customizable part is done
        
        
    xout(ini:ini+L-1)=xout(ini:ini+L-1)+win.*real(ifft([yout'; conj(yout(end-1:-1:2))'])); %We form the other half of xtemp, make the ifft and multiply it by the window.
    ini=ini+L/2;
end

% xout is the output of the Beam Forming


xfinal=xout;

%Audio Array
array = 'array.wav';
%audiowrite(array,xfinal,Fs)
audiowrite(array,xfinal/max(max(xfinal), -min(xfinal)),Fs,'BitsPerSample',16);
%soundsc(xout,Fs);

%Load signals when cleaned
fname = 'an103-mtms-senn4.adc';
fname = strcat(dir,fname);
[fid,msg] = fopen(fname,'r','b');
if fid < 0
  disp(msg);
else
  data = fread(fid,'int16');
  fclose(fid);
end
xlimpia=data;


%Audio signals clean
limpia = 'limpia.wav';
%audiowrite(limpia,xlimpia,Fs)
audiowrite(limpia,xlimpia/max(max(xlimpia),-min(xlimpia)),Fs,'BitsPerSample',16);
%Comparison
pesq=pesq(limpia,array)

soundsc(xfinal,Fs)

