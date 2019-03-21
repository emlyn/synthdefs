(
SynthDef(\testPiano, {|
	note = 52, attack = 0, decay = 0, sustain = 0, release = 1,
	attack_level = 1, decay_level = -1, sustain_level = 1, env_curve = 1,
	velcurve = 0.8, stereo_width = 0,
	out_bus = 0 |

	var decay_lev = Select.kr(decay_level < 0, [decay_level, sustain_level]);
	var n = round(note, 1);
	var tune = note - n + 0.5;
	var snd = MdaPiano.ar(freq: n.midicps, tune: tune, gate: 1, vel: 101,
		decay: decay, release: release, hard: 0, velhard: 0.8,
		muffle: 0.8, velmuff: 0.8, velcurve: velcurve, stereo: stereo_width,
		random: 0, stretch: 0, sustain: 0.1);
	var env = EnvGen.kr(Env([0, 4, -99, -99,
		attack_level,  attack,  env_curve, 0,
		decay_lev,     decay,   env_curve, 0,
		sustain_level, sustain, env_curve, 0,
		0,             release, env_curve, 0]),
	doneAction: 2);
	Out.ar(out_bus, env * snd)}
).writeDefFile("/Users/emcorrin/dev/personal/synthdefs/compiled/")
)
