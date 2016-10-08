function out=srconvert(in)

%Sebastien Charles
%DSP Matlab project 1

L = 320;
M = 147;

x1 = upsample(in, 5);

h1 = designfilt('lowpassfir', 'PassbandFrequency', 1/5, ...
               'StopbandFrequency', (1.2/5), 'PassbandRipple', 0.1, ...
               'StopbandAttenuation', 70, 'DesignMethod', 'equiripple');
           
x2 = fftfilt(h1 , x1);

x2 = upsample(x2, 8);

h2 = designfilt('lowpassfir', 'PassbandFrequency', 1/8, ...
               'StopbandFrequency', (1.2/8), 'PassbandRipple', 0.1, ...
               'StopbandAttenuation', 70, 'DesignMethod', 'equiripple');
           
x3 = fftfilt(h2 , x2);
           
x3 = upsample(x3, 8);

h3 = designfilt('lowpassfir', 'PassbandFrequency', 1/8, ...
               'StopbandFrequency', (1.2/8), 'PassbandRipple', 0.1, ...
               'StopbandAttenuation', 70, 'DesignMethod', 'equiripple');

           
y = fftfilt(h3 , x3);

out = downsample(y, M);

