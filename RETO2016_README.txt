- Challenge Goal: Enhance a multi-channel voice signal.

- The quality of the enhanced voice will be measured using a PESQ test (it provides a score of 0, poor quality, at 5, excellent quality) compared to a clean reference signal. 
As a starting point, the quality provided by the central channel (num 8, PESQ = 2.1752) and a Delay-And-Sum beamformer (PESQ = 2.3741) will be taken. 
Programs: PESQ.zip is a file-directory compressed with the PESQ program for quality evaluation. Unzip in the working directory and consult the corresponding "readme" for its use.

- Signals to use (signals directory):
* Array type: linear, 15 channels, non-uniform (spaced d, 2 * s and 4 * d, d = 4cm).
* The noisy multichannel signal (laboratory noise) to enhance is "an103-mtms-arr4A.adc".
* The single-channel clean reference signal acquired with a proximity microphone is "an103-mtms-senn4.adc".
* Other signals: "an10n-mtms-arr4A.adc" (n = 1,2,4,5). Recorded with the same array and type of noise.
* The acquisition specifications of the signals can be found in the file "README_acquisition".

- Parameters:
* Fs = 16000; % sampling frequency
* nc = 15; % number of channels
* L = 400; % length of the STFT

- Additional files:
* Read_Array_Signals.m: program to read the multichannel signal.
* offsetcom.m: function used by the reading program to compensate DC components.
* steering_vector.mat: contains the variable ds (15x201) with the steering vector at all possible frequencies (k = 1: 201).

��սĿ�꣺��ǿ��ͨ�������źš�

-�봿���Ĳο��ź���ȣ���ǿ������������ʹ��PESQ���Խ��в������÷�Ϊ0�����������Ϊ5���������죩��
�ڳ���ʼ����������ͨ�������8��PESQ = 2.1752�����ӳ�����Ͳ����γ�����PESQ = 2.3741�����ṩ��������
����PESQ.zip��ʹ��PESQ����ѹ�����ļ�Ŀ¼������������������ѹ������Ŀ¼��������Ӧ�ġ������ļ����Թ�ʹ�á�

-ʹ���źţ��ź�Ŀ¼����
*�������ͣ����ԣ�15��ͨ���������ȣ����d��2 * s��4 * d��d = 4cm����
*Ҫ��ǿ�����Ӷ�ͨ���źţ�ʵ����������Ϊ�� an103-mtms-arr4A.adc����
*ʹ�ýӽ���˷��ȡ�ĵ�ͨ�����ο��ź�Ϊ�� an103-mtms-senn4.adc����
*�����źţ��� an10n-mtms-arr4A.adc����n = 1,2,4,5��������ͬ�����к��������ͼ�¼��
*�źŵĲɼ��������ļ��� README_acquisition�����ҵ���

-������
* Fs = 16000�� �� ����Ƶ��
* nc = 15;Ƶ�����ٷֱ�
* L = 400�� STFT�ĳ��Ȱٷֱ�

-�����ļ���
* Read_Array_Signals.m����ȡ��ͨ���źŵĳ���
* offsetcom.m����ȡ�������ڲ���ֱ�������Ĺ��ܡ�
* direction_vector.mat�������п��ܵ�Ƶ�ʣ�k = 1��201���ϰ�������ds��15x201����ת��ʸ����