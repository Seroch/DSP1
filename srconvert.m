function out=srconvert(in)

%Sebastien Charles
%DSP Matlab project 1

L = 148;
M = 321;

x = upsample(in, L);

%Filter

Fpass = (11025/24000);          % Passband Frequency
Fstop = 1.2*Fpass;              % Stopband Frequency
Apass = 0.1;                    % Passband Ripple (dB)
Astop = 80;                     % Stopband Attenuation (dB)

h = designfilt('lowpassfir', 'PassbandFrequency', Fpass, ...
               'StopbandFrequency', Fstop, 'PassbandRipple', Apass, ...
               'StopbandAttenuation', Astop, 'SampleRate', 2, ...
               'DesignMethod', 'equiripple');

%info(h)
%fvtool(h)

%/filter
        
y = filter(h , x);

out = downsample(y, M);
