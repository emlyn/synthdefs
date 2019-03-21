(
SynthDef(\testPiano, {|
	note = 52, decay = 0, release = 1,
	velcurve = 0.8, stereo_width = 0,
	out_bus = 0 |

	var n = round(note, 1);
	var tune = note - n + 0.5;
	var snd = MdaPiano.ar(freq: n.midicps, tune: tune, gate: 1, vel: 64,
		decay: decay, release: release, hard: 0.5, velhard: 0.8,
		muffle: 0.8, velmuff: 0.8, velcurve: velcurve, stereo: stereo_width,
		random: 0, stretch: 0, sustain: 0.1);
	Out.ar(out_bus, snd)}
).writeDefFile("/Users/emcorrin/dev/personal/synthdefs/compiled/")
)
