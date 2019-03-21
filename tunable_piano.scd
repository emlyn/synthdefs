(
SynthDef(\testPiano, {|
	note = 52, attack = 0, decay = 0, sustain = 0, release = 1,
	attack_level = 1, decay_level = -1, sustain_level = 1, env_curve = 1,
	vel = 0.2, hard = 0.5, velcurve = 0.8, stereo_width = 0,
	out_bus = 0 |

	var decay_lev = Select.kr(decay_level < 0, [decay_level, sustain_level]);
	var note_ = round(note, 1);
	var tune = note - note_ + 0.5;
	var vel_ = vel.clip(0, 1).linlin(0, 1, 0, 4 * 127);
	var hard_ = hard.clip(0, 1).linlin(0, 1, -3, 3);
	var snd = MdaPiano.ar(freq: note_.midicps, tune: tune, gate: 1, vel: vel_,
		decay: decay, release: release, hard: hard_, velhard: 0.8,
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
