live_loop :beat1 do
  use_bpm 105
  play_chord [15, 20, 35], sustain: 2, release: 4, amp: 0.8

  sample :drum_bass_hard, amp: 1
  sleep 1
  sample :drum_bass_hard
  sleep 0.25
  sample :bd_boom, attack: 2, amp: 1
  sleep 0.75
  sample :drum_bass_hard
  sleep 0.75
  sample :bd_boom, attack: 2, amp: 1
  sample :drum_bass_hard
  sleep 0.25
  sample :drum_bass_hard, amp: 2
  sample :drum_bass_hard, lpf: rrand(80, 131), amp: 1
  sleep 1
end

live_loop :m1  do
  sync :beat1

  use_synth :chipbass
  play :e1, release: 4, cutoff: rrand(70, 130), pitch: rrand(-6, 6), amp: 1
  use_synth :hollow
  play :c, release: 4, pitch: rrand(1, 12)

  sleep 2

  use_synth :dark_ambience
  play :c2, release: 2, amp: rrand(1, 4), amp: 0.4
  sleep 2
end

live_loop :m2 do
  sync :beat1
  use_synth :hoover
  play :c1, release: 4, cutoff: rrand(80, 120), pitch: rrand(2, 4), amp: 0
  sleep 2
  play :c1, release: 2, cutoff: rrand(40, 80), pitch: rrand(-2, 2), amp: 0
  sleep 2
end

live_loop :m3 do
  sync :beat1

  use_synth :tb303
  play :e1, res: 0.9, release: 4, amp: 0.4, cutoff: rrand(80, 130), amp: 0
  sleep 2
  play :a1, res: 0.9, release: 2, amp: 0.4, cutoff: rrand(80, 130), amp: 0

  sleep 4
end
