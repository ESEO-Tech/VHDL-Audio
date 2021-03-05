
WAV=$(wildcard *.wav)
S8=$(WAV:.wav=.s8)
COE=$(WAV:.wav=.coe)

all: $(COE)

%.s8: %.wav
	# 8 bits/sample, 20000 Hz, 4 seconds
	sox $< -t s8  -r 20000 -c 1 $@  trim 0 0:4  norm

%.coe: %.s8 s8_to_coe
	./s8_to_coe $< $@

%: %.c
	gcc -o $@ $<

clean:
	rm -f $(S8)
