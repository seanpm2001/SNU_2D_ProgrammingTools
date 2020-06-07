<CsoundSynthesizer> ; Main Synthesizer class
  <CsOptions> ; Options section
    csound -W -d -o test.wav ; File output
  </CsOptions>
  <CsInstruments> ; Instrument section
    sr     = 96000           ; Sample rate.
    kr     = 9600            ; Control signal rate.
    ksmps  = 10              ; Samples per control signal.
    nchnls = 1               ; Number of output channels.
    instr 1 ; Instrument 1: Sine wave
    a1     oscil p4, p5, 1   ; Oscillator: p4 and p5 are the arguments from the score, 1 is the table number.
    out a1                   ; Output.
    endin
	instr 2 ; Instrument 2: Unknown
	a2     oscil p3 p6, 1
	out a2
	endin
  </CsInstruments>
  <CsScore> ; Score section
    f1 0 8192 10 1           ; Table containing a sine wave. Built-in generator 10 produces a sum of sinusoids, here only one.
    i1 0 1 20000 1000        ; Play one second of one kHz at amplitude 20000.
	e ; End?
	f2 0 25000 10 1500
	il 0 1 30000 2000        ; Play 1 second of ? kHZ at amplitute 30000 
    e ; End?
  </CsScore>
</CsoundSynthesizer>
; File version: 1 (October 24th 2019)
; First version: 1 (October 24th 2019)