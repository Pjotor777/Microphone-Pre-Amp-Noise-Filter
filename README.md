# Microphone-Pre-Amp-Noise-Filter
This project implements a cascaded analog filter system consisting of:
⋅⋅⋅⋅*A bandstop (notch) filter to suppress an unwanted 120 Hz interference tone
⋅⋅⋅⋅*A 4th-order Butterworth low-pass filter (LPF) to limit bandwidth and prevent aliasing before sampling or further digital processing

The design was simulated and analyzed in **LTspice** using Bode magnitude and phase plots to verify frequency-domain performance and phase behavior.
___
### Notch Filter
The notch filter utilized is a Fliege notch filter. The reason as to why the Fliege notch filter was used was the advantages offered as stated in Texas Instruments' "High-speed notch filters" written by Bruce Carter. As stated in the [document](https://www.ti.com/lit/an/slyt235/slyt235.pdf "High-speed notch filters"):
Only four precision components: two Rs and two Cs, are required for tuning the center frequency. One nice feature of this circuit is that slight mismatches of components are okay; the center frequency will be affected, but not the notch depth.
The Q of the filter can be adjusted independently from the center frequency by using two noncritical resistors of the same value
The center frequency of the filter can be adjusted over a narrow range without seriously eroding the depth of the notch.
