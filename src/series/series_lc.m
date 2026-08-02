% Series LC Filter

clear all; % clear all code
close all; % close all windows
clc; % command line clear

% Load the control package for transfer functions [tf]
pkg load control

% Define filter parameters
C = 20e-06;
L = 80e-06;
R = 0.1;

% Setup a transfer function in the `s` domain [laplace]
s = tf('s');

% Transfer function for impedance [Zf]
Zf = (L * s) + (1 /  (C * s)) + R;

% Bode plot of the impedance response
[bode_mag, bode_pha, bode_w] = bode(Zf);

bode_hz = bode_w / (2 * pi); % Convert from rps to hz
bode_mag_db = 20 * (log10(bode_mag)); % Convert from ratio to dB

% Manual bode plots with Hz [not Rad/s]
figure
subplot(2,1,1); % Subplot 1 of (2,1)
semilogx(bode_hz, bode_mag_db); % Plot the magnitude
zoom on;
grid on;
title('Bode - Zf');
ylabel('Magnitude[dB]');

subplot(2,1,2); % Subplot 2 of (2,1)
semilogx(bode_hz, bode_pha); % Plot the phase
grid on;
zoom on;
ylabel('Phase[deg]');
xlabel('Frequency[Hz]');

% Manually calculating the filter impedance at some frequency of interest.
% Note, to calculate Zf (Ohms) from the bode plot: Zf = 10^(dB/20) or ...
% Note, to calculate dB from the Cf calculation = 20*Log(Zf)
f = 4000; % What frequency do we want to calculate the filter impedance?
% L & C in series
Zf_Ohms = abs(((1/(2*pi*f*C))*(-i)) + ((2*pi*f*L)*(i)) + R);
