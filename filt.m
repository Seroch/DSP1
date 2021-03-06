function Hd = filt
%FILT Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.1 and the Signal Processing Toolbox 7.3.
% Generated on: 06-Oct-2016 14:31:07

% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 48000;  % Sampling Frequency

Fpass = (11025)/24000;       % Passband Frequency
Fstop = 1.2*Fpass;              % Stopband Frequency
Apass = 0.1;                    % Passband Ripple (dB)
Astop = 70;                     % Stopband Attenuation (dB)
match = 'passband';             % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
