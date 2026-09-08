% LCL PWM Filter

clear all; % clear all code
close all; % close all windows
clc; % command line clear

% Load the control package for transfer functions [tf]
pkg load control

% Define filter parameters
Li = 200e-06; % Inverter side inductor 200uH example
Cf_wye = 180e-06; % Filter capacitor in wye arrangement 180uF example
Lg = 100e-06; % Grid side inductor 100uH example

% Setup a transfer function in the `s` domain [laplace]
s = tf('s');

% Transfer function for impedance [Zf]
% Doc: An Improved LCL Filter Design in Order to Ensure Stability without
% Damping and Despite Large Grid Impedance Variations, MDPI 2017
% Authors: Romdhane, Naouar, Belkhodja, Monmasson
% DOI: 10.3390/en10030336
Zf = ((Li * Lg * Cf_wye) * (s^3)) + ((Li + Lg) * s);
Hf = 1 / (((Li * Lg * Cf_wye) * (s^3)) + ((Li + Lg) * s));

% Bode plot of the impedance response
[bode_mag_1, bode_pha_1, bode_w_1] = bode(Zf);
[bode_mag_2, bode_pha_2, bode_w_2] = bode(Hf);

bode_hz_1 = bode_w_1 / (2 * pi); % Convert from rps to hz
bode_hz_2 = bode_w_2 / (2 * pi); % Convert from rps to hz
bode_mag_db_1 = 20 * (log10(bode_mag_1)); % Convert from ratio to dB
bode_mag_db_2 = 20 * (log10(bode_mag_2)); % Convert from ratio to dB

% Manual bode plots with Hz [not Rad/s]
figure
subplot(2,1,1); % Subplot 1 of (2,1)
semilogx(bode_hz_1, bode_mag_db_1, 'color', 'magenta', ':', ...
        'LineWidth', 1.0, 'DisplayName', ...
        "Impedance"); % Plot the magnitude
hold on
semilogx(bode_hz_2, bode_mag_db_2, 'color', 'blue', '-', ...
        'LineWidth', 1.0, 'DisplayName', ...
        "I_{Grid} / V_{Inv}"); % Plot the magnitude
zoom on;
grid on;
title('Bode - Zf');
ylabel('Magnitude[dB]');
legend ("location", "northeastoutside");

subplot(2,1,2); % Subplot 2 of (2,1)
semilogx(bode_hz_1, bode_pha_1, 'color', 'magenta', ':', ...
        'LineWidth', 1.0, 'DisplayName', ...
        "Impedance"); % Plot the magnitude
hold on
semilogx(bode_hz_2, bode_pha_2, 'color', 'blue', '-', ...
        'LineWidth', 1.0, 'DisplayName', ...
        "I_{Grid} / V_{Inv}"); % Plot the magnitude
grid on;
zoom on;
ylabel('Phase[deg]');
xlabel('Frequency[Hz]');
legend ("location", "northeastoutside");

