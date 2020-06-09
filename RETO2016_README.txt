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

挑战目标：增强多通道语音信号。

-与纯净的参考信号相比，增强的语音质量将使用PESQ测试进行测量（得分为0，质量差，质量为5，质量优异）。
在程序开始将采用中央通道（编号8，PESQ = 2.1752）和延迟与求和波束形成器（PESQ = 2.3741）所提供的质量。
程序：PESQ.zip是使用PESQ程序压缩的文件目录，用于质量评估。解压缩工作目录并查阅相应的“自述文件”以供使用。

-使用信号（信号目录）：
*阵列类型：线性，15个通道，不均匀（间隔d，2 * s和4 * d，d = 4cm）。
*要增强的嘈杂多通道信号（实验室噪声）为“ an103-mtms-arr4A.adc”。
*使用接近麦克风获取的单通道清洁参考信号为“ an103-mtms-senn4.adc”。
*其他信号：“ an10n-mtms-arr4A.adc”（n = 1,2,4,5）。用相同的阵列和噪声类型记录。
*信号的采集规格可在文件“ README_acquisition”中找到。

-参数：
* Fs = 16000； ％ 采样频率
* nc = 15;频道数百分比
* L = 400； STFT的长度百分比

-其他文件：
* Read_Array_Signals.m：读取多通道信号的程序。
* offsetcom.m：读取程序用于补偿直流分量的功能。
* direction_vector.mat：在所有可能的频率（k = 1：201）上包含变量ds（15x201）和转向矢量。