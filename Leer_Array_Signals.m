% MULTICHANNEL DATA READING
% 16 kHz
% 16 bits per sample
% 15 canales
% Big-endian
fm = 16000; % Freq. sampling
nc = 15;    %No. of channels.
fname = 'an103-mtms-arr4A.adc';
dir = './RETO2016_TOOLS/signals/';
fname = strcat(dir,fname);
[fid,msg] = fopen(fname,'r','b');
if fid < 0
  disp(msg);
else
  data = fread(fid,'int16');
  fclose(fid);
end

% Separate channels.
nsamp=[];
for i = 1:nc
    x{i} = data(i:nc:end);
    x{i} = offsetcomp(x{i});
    nsamp(i)=length(x{i});
end
Nsamp=min(nsamp); %Number of samples to be used in all the signals



