% Passband: 300 Hz to 5 KHz (DC to 300Hz: dont care)
% Attenuation in the passband: to within 2 dB
% Attenuation in the stop band:
% must be at least 40 dB relative to the maximum passband
% level, at 22kHz
% i.e, passband ends at 22kHz
% -------------------------------------------------------------------------
% Form the necessary variables neede to form the transfer function
% Per instructions: 
% omega p = 5kHz = 31415.92654 rad/s, Ap = -2dB
% omega s = 22kHz = 138230.0768 rad/s, As = -40dB
% order n 
% = log10[(10^As/10 - 1)/(10^-Ap/10 - 1)] / 2log10(omegas/omegap)
Ap = 2;
omegaP = 31415.92654;
As = 40;
omegaS = 138230.0768;

% Confirm via calculations, that the order = 4
order_num = log10((10^(As/10) - 1) / (10^(Ap/10) - 1));
order_denom = 2 * log10(omegaS / omegaP);
order = order_num / order_denom;
order = ceil(order)

% Now get the cutoff frequency via both passband and stopband frequencies
% Now, find the cutoff frequency 
% Then finalize omega C via geometric average
omegaC_S = omegaS / (9999)^(0.125);
omegaC_P = omegaP / (0.584893192461)^(0.125);
omegaC = sqrt(omegaC_S * omegaC_P)

% Now, set up the butterworth filter:
[b, a] = butter(order, omegaC, 's');
w_range = logspace(1, 5, 1000);
[h_response, w_range] = freqs(b, a, w_range);
magnitude_dB = 20 * log10(abs(h_response));

% Plot
figure;
semilogx(w_range/(2*pi), magnitude_dB);
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Magnitude Response of the 4th Order Butterworth Filter');
xlim([100 100000]);
ylim([-60 20]);
grid on;